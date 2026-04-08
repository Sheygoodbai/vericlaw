#!/usr/bin/env python3
from __future__ import annotations

import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path


REPO_DIR = Path(__file__).resolve().parents[1]
DOCS_DIR = REPO_DIR / "docs"
ATOM_PATH = DOCS_DIR / "atom.xml"
ROUTE_INDEX_PATH = DOCS_DIR / "route-index.json"
SITEMAP_PATH = DOCS_DIR / "sitemap-supplemental.xml"

SITE_PREFIX = "https://sheygoodbai.github.io/vericlaw/"
CORE_PAGES = [
    DOCS_DIR / "use-cases" / "index.html",
    DOCS_DIR / "ai-work-hallucination" / "index.html",
    DOCS_DIR / "support" / "index.html",
]


def fail(message: str) -> None:
    print(f"FAIL: {message}")
    raise SystemExit(1)


def require(condition: bool, message: str) -> None:
    if not condition:
        fail(message)


def local_path_for_url(url: str) -> Path:
    require(url.startswith(SITE_PREFIX), f"unexpected URL outside site prefix: {url}")
    relative = url.removeprefix(SITE_PREFIX)
    target = DOCS_DIR / relative
    if target.is_dir():
        return target / "index.html"
    if url.endswith("/"):
        return target / "index.html"
    return target


def check_route_index() -> list[str]:
    data = json.loads(ROUTE_INDEX_PATH.read_text())
    require(data.get("site") == SITE_PREFIX, "route-index.json site prefix mismatch")
    require(isinstance(data.get("routes"), list) and data["routes"], "route-index.json has no routes")

    route_urls = []
    for route in data["routes"]:
        url = route.get("url")
        require(isinstance(url, str) and url.startswith(SITE_PREFIX), f"invalid route URL: {url}")
        local_path = local_path_for_url(url)
        require(local_path.exists(), f"missing local file for route URL: {url}")
        route_urls.append(url)
    return route_urls


def check_atom() -> list[str]:
    ns = {"atom": "http://www.w3.org/2005/Atom"}
    root = ET.fromstring(ATOM_PATH.read_text())
    entries = root.findall("atom:entry", ns)
    require(entries, "atom.xml has no entries")

    entry_urls = []
    for entry in entries:
        link = entry.find("atom:link", ns)
        require(link is not None, "atom.xml entry missing link")
        href = link.attrib.get("href", "")
        require(href.startswith(SITE_PREFIX), f"atom.xml entry outside site prefix: {href}")
        local_path = local_path_for_url(href)
        require(local_path.exists(), f"missing local file for atom.xml entry: {href}")
        updated = entry.findtext("atom:updated", default="", namespaces=ns)
        require(bool(updated), f"atom.xml entry missing updated timestamp: {href}")
        entry_urls.append(href)
    return entry_urls


def check_sitemap() -> list[str]:
    ns = {"sm": "http://www.sitemaps.org/schemas/sitemap/0.9"}
    root = ET.fromstring(SITEMAP_PATH.read_text())
    urls = []
    for loc in root.findall(".//sm:loc", ns):
        url = (loc.text or "").strip()
        require(url.startswith(SITE_PREFIX), f"sitemap URL outside site prefix: {url}")
        local_path = local_path_for_url(url)
        require(local_path.exists(), f"missing local file for sitemap URL: {url}")
        urls.append(url)
    require(urls, "sitemap-supplemental.xml has no URLs")
    return urls


def check_core_pages() -> None:
    for page in CORE_PAGES:
        text = page.read_text()
        require('href="https://sheygoodbai.github.io/vericlaw/atom.xml"' in text, f"missing atom feed link in {page}")
        require('href="https://sheygoodbai.github.io/vericlaw/route-index.json"' in text, f"missing route index link in {page}")


def main() -> int:
    route_urls = set(check_route_index())
    atom_urls = set(check_atom())
    sitemap_urls = set(check_sitemap())
    check_core_pages()

    require(
        "https://sheygoodbai.github.io/vericlaw/use-cases/" in route_urls,
        "route-index.json missing use-cases route",
    )
    require(
        "https://sheygoodbai.github.io/vericlaw/ai-work-hallucination/" in route_urls,
        "route-index.json missing ai-work-hallucination route",
    )
    require(route_urls.issubset(atom_urls | sitemap_urls), "some route-index URLs are not represented in atom.xml or sitemap-supplemental.xml")

    print("OK: discovery assets are internally consistent")
    print(f"route-index URLs: {len(route_urls)}")
    print(f"atom entries: {len(atom_urls)}")
    print(f"sitemap URLs: {len(sitemap_urls)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
