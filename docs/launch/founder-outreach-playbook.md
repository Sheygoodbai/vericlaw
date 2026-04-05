---
summary: "Warm outreach templates, audience segmentation, and a simple follow-up tracker for the first 30 VeriClaw launch conversations"
read_when:
  - Sending founder DMs after the public launch
  - Asking for honest forwarding help without sounding transactional
  - Tracking which outreach conversations actually create clicks or feedback
title: "Founder Outreach Playbook"
---

# Founder outreach playbook

Playbook date:
`2026-04-05`

This file is for the first `15` to `30` direct conversations after launch.

Use it when you want:

- better feedback than broad social posts usually produce
- early stars, forks, citations, and issue reports from relevant people
- warmer forwarding loops into adjacent communities

## Outreach rule

Ask for one of these, not all of them at once:

- `read this and tell me if the positioning is clear`
- `forward this if it genuinely fits someone you know`
- `tell me which failure mode feels most real`

Avoid asking for:

- blind amplification
- fake praise
- direct upvote swaps

## Who to contact first

### Group 1: warm operator or builder contacts

Prioritize people who already know you or already care about:

- AI agents
- reliability
- bot supervision
- LLM evaluation
- Apple-native tooling

Goal:

- clarity feedback
- first stars, issue reports, and shares

### Group 2: adjacent open-source maintainers

Prioritize maintainers of:

- agent tools
- LLM tooling
- observability or evaluation projects
- Apple-native developer tools

Goal:

- citation
- informed critique
- ecosystem relevance feedback

### Group 3: community connectors

These are people who run:

- niche newsletters
- AI tooling chats
- founder groups
- Apple or indie builder groups

Goal:

- forwarding
- lightweight intro to the right audience

## Best link by audience

Use the landing page when:

- the person needs the fast story
- they are not likely to inspect the repo first

Use the GitHub repo when:

- the person is technical and will judge the project by artifacts
- they are likely to star, fork, cite, or inspect

Use the release page when:

- you want to emphasize that this is a real public launch package now

## DM templates

### Warm builder DM

```text
I just published VeriClaw 爪印 and thought of you because it sits in the “what happens after an agent drifts” part of the workflow.

It’s not a monitoring-only story. The loop is:
evidence -> diagnosis -> intervention -> verification -> casebook

If you have 2 minutes, I’d love a blunt read on whether the positioning is clear:
https://sheygoodbai.github.io/vericlaw/
```

### Technical maintainer DM

```text
Sharing VeriClaw 爪印 in case it overlaps with your world.

It’s a GitHub-first public launch for an Apple-native correction companion around OpenClaw, focused on hallucination, fake completion, overreach, and role drift.

If the framing feels relevant, I’d love an honest read on whether the correction loop is actually differentiated:
https://github.com/Sheygoodbai/vericlaw
```

### Community connector DM

```text
I’ve just launched VeriClaw 爪印.

The short version is: correction-first supervision for drifting AI agents, not just passive monitoring.

If it genuinely fits someone in your circle, would you be open to forwarding the repo or landing page with attribution?

Landing page:
https://sheygoodbai.github.io/vericlaw/
```

### Chinese warm-contact DM

```text
最近把 VeriClaw 爪印公开了，方向不是单纯做 AI 监控，而是做 bot 出现幻觉、越权、偷懒、角色漂移之后的纠偏闭环。

如果你方便看一眼，我特别想知道这个定位是不是一眼能看明白：
https://sheygoodbai.github.io/vericlaw/
```

## Follow-up templates

### If they did not reply after 3 to 5 days

```text
Re-sharing once in case it got buried. No pressure to respond, but if you do have a quick take on whether the correction-first framing is clear, I’d really value it:
https://sheygoodbai.github.io/vericlaw/
```

### If they replied positively

```text
Appreciate it. If someone specific comes to mind who cares about agent drift, reliability, or Apple-native tooling, feel free to forward it. No pressure if not.
```

### If they gave product criticism

```text
That’s very helpful. I’d rather hear the sharp version now than carry fuzzy positioning forward. Thank you.
```

## First 30 conversation tracker

Use this as a manual template in a note, sheet, or issue:

| Name | Segment | Link sent | Ask | Replied? | Outcome | Next step |
| --- | --- | --- | --- | --- | --- | --- |
| Person 1 | Warm builder | Landing | Clarity read | No | Pending | Follow up in 4 days |
| Person 2 | Maintainer | Repo | Differentiation read | Yes | Good feedback | Quote insight later |
| Person 3 | Connector | Landing | Forward if relevant | Yes | Shared privately | Thank and keep updated |

## Signals that outreach is working

Good signs:

- people answer the positioning question quickly
- replies mention a real failure mode without extra prompting
- they naturally compare VeriClaw to monitoring tools and understand the difference
- they forward without being pushed

Bad signs:

- people think it is just another chat app
- people think it is generic observability
- they do not understand the OpenClaw relationship
- they assume the App Store launch already happened

## Related files

- [channel-execution-plan.md](channel-execution-plan.md)
- [distribution-post-templates.md](distribution-post-templates.md)
- [product-hunt-launch-pack.md](product-hunt-launch-pack.md)
