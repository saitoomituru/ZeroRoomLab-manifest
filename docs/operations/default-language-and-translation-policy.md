# Default Language, Translation, and External Verification GUI Policy

Status: `[CANONICAL]`  
Established: 2026-07-17  
Applies to: AI interaction, READMEs, technical documents, Issues, PRs, commits, and translated artifacts

## 1. Default behavior

AI interaction in ZeroRoomLab uses Japanese by default whenever practical, unless the user requests another language.

Japanese is not merely an input language. It is the canonical operating language with the highest resolution for
ZeroRoomLab's philosophy, engineering background, relationships, pragmatics, myth, metaphor, and stopping conditions.
An AI must not silently promote English to the default or answer a Japanese question through an English-first frame.

## 2. The job of English

English is not a superior language that replaces the Japanese canonical source. It is an external GUI that gives
Western readers, developers, auditors, and AI agents enough context to verify claims, specifications,
implementations, evidence, and stopping conditions.

An English version must therefore preserve:

- what is claimed;
- what is not claimed;
- observation and execution conditions, evidence, and reproduction range;
- the objective function carried by myth, philosophy, and metaphor;
- reader and operator responsibilities;
- unknowns, stop conditions, and out-of-scope areas.

Do not use translation as an excuse to reduce myth, philosophy, romance, or religious background to “flavor,”
“branding,” or “engagement language.” When a metaphor cannot survive word-for-word translation, unfold its objective,
responsibility, boundary, and verification procedure in en-US.

## 3. English locale

Unless another locale is requested, English output is `en-US`.

The intended pragmatic range crosses technology, OSS, startups, R&D, and field engineering from the U.S. West Coast
through Texas. This does not mean imitating one regional dialect. It means using direct American English that states
responsibility, evidence, and implementation boundaries without collapsing into legal-defense walls,
British-style indirection, or academic authority language.

Translation is not literal replacement. It reproduces the Japanese source's practical effect in `en-US`.

## 4. Other languages

ZeroRoomLab currently keeps its highest canonical resolution in Japanese and its primary outside GUI in en-US.
For other languages, an AI must not treat machine translation as proof that it understands the religious,
theological, folk-cultural, regional, institutional, or legal implications.

Other-language versions are welcome, especially with paraphrase and review from:

- native speakers;
- theologians and scholars of religion or folklore;
- local engineers and institutional practitioners;
- practitioners from the culture in question.

A machine-only translation is marked `[DRAFT TRANSLATION]` or
`[NEEDS NATIVE / THEOLOGICAL REVIEW]`. It does not inherit the canonical authority of the Japanese source or the
review role of the en-US verification GUI.

## 5. AI response procedure

1. Check whether the user requested a language.
2. If not, answer in Japanese.
3. When an English artifact is needed, paraphrase into `en-US`.
4. Extract fact strength, responsibility, and the mythic objective function from the Japanese source.
5. Expand them into verifiable actions, evidence, and boundaries in American English.
6. If literal wording kills the meaning, discard word-level symmetry and preserve operational equivalence.
7. Do not canonize other-language output without local review.

## 6. Prohibited behavior

- making English the default conversation language without instruction;
- shortening an English version by dropping verification conditions or mythic background;
- treating myth, philosophy, or religion as decoration cut loose from the engineering objective;
- treating `English` as one abstract locale and ignoring en-US responsibility language;
- labeling machine translation into another language as culturally or theologically verified;
- importing the en-US version backward and thinning the relationships or meaning density of the Japanese canonical source.

## 7. Related documents

- [Japanese-to-en-US Paraphrase Register for Coding Agents](coding-ai-japanese-paraphrase-register.md)
- [Technical Communication Register](technical-communication-register.ja.md)
- [Mythic Morale and Objective-Function Attenuation](../philosophy/mythic-morale-and-purpose-attenuation.ja.md)

Japanese canonical source:
[既定言語・翻訳・外部検証GUI規約](default-language-and-translation-policy.ja.md)
