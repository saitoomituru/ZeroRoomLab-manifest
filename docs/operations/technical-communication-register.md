# Technical Communication Register

Status: `[CANONICAL]`\
Established: 2026-07-15\
Applies to: READMEs, technical documents, experiment Notes, and public communication in ZeroRoomLab-manifest
and referencing repositories

## 1. Purpose

The same fact does different work on a README cover, in an experiment Note, in a note.com story, on X,
or in a YouTube video. This register prevents editors from mixing those media registers, weakening an observed
fact, or stretching it beyond the observation range.

This is not a machine for manufacturing disclaimers. State an observed fact at its observed strength and stop
where the evidence stops.

## 2. Register by medium

| Medium and position | Main reader | Appropriate register |
|---|---|---|
| roughly the first 40 README lines | general readers, general nerds, search/SNS/screenshot arrivals | public cover; short and strong, carrying vision and observed results as marketing and artistic expression |
| README after the boundary | grown-up OSS pirates | technical register; inspect hardware, commits, logs, test conditions, and claim boundaries |
| `docs/`, experiment records, technical reports | implementers, reproducers, auditors | engineering register; state conditions, procedure, results, failures, and range |
| repository `note/` | researchers and editors before normalization | primary material, drafts, salvage; preserve source wording and context without claiming canonical status |
| note.com or another story/documentary/comic/ZINE SaaS | public and work-oriented readers | marketing, art, and story register |
| X, YouTube, and other short-text/video media | arrivals and viewers | news, announcement, and entertainment register; respect the medium's rhythm and context |

Repository `note/` and the external note.com service are different operational surfaces even though both are called “note.”

Place this boundary sentence where the public README cover switches into its technical register:

> The README opens with the public-facing view. The technical notes below assume readers will inspect the hardware,
> commits, logs, test conditions, and claim boundaries before extending any result.

Below that sentence, the reader also owns the work of reading evidence and boundaries. Do not overread the cover
as a technical specification or deep engineering documents as ad copy.

## 3. Japanese implicit scope and translation

Japanese technical conversation may share a recently named machine, log, site, and point in time, then say
“worked,” “reproduced,” or “compatible” without restating the entire fixture. That direct statement does not
automatically become a context-free universal proposition or byte-for-byte identity with every implementation.

Editors and agents therefore:

- do not weaken a valid Japanese observation with English-language over-caveating;
- keep references to hardware, commit, workload, log, and test boundaries instead of weakening the conclusion;
- add only the subject, target, and test range needed to carry Japanese omission into English;
- do not paste a generic “may not be fully compatible” warning into every paragraph;
- may change voice without changing the strength of the observed result.

The Japanese version is not a subordinate copy of the English one. Japanese concepts and observations may be
canonical, with English acting as a transformation layer into another implicit context.

### 3.1 Pragmatic mapping across Japanese, British English, and American English

English is not one slab. This repository does not normally maintain en-GB translation files; English output is
en-US unless requested otherwise. British English remains a comparison tool for explaining what changes when
Japanese social force is translated literally.

The canonical procedure and operational equivalents for coding-agent Japanese-to-en-US work live in the
[Japanese-to-en-US Paraphrase Register](coding-ai-japanese-paraphrase-register.md).

## 4. Claim boundaries in technical documents

Connect the evidence chain whenever practical:

```text
hardware / runtime
    -> commit / version
    -> command / workload
    -> log / measurement
    -> observed result
    -> test boundary
```

Inside that chain, write “worked,” “reproduced,” or “observed functional compatibility” directly.
Do not automatically dilute facts into “possible” or “strictly unknown.”

The following are different claims and require their own evidence:

- observed functional compatibility vs. internal or byte-level identity;
- reproduction in one configuration and workload vs. full compatibility everywhere;
- observed operation vs. a guarantee of cryptographic strength, attack resistance, or security audit;
- an undisclosed component vs. illegal modification, concealment, or unauthorized access.

Close the conclusion for a reproducer like this:

> We observed functional compatibility on the documented hardware, commit, workload, and logs.
> Internal identity and untested conditions are outside this record. Inspect the hardware and original logs
> before drawing a broader conclusion.

## 5. Security and cryptographic-strength wording

Record observed functionality. If the complete implementation cannot be published and no independent red team
or equivalent audit has examined it, do not guarantee cryptographic strength or attack resistance.

Recommended wording:

> We observed functional operation within the documented test range. Cryptographic strength and attack resistance
> are not guaranteed because full implementation disclosure and independent audit have not been completed.

This does not retract the functional observation. It separates reproduction from security assurance.
Withholding keys, personally identifying data, or implementation detail useful to an attacker is not itself
evidence of misconduct.

## 6. Reverse failures caused by over-fortification

Good intentions can pile up legal-defense caveats, suppress detail, and make observed facts vague. That can feed
the opposite misreading:

- there must be an illegal modification or cover-up;
- malware-like behavior is being hidden on purpose;
- the result is actually trivial to reproduce and contains no accumulated engineering;
- conspiracy or poison-talk in the artwork is evidence of a real concealment.

In engineering terms, a wrapper that exposes no auditable inputs, outputs, or boundaries and only adds
obfuscation can make a normal implementation look like malware. The answer is not a taller disclaimer wall.
It is a publishable evidence chain and test boundary.

Do not expose private information or prove unobserved territory merely to prevent misreading. Close the claim
inside the evidence you actually showed.

### 6.1 Do not reduce natural-language interfaces to imitations

When a surface does not directly execute Python, a binary, or a local process, do not describe Prompt Engineering
Edition as “reproducing the real CLI from canonical code” while calling the Python CLI “the actual interface.”
That turns an Execution Envelope difference into an authenticity rank.

Natural language, free language, papers, philosophy, theology, law, design Notes, and prompt engineering are not
fake drafts waiting to become code before they count. Conversely, being explainable in language does not make
something implemented, executed, or tested.

Recommended wording:

> This surface references the repository contract through a Prompt Line Interface. Available operations depend on
> the current Execution Envelope, connectors, and granted authority.

When a requested operation needs a Python process, narrow the scope:

> This operation requires an Execution Envelope with a local Python process. The current PLI will not execute it
> directly; it can generate the procedure, write a Note, or hand the task to a compatible environment.

Use “real/fake” for authenticity, “canonical” for source authority, and “reproduction” for fixtures, conditions,
observations, and replay targets. Do not leak those words into interface ranking.

## 7. Editing and AI rules

- Do not automatically weaken the marketing and artistic register of a README cover, note.com story, X post,
  YouTube video, or similar surface.
- Edit marketing text only when explicitly asked or when it directly contradicts observed facts.
- State observed facts in technical documents and record conditions and untested territory.
- Do not push caveats from a deep technical document backward into the README cover.
- Do not use README cover language as engineering evidence.
- Do not mix fictional conspiracies, poison-talk, or character voice into technical fact finding.
- Do not infer illegality, safety, danger, or implementation identity merely from non-disclosure.
- Do not convert market share, revenue, sponsor loss, or enterprise adoption into fact strength or product fitness.
- When upstream and project KPIs differ, do not condemn upstream; name the use-case difference, protected subject,
  and adapter boundary.
- Do not confuse refusal to invent implementation intent with philosophical neutrality. A technical document may
  bound unknown implementation facts while a README or Layer B text explicitly rejects an incompatible commercial philosophy.

When a factual contradiction appears, fix the target, conditions, time, and evidence. Do not merely lower the volume.

## 8. Canonical and source material

This register is canonical for medium-specific communication. Its formation sources remain in:

- [IBD/AQC specification meeting glossary 2026-07-10 v4](../../note/20260710-1347__IBD_AQC_仕様会議_用語集_2026-07-10-v4.md)
  — mixed explanatory-style pain and the overloaded meanings of “note”;
- [IBD/AQC specification meeting glossary 2026-07-10 1](../../note/20260710-1113__IBD_AQC_仕様会議_用語集_2026-07-10_1.md)
  — linguistic pain and separation of README/docs registers.

Those Notes are drafts and meeting records. If they conflict with this register, this register wins for operations.
The three-layer scope contract in AGENTS.md remains the upper content-classification rule; this document chooses
medium and explanatory style.

Japanese canonical source:
[テクニカルコミュニケーション運用規約](technical-communication-register.ja.md)
