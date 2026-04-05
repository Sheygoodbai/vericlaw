---
summary: "Ready-to-submit Product Hunt listing, maker comment, comment replies, and launch-day timing for VeriClaw 爪印"
read_when:
  - Preparing a real Product Hunt launch page
  - Scheduling a Product Hunt launch from China or another non-Pacific timezone
  - Needing ready-to-paste Product Hunt listing fields and replies
title: "Product Hunt Launch Pack"
---

# Product Hunt launch pack

Pack date:
`2026-04-05`

Use this file when you are ready to create the `Product Hunt` submission for
`VeriClaw 爪印`.

This pack assumes the current public posture is still true:

- GitHub is the live public launch surface
- the landing page is the cleanest explanation surface
- the Apple companion story is real, but should not be presented as if the App
  Store rollout is already public if that has not happened yet

## Recommended listing setup

### Product name

`VeriClaw 爪印`

### Primary URL

Use the landing page as the main listing URL:

`https://sheygoodbai.github.io/vericlaw/`

Supporting links to mention in the maker comment:

- repository:
  `https://github.com/Sheygoodbai/vericlaw`
- latest release:
  `https://github.com/Sheygoodbai/vericlaw/releases/latest`
- download page:
  `https://sheygoodbai.github.io/vericlaw/download/`

### Tagline options

Pick one of these:

- `Correction-first companion for drifting AI agents`
- `Apple-native correction workspace for AI agent drift`
- `Turn bot drift into evidence, diagnosis, and correction`

Recommended default:

- `Correction-first companion for drifting AI agents`

### Short description

Keep this within the current `260` character field.

Recommended default:

`VeriClaw 爪印 is an Apple-native correction workspace for AI agents. It turns hallucination, fake completion, overreach, and role drift into a usable loop: evidence, diagnosis, intervention, verification, and casebook learning.`

Character count:

- `225`

### Topic selection

Check the closest current topics in the submission flow:

- `AI Agents`
- `Engineering & Development`
- `Productivity` or `AI Workflow Automation`

### CTA framing

What the listing should make easy:

- understand the correction-first thesis fast
- open the landing page
- click through to GitHub or the release
- leave feedback about real failure modes

## Gallery plan

Use a 5-part gallery sequence so the listing tells a story, not just shows
screens.

### Asset 1: poster card

Use:

- [social-preview-brand.png](../assets/social-preview-brand.png)

Role:

- instant category recognition
- strongest branded first impression

### Asset 2: drift pressure screenshot

Recommended source:

- `docs/assets/screenshots/04-context-dashboard.png`

Caption direction:

- `See drift pressure before it becomes invisible`

### Asset 3: role-aware follow-up screenshot

Recommended source:

- `docs/assets/screenshots/03-role-aware-followup.png`

Caption direction:

- `Diagnose role drift and choose the next intervention`

### Asset 4: settings or evidence workflow screenshot

Recommended source:

- `docs/assets/screenshots/02-review-settings.png`

Caption direction:

- `Open a case, not just a log`

### Asset 5: repo or release proof

Use either:

- a clean GitHub release screenshot
- or a stitched image showing the landing page + repo links

Role:

- prove there is a real public surface now

## Maker first comment

Use this as the default first comment under the listing.

Do not ask for upvotes directly.
Ask for product feedback, clarity feedback, and real use cases.

```text
Hi Product Hunt, I’m the maker behind VeriClaw 爪印.

I built it around a problem I kept seeing in agent workflows: once a bot drifts, hallucinates, fake-completes, or breaks role discipline, teams often get visibility but not a usable correction loop.

VeriClaw is my attempt to make that loop concrete:
evidence -> diagnosis -> intervention -> verification -> casebook

The current public launch surface is GitHub-first:
https://github.com/Sheygoodbai/vericlaw

Landing page:
https://sheygoodbai.github.io/vericlaw/

If you take a look, I’d especially love feedback on:
- whether the correction-first story is immediately clear
- whether the role-drift framing feels useful
- which real failure mode you would want this to catch first
```

## Comment reply bank

Use these to reply quickly without sounding canned.

### `What makes this different from agent monitoring tools?`

```text
The main difference is that I’m not trying to stop at visibility. VeriClaw is designed around the next step after drift is noticed: evidence, diagnosis, intervention, verification, and casebook learning. The goal is correction, not just observation.
```

### `Is this replacing OpenClaw?`

```text
No. It is a companion layer, not a replacement. OpenClaw remains the runtime and gateway. VeriClaw adds the Apple-native supervision and correction surface around that workflow.
```

### `Is this live in the App Store?`

```text
Not yet. The current public launch surface is GitHub first while the Apple companion continues through hardening and submission work in parallel.
```

### `Who is this for right now?`

```text
The best early fit is people already working with agent workflows who care about bot drift, hallucination, fake completion, role discipline, and correction loops rather than monitoring alone.
```

### `What should I click first?`

```text
I’d start with the landing page for the fast explanation, then open the GitHub release or repo if you want the current public package and launch materials.
```

## Launch-day operating plan

Product Hunt’s scheduled launch flow uses Pacific Time.
Because you are in `Asia/Shanghai`, the live time needs to be planned against
China Standard Time too.

Important date-specific note:

- on `April 5, 2026`, `12:01am` Pacific local time is `3:01pm` in
  `Asia/Shanghai`

If you launch on another date later in the year, re-check the Pacific-to-China
offset because US daylight saving time changes the conversion.

### T-24 hours

- final QA on landing page, GitHub release, and download page
- verify the social preview image renders correctly
- preload your first comment into a note so you can paste it instantly
- confirm all gallery assets are export-ready

### T-1 hour

- open the submission draft and re-check all links
- prepare warm contacts you will notify after the listing is live
- prepare one founder post on X or LinkedIn, but do not publish it yet

### Launch moment

- publish or let the scheduled listing go live
- paste the maker first comment immediately
- confirm the landing page and GitHub links open correctly from the listing

### First 4 hours

- reply to every legitimate comment quickly
- note which phrasing causes confusion
- use that feedback to sharpen later reposts

### Same-day second wave

- share the Product Hunt link once from your founder account
- send direct messages asking for honest feedback, not votes
- if you quote the launch elsewhere, link back to the Product Hunt page and the
  landing page together

## Founder post for launch day

Use this when the listing is live:

```text
VeriClaw 爪印 is live on Product Hunt.

It’s a correction-first companion for drifting AI agents:
evidence -> diagnosis -> intervention -> verification

If the direction feels relevant, I’d love blunt feedback on the launch and the product story:
https://www.producthunt.com/
```

Replace the bare Product Hunt root link with the final listing URL once the
page is live.

## Metrics to capture from the launch

Log these before the day ends:

- Product Hunt visitors
- comments
- referrals to landing page
- referrals to GitHub
- stars gained during launch day
- release clicks or downloads
- best qualitative comment
- most common confusion

## Abort conditions

Delay the Product Hunt launch if any of these are still true:

- the landing page positioning is still changing hourly
- the screenshots feel unfinished
- the GitHub release is not public yet
- the team cannot reply to comments during the first hours
- the launch would accidentally imply the Apple public rollout is already live

## Related files

- [channel-execution-plan.md](channel-execution-plan.md)
- [distribution-post-templates.md](distribution-post-templates.md)
- [github-launch-kit.md](github-launch-kit.md)
- [growth-copy-deck.md](growth-copy-deck.md)
