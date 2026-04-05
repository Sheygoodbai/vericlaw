---
summary: "Operator checklist for a GitHub-first public launch of OpenClaw + VeriClaw"
read_when:
  - Preparing the public GitHub release first
  - Verifying the repository-facing launch surface
  - Handing GitHub launch work between product, engineering, and ops
title: "GitHub Publish Checklist"
---

# GitHub publish checklist

Use this checklist when GitHub is the first public launch surface.

Current positioning:

- `OpenClaw` remains the runtime and gateway
- `VeriClaw 爪印` is the Apple-native correction companion
- GitHub is public first
- Apple submission continues in parallel and should not be falsely presented as already live

## Repository-facing checklist

- README hero and launch section mention `VeriClaw 爪印` clearly
- repository description, homepage, and topics are refreshed for `AI agent correction`, `LLM supervision`, and `OpenClaw companion` discovery
- GitHub Pages landing page is live from `/docs`
- social preview image is configured in repository settings if a stronger share card is needed
- GitHub release body is ready from
  [github-release-announcement.md](github-release-announcement.md)
- copy deck is aligned in
  [github-launch-kit.md](github-launch-kit.md)
- release art text is aligned in
  [growth-copy-deck.md](growth-copy-deck.md)
- first-wave forwarding copy is ready in
  [distribution-post-templates.md](distribution-post-templates.md)
- legal/IP pack is present at repo root:
  - [LICENSE](../../LICENSE)
  - [NOTICE](../../NOTICE)
  - [ATTRIBUTION.md](../../ATTRIBUTION.md)
  - [TRADEMARKS.md](../../TRADEMARKS.md)
  - [PATENTS.md](../../PATENTS.md)
  - [INFRINGEMENT.md](../../INFRINGEMENT.md)
  - [LEGAL_ENFORCEMENT.md](../../LEGAL_ENFORCEMENT.md)
  - [PRIVACY.md](../../PRIVACY.md)
  - [SUPPORT.md](../../SUPPORT.md)

## Message discipline

- say `companion, not clone`
- say `correction, not just monitoring`
- keep `professional-role drift` in the story
- do not claim the App Store path is already public unless it truly is
- do not claim watchOS is in the current launch scope

## Operator checklist

1. Confirm the branch/commit you want public is actually the intended launch snapshot.
2. Confirm the version/tag you plan to publish is newer than the latest existing GitHub release.
3. Publish or draft the GitHub release body from
   [github-release-announcement.md](github-release-announcement.md).
4. Confirm the landing page, README, and release page all point to the same CTA path.
5. If no native binary asset is public yet, route downloads to the release page or source ZIP without implying a native installer exists.
6. Recheck the top-level README after push on the live GitHub page.
7. If Apple is still pending, explicitly state `GitHub-first` in any release note, discussion, or pinned update.
8. Post at least one real distribution message from the first-wave templates instead of waiting for organic discovery alone.

## Scope caution

This repository is the public GitHub launch surface. Do not imply it is the
canonical OpenClaw runtime repository.
