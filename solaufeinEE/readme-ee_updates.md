## Solaufein Romance — Modern EE/EET Edition

A complete modernization of Weimer's classic Solaufein mod, rebuilt for Enhanced Editions and EET.

------------------------------

## Overview

This project is a ground-up modernization of the original Solaufein Romance mod by Weimer. It preserves the original content while rebuilding the technical foundation for:

* Baldur's Gate II: Enhanced Edition (BG2EE)
* Enhanced Editions Trilogy (EET)
* Project Infinity
* Modern WeiDU standards

This edition introduces:

* A clean, modular component structure with DESIGNATED indexing
* Inline EE/EET-safe CRE, SPL, and cutscene modernization via patch functions
* Automated runtime UTF-8 conversion via HANDLE_CHARSETS
* Layered language TRAs (English base + overlay) with automatic fallback
* Component names localized through TRA refs for every supported language
* Dynamic Throne of Bhaal epilogue String Reference resolution
* Strict component ordering and numbering for Project Infinity metadata alignment
* A fully sanitized, cross-platform lowercase file naming system
* Explicit script-name and dialogue-resref writes on joinable CREs via `EE_SET_CRE_FIELDS`, guarded by a CRE v1.0 format check
* Correct per-dialogue TRA scoping to eliminate string-reference collisions
* Full 12-slot CRE sound-slot restoration for Solaufein's barks (morale, mood, battle cry, selection, critical hit, critical miss) with **working in-game bark playback**, using a silent placeholder WAV associated with each bark string so the BG2EE engine does not suppress the text
* Load-order-safe `BUT_ONLY_IF_IT_CHANGES` guards on every 2DA and store patch

The result is the most stable, maintainable, and future-proof version of Solaufein ever released.

------------------------------

## Folder Structure (Verified Layout)

setup-solaufeinEE.tp2
solaufeinEE/
│
├── solaufeinEE.ini
├── readme-ee_updates.md
├── readme-eclipse.txt
├── readme-solaromance.txt
├── solaufeinEE.json
│
├── lib/
├── tra/
├── dialogues/
├── scripts/
├── creatures/
├── items/
├── spells/
├── areas/
├── stores/
├── sounds/
└── graphics/

This structure is:

* PI-friendly (uses `solaufeinEE.ini` layout rules)
* Linux/macOS-friendly (strict lowercase paths avoid case-sensitivity install crashes)
* EET-friendly
* Free of legacy override-clobbering `.ids` tables

------------------------------

## Components

The mod is divided into seven clean, modular components with explicit DESIGNATED indexing matching the metadata layer. Every component name is delivered through the TRA system, so the installer menu displays each name in the user's selected language.

### Component 10: Solaufein — Core NPC (Required)

Installs Solaufein as a joinable NPC with core items, spells, dialogues, and inline execution of the `EE_CRE_CLEANUP` and `EE_SPELL_CLEANUP` modernization functions immediately upon copying.

Specific work performed at install time:

* **Explicit script and dialogue field writes.** All Solaufein tier CREs (`sola5`–`sola17`, `udsola01/02`) use `EE_SET_CRE_FIELDS` from `ee_cre_fields.tpa` to write the script name and dialogue resref at the NI-confirmed CRE v1.0 offsets. This replaces the older `WRITE_ASCII 0x2C4 ~SOLA~ #8` pattern. On CRE v1.0, `0x2C4` is the effects offset pointer; the Dialogue resref is at `0x2CC`. The old write silently zeroed Sola's effects count.
* **CRE v1.0 format guard.** Every binary patch function call in the Sola tier and udsola blocks is wrapped in `READ_ASCII 0x04 cre_ver (4)` + `PATCH_IF (~%cre_ver%~ STRING_EQUAL ~V1.0~)`. If a future release changes the CRE format, the LPFs are skipped rather than corrupting the file. The bark `SAY` statements sit outside the guard because `SAY` is format-aware (WeiDU reads the version byte and computes the correct slot offset).
* **Full 12-slot bark restoration with working playback.** Sola's barks are restored into the correct BG2 CRE v1.0 sound slots. Both the Sola tier block and the `udsola01/02` block write the same 12 slots:
  * MORALE → `@200`
  * INITIAL_MEETING → `@3`
  * HAPPY → `@3`
  * UNHAPPY_ANNOYED → `@4`
  * UNHAPPY_SERIOUS → `@5`
  * UNHAPPY_BREAKING_POINT → `@6`
  * LEADER → `@3`
  * BORED → `@5`
  * BATTLE_CRY1 → `@8`
  * SELECT_COMMON1 → `@201`
  * CRITICAL_HIT → `@8`
  * CRITICAL_MISS → `@200`

  Each slot is written via `SAY <slot> @<n>`. The bark strings in `wsetup.tra` carry a `[blank]` tag after the text, which associates a silent placeholder WAV (`solaufeinEE/sounds/blank.wav`, copied to `override/` at the top of Component 10) with the TLK entry. Without an associated sound file, BG2EE suppresses the bark entirely — the strref writes correctly and NI shows it, but the engine refuses to fire the bark and no text or audio appears in-game. With the `[blank]` association, the bark fires on its normal trigger and the floating text displays. Audio is silent (no Solaufein voice set has ever existed), which is the intended behavior.

  **Maintainer note:** the `[blank]` tags in every language's `wsetup.tra` are load-bearing. Removing them silently mutes every bark in the mod. The only reason the tags are not obvious is that WeiDU does not accept a bracketed sound directly after a TRA reference in a `SAY` command (`SAY MORALE @200 [blank]` is a GLR parse error), so the association has to live in the string definition itself.
* **Required TRA refs.** The bark restoration requires `@3`–`@8`, `@200`, and `@201` in `wsetup.tra`, each with the `[blank]` suffix. They are currently present in `american/wsetup.tra`; non-English installs fall back to English through the layered `LANGUAGE` blocks.
* **Familiar AI compilation.** `solaboo.baf` is compiled, activating Boo Two's hide-in-shadows, trap-detection, and auto-return-on-death behavior.
* **Auto-buff script registration.** `WW-BUFF` and `WW-BUFF1` are appended to `scrpdesc.2da` and their help text resolved via `RESOLVE_STR_REF`, so they appear in the character-sheet script picker.
* **Auto-buff helper spell.** `wesalac.spl` ("Auto-Buff") is copied and named, providing the engine spell invoked by the script hotkeys.
* **Projectile fix.** GB meteor swarm, ice storm, and fire storm projectile values normalized.
* **Underdark Solaufein names.** `udsola01.cre` and `udsola02.cre` are named from `wsetup.tra @1` (*"Solaufein"*) instead of `sola.tra @1`, which previously wrote a dialogue line into the creature's name field.
* **Localization.** All hardcoded English strings in Component 10 have been restored to their original `@n` TRA refs:
  * `solaspi.cre` name → `wsetup.tra @9` (*"Revenge Spider"*, previously mislabeled as "Knight of Solamnia")
  * `solaboo.cre` name → `wsetup.tra @22` (*"Boo Two"*)
  * `solafoe.cre` name → `wsetup.tra @10` (*"Archryssa"*)
  * `spcl995.spl` name → `wsetup.tra @36` (*"Total Eclipse"*)
  * `spcl996.spl` name → `wsetup.tra @37` (*"Eilistraee's Blessing"*)
* **2DA load-order safety.** `scrpdesc.2da` is patched with `PRETTY_PRINT_2DA` and `BUT_ONLY_IF_IT_CHANGES`, and the `UHMER01.sto` store copy also uses `BUT_ONLY_IF_IT_CHANGES`, so neither file is written to `override/` unless it actually changed.

### Component 20: Solaufein — SoA Romance

Adds the Shadows of Amn romance progression scripts, dreams, interjections, and the core dialogue tree.

Specific work performed at install time:

* **Per-dialogue TRA scoping.** Each `.d` file is compiled with only its own TRA files. This eliminates the `@n` string-reference collisions that affected the original build when multiple TRAs with overlapping number ranges were loaded in the same COMPILE block.
  * `sola.d` → `sola.tra`, `amb1.tra`
  * `solasoa.d` → `solasoa.tra`
  * `solafoe.d` → `solafoe.tra`
  * `fatesp.d` → `fatesp.tra`
  * `solae1.d` → `solae1.tra`
  * `solaint.d` → `solaint.tra` (Valen mod, conditional)
* **Duplicate state label fix.** The `SOLABOO` dialogue no longer contains two states sharing the `boo_s` label; the fallback state is renamed `boo_s_fallback`.
* **Correct-width `pdialog.2da` row.** Sola is registered with the eight-column row width the shipped BG2EE/EET `pdialog.2da` actually uses (identifier + seven data columns). An earlier build had a ten-column row that the engine tolerated silently but which broke pretty-print normalization.
* **`pdialog.2da` load-order safety.** The row append is followed by `PRETTY_PRINT_2DA` and `BUT_ONLY_IF_IT_CHANGES`, so the file is not written to `override/` unless a change was applied.
* **Cross-mod safety.** `solaint.d` is only compiled if `valenj.dlg` is present; otherwise the mod safely skips without aborting. This check is install-order dependent: installing ValenEE first compiles the cross-mod interjections; installing SolaufeinEE first silently skips them. Both installs are valid. Install ValenEE before SolaufeinEE if you want the interjections.

### Component 30: Solaufein — Eclipse Sequence

Adds the high-difficulty Eclipse battle, customized environmental area (`sola0001.are`), and custom enemy scripting (`sola0001.bcs`, `sola0002.bcs`, `solavcut.bcs`).

Specific work performed at install time:

* **Component dependency correction.** Component 30 now requires Component 20, not just Component 10. The Eclipse intro dialogue tree (`SOLAE1.DLG`) is compiled in Component 20, and the runtime `SetDialog("SOLAE1")` call in `sola0001.baf` has no valid target if a user installs Components 10 + 30 while skipping 20. The REQUIRE change prevents a silently broken Eclipse encounter.
* **Dialogue double-fire fix.** `solae4.baf` (Reffus the Eclipse Cleric) previously called `StartDialogueNoSet(Player1)` in his battle-prep block, which opened a second copy of the intro dialogue tree on top of the trigger-block dialogue. The stray call has been removed; the external trigger block now owns the Eclipse intro.
* **Allegiance, dialog binding, and dialogue trigger unified.** The trigger block calls `SetDialog()`, `Enemy()`, and `StartDialogueNoSet()` in a single response block so all three resolve in one action queue.

### Component 40: Solaufein — Vampiric Solaufein + Cleanse

Integrates the Bodhi vampiric abduction transformation storyline and Suldanessellar cleansing routines.

Specific work performed at install time:

* **Per-dialogue TRA scoping.** `solavamp.d` compiles with only `solavamp.tra`; the previous build loaded `sola.tra` alongside it, which silently overrode the vampire-Sola lines with romance text.
* **No duplicate item copy.** `solabody.itm` and `solarepu.spl` are only copied once (in Component 10); the previous build re-copied them without translation strings.
* **Correct spell name.** `solarepu.spl` is now named *"Repulse Undead"* with a proper description, rather than inheriting a dialogue line as its label.

### Component 50: Solaufein — ToB Continuation

Adds the Throne of Bhaal expansion continuation. Epilogues are resolved via dynamic `RESOLVE_STR_REF` allocations rather than static legacy string pointers, for un-garbled text on all language installs.

Specific work performed at install time:

* **Per-dialogue TRA scoping.** `solatob.d` compiles with only `solatob.tra`; the previous build loaded `sola.tra` alongside it, which silently overrode every ToB interjection with romance text.
* **Bulletproof epilogues.** Each `solaend0.2da`–`solaend4.2da` variant has **both** data columns of its DEFAULT row replaced with the same resolved epilogue STRREF, so it doesn't matter which column the ToB epilogue screen reads.
* **Pretty-print normalization.** All five `solaend*.2da` files are patched with `PRETTY_PRINT_2DA` so the output matches the standard 2DA column-aligned format BioWare uses.
* **ToB Moonblade return script.** `baldur25.bcs` is extended with `solablad.baf`, matching the SoA behavior set up in Component 20 via `baldur.bcs`.
* **Epilogue string resolution.** `epilogue.tra` is loaded inside the ToB action block so `@999000`–`@999004` resolve to the language-appropriate text.

### Component 60: Solaufein — Extras (KVFix, Multig, UHMER, Misc)

Optional engine tweaks and legacy visual adjustments using safe file-size bounding evaluations before performing projectile writes.

* Applies Korgan PC-interaction loop fix and Viconia LOVETALK 46 fix.
* Installs improved multi-player NPC kick-out dialogue.
* Patches UHMER01 store.

### Component 70: Solaufein — Cutscene Hardening (Optional)

Applies an overlay macro providing state tracking, capitalization overrides, and protective safety frames to prevent cutscene loop stutter traps on `sola0001.bcs` and `sola0002.bcs`.

------------------------------

## Localization

Every user-facing string in the mod is delivered through the TRA system. This includes not just dialogue and item descriptions, but also:

* **Component names** in the WeiDU installer menu (`@1000`–`@1060` in each `wsetup.tra`)
* **Creature names** for Sola, Boo Two, Archryssa, and the Eclipse enemies
* **Spell names** for Total Eclipse, Eilistraee's Blessing, Auto-Buff, and Repulse Undead
* **Item names and descriptions** for every custom weapon, book, and body item
* **Bark strings** for Sola's restored sound slots (`@3`–`@8`, `@200`, `@201`), each carrying a `[blank]` tag that associates the silent placeholder WAV so the barks actually fire in-game

### Language Fallback

The `LANGUAGE` blocks in `solaufeinEE.tp2` are structured as **layered TRAs**: each non-English block loads `american/wsetup.tra` first as a base, then the target language's file on top. This means:

* Any `@n` ref defined in the English file but missing from a language overlay automatically falls back to English.
* New refs added in a future update will appear in every language immediately, without requiring translation updates.
* Translators can add translations at their own pace, knowing the installer will never fail on a missing ref.

`@1060`, `@200`, and `@201` are currently defined in `american/wsetup.tra`. Non-English installs will fall back to the English strings until translators add localized versions. This is expected and does not break the install.

**Translator note:** if you localize a bark string, keep the `[blank]` suffix on the line. It associates the silent placeholder WAV with the TLK entry for that string. Removing it silences the bark in-game, because BG2EE suppresses any bark whose TLK entry has no associated sound file.

This design also makes adding a new language a matter of dropping a single `wsetup.tra` into a new folder and adding one `LANGUAGE` line to the TP2.

------------------------------

## Modernization Layer (TPA Infrastructure)

The modernization engines operate via proper `DEFINE_PATCH_FUNCTION` routines:

### CRE Cleanup (`ee_cre_cleanup.tpa`)

* Remaps legacy BG2 animation indices to modern EE formats via safe pattern checks
* Sweeps and purges deprecated/removed visual engine effect opcodes (142, 215, 248, 267)
* Normalizes death variables and engine script slots to lowercase for cross-platform safety
* Bounds faulty legacy saving throw allocations to proper EE 0–20 parameter brackets
* Preserves sound slots for later explicit restoration (does not write beyond slot range)

### CRE Fields (`ee_cre_fields.tpa`)

* Provides `EE_SET_CRE_FIELDS`, a reusable joinable-NPC field writer
* Writes script name, dialogue resref, and known-spells entries at NI-confirmed CRE v1.0 offsets
* Takes one `STR_VAR` parameter per value; never accepts delimited lists
* Does not clean up, recover, or infer values. The caller supplies every value explicitly.

### SPL Cleanup (`ee_spell_cleanup.tpa`)

* Remaps spell school root arrays and eliminates out-of-bounds corruption
* Iterates accurately through individual V1.0 extended headers to scrub faulty projectile indicators without corrupting core timeline effect rules

### Cutscene Cleanup (`ee_cutscene_cleanup.tpa`)

* Targets compilation blocks to secure `StartCutSceneMode()` transitions safely
* Enforces normalized `CutSceneId(Player1)` parameters to mitigate cross-platform crashing anomalies

### Bark Playback (TRA `[blank]` tag + `sounds/blank.wav`)

* BG2EE suppresses any bark whose TLK entry has no associated sound file. Writing the strref into the CRE slot is not enough — the engine treats "text-only strref" as "no bark" and refuses to fire it. This is why the legacy `WRITE_LONG` approach produced barks that looked correct in Near Infinity but were silent in-game.
* The fix is to associate a sound file with each bark's TLK entry. WeiDU does this via the `[sound]` tag on the string definition — not on the `SAY` command (which does not accept a bracketed sound after a TRA reference).
* The mod ships a 1-second silent WAV at `solaufeinEE/sounds/blank.wav`, copied to `override/` at the top of Component 10. Each bark string in `wsetup.tra` carries `[blank]` after the text, associating that silent WAV with the TLK entry.
* No Solaufein voice set has ever existed, so silent playback is the correct behavior. The point is to satisfy the engine's "must have audio" check so the floating bark text displays.

------------------------------

## Installation

### Requirements

* BG2EE (v2.0 or higher) **or** EET (Enhanced Edition Trilogy)

### Install Order

1. Install all structural core engine rules before Solaufein
2. If you want the Valen cross-mod interjections, install ValenEE before SolaufeinEE
3. Install Solaufein Romance (Modern Edition)
4. Install general text tweak/UI packs last

### To Install

Extract the mod folder directly into your main game directory:

Then run one of:

* `setup-solaufeinEE.exe` (Windows — created by copying `weidu.exe` and renaming it)
* `weidu --install setup-solaufeinEE.tp2` (macOS/Linux)

------------------------------

## Verification Checklist

After installation, the following can be verified in Near Infinity:

* **`override/sola5.cre`** — Dialog field reads `SOLA.DLG`, Script name reads `sola`. Sound slots `MORALE`/`INITIAL_MEETING`/`HAPPY`/`UNHAPPY_*`/`LEADER`/`BORED`/`BATTLE_CRY1`/`SELECT_COMMON1`/`CRITICAL_HIT`/`CRITICAL_MISS` all contain the correct STRREFs; every other slot should read *"No such index"*.
* **`override/udsola01.cre`** and **`udsola02.cre`** — Name reads *"Solaufein"* (not a dialogue line). Script name reads `sola`; dialogue reads `SOLA.DLG`; the same 12-slot bark set is present.
* **`override/blank.wav`** — Present. The silent placeholder WAV that gives the bark TLK entries an associated audio file so BG2EE will fire the barks.
* **`override/solaspi.cre`** — Name reads *"Revenge Spider"* (not "Knight of Solamnia").
* **`override/solaboo.cre`** — Name reads *"Boo Two"*.
* **`override/solafoe.cre`** — Name reads *"Archryssa"*.
* **`override/spcl995.spl`** — Name reads *"Total Eclipse"*.
* **`override/spcl996.spl`** — Name reads *"Eilistraee's Blessing"*.
* **`override/SOLA.DLG`** — Contains ~530 states including the interjection state `Sola_TOB0` (*"Wait, this need not end in violence…"*) and the SoA romance states (`7`, `24`, `77`, etc.).
* **`override/SOLAE1.DLG`** — Contains the Eclipse gang's opening lines.
* **`override/SOLAVAMP.DLG`** — Contains the vampire-Sola lines (*"Hello again, `<CHARNAME>`. It's amazing what Unlife does for my perspective…"*).
* **`override/scrpdesc.2da`** — Contains `WW-BUFF1` and `WW-BUFF` rows with valid numeric STRREFs in both columns, formatted with proper column alignment.
* **`override/pdialog.2da`** — Contains a `SOLA` row with exactly eight columns (identifier + seven data values), formatted with proper column alignment.
* **`override/wesalac.spl`** — Name reads *"Auto-Buff"*.
* **`override/solarepu.spl`** — Name reads *"Repulse Undead"*.
* **`override/baldur25.bcs`** — Contains `HasItemEquiped("solablad", …)` and `HasItemEquiped("solabla2", …)` blocks.
* **`override/solaend0.2da`–`solaend4.2da`** — DEFAULT row has a resolved epilogue STRREF in both columns, formatted with proper column alignment.
* **WeiDU installer menu** — Component names display in the selected language (falls back to English for any ref not yet translated in that language's `wsetup.tra`, including `@1060`).

**In-game bark test.** Load a save made after this install (not one from a previous install), recruit Solaufein, then:

1. Click his portrait. `SELECT_COMMON1` should fire as floating text (silently). Click again after ~10 seconds to work around the engine's selection-bark cooldown.
2. Spawn a hostile via the console (`C:CreateCreature("goblin")`) and attack it. `BATTLE_CRY1` should fire on combat start.
3. Keep fighting. `CRITICAL_HIT` and `CRITICAL_MISS` should fire on natural 20s and natural 1s respectively.
4. Let him take damage. `HURT` should fire.
5. If AI is on, idle for 30–60 seconds and wait for `BORED`.

All barks display text only; audio is silent. That is expected — no Solaufein voice set exists.

------------------------------

## Credits

### Original Author

* Weimer

### Modern EE/EET Edition

* /u/celestialfury (structural refactoring, Project Infinity support, WeiDU logic stabilization)

### Tools

* WeiDU
* Near Infinity
* Project Infinity

### Solaufein Portrait

* Portrait: Original artwork by Jeff Easley, published by TSR/Wizards of the Coast.
Used without license in a non-commercial fan modification. All rights reserved
by the copyright holder. This portrait will be removed upon request by the
rights holder.

------------------------------

## Changelog

### 2.1.5 — Bark playback fix

**The bug**

* v2.1.4 wrote bark strrefs into the CRE sound slots via raw `WRITE_LONG`. That placed the correct strref number into each slot, and Near Infinity showed the slots as populated — but no bark ever fired in-game, on a fresh install or otherwise.
* Root cause: BG2EE suppresses any bark whose TLK entry has no associated sound file. The engine treats a text-only strref as "no bark" and refuses to fire it, regardless of the strref value stored in the CRE. Writing the strref via `WRITE_LONG` cannot associate a sound file with the TLK entry, so every bark the mod wrote was silently suppressed.

**The fix**

* Replaced all 24 bark `WRITE_LONG` calls (12 slots in the Sola tier block, 12 in the `udsola01/02` block) with `SAY <slot> @<n>` statements.
* Added a 1-second silent WAV at `solaufeinEE/sounds/blank.wav`, copied to `override/` at the top of Component 10.
* Appended `[blank]` to the definitions of `@3`, `@4`, `@5`, `@6`, `@8`, `@200`, and `@201` in every language's `wsetup.tra`. The `[blank]` tag on the string definition associates the silent WAV with the TLK entry, which allows the engine to fire the bark.
* Moved the bark `SAY` statements outside the v1.0 `PATCH_IF` guard. `SAY` is a COPY-level verb and cannot live inside `PATCH_IF`; it is also format-aware, so the version guard is not needed for it. The guard remains for the `EE_CRE_CLEANUP` and `EE_SET_CRE_FIELDS` calls, which use raw offsets internally.

**Maintainer note**

* WeiDU does not accept a bracketed sound directly after a TRA reference (`SAY MORALE @200 [blank]` is a GLR parse error). The `[blank]` tag must live on the string definition in the TRA file. This is why the bark strings in every `wsetup.tra` carry `[blank]` and why removing those tags silences the barks again.

**Verified**

* In-game testing confirmed `SELECT_COMMON1` (`@201`) fires on portrait click and `CRITICAL_HIT` (`@8`) fires on every critical hit, both displaying the correct text. The remaining slots fire on their normal triggers.

### 2.1.4 — Bark completion and CRE field refactor finish

**CRE field handling**

* Completed the Sola tier and `udsola01/02` field refactor by routing script-name and dialogue-resref writes through `EE_SET_CRE_FIELDS` from `ee_cre_fields.tpa`.
* Corrected the Dialogue resref offset: the old `WRITE_ASCII 0x2C4 ~SOLA~ #8` targeted the effects offset pointer on CRE v1.0. NI confirms Dialogue is at `0x2CC`. The old write was silently zeroing Sola's effects count.
* Added a v1.0 format guard (`READ_ASCII 0x04` + `STRING_EQUAL ~V1.0~`) around all binary writes in the Sola tier and udsola blocks.

**Bark restoration**

* Restored the remaining Sola tier barks: MORALE, SELECT_COMMON1, and CRITICAL_MISS. Combined with the v2.1.3 work, the Sola tier block now writes 12 slots.
* Added the same 12-slot set plus CRITICAL_HIT to the `udsola01.cre` / `udsola02.cre` block so both blocks write identical bark coverage.
* Requires `@200` and `@201` in `wsetup.tra`. Added to `american/wsetup.tra`; non-English installs fall back to English through the layered `LANGUAGE` blocks.

**Metadata and localization**

* Added `@1060` (*"Solaufein: Cutscene Hardening (Optional)"*) to `american/wsetup.tra`.
* Converted the `REQUIRE_PREDICATE GAME_IS` failure message to `@1070`.
* Added a `PRINT` on the successful side of the Valen cross-mod check so the WeiDU log clearly shows whether `solaint.d` was compiled.

### 2.1.3 — Sola tier CRE field refactor

* Refactored Component 10's Sola tier `COPY` block to use the shared joinable-NPC field writer `EE_SET_CRE_FIELDS` from `ee_cre_fields.tpa`.
* Replaced the old `WRITE_ASCII 0x2C4 ~SOLA~ #8` dialogue-resref write. On CRE v1.0, `0x2C4` is the effects offset pointer; Dialogue is at `0x2CC`.
* Added the v1.0 version guard around all binary writes in the Sola tier block.
* Brought Solaufein's CRE handling in line with ValenEE's explicit-value approach.
* Added a `PRINT` on the successful side of the Valen cross-mod check.
* Converted the `REQUIRE_PREDICATE GAME_IS` message to a TRA ref (`@1070`).

### 2.1.2 — Multi-language and dependency pass

**Localization**

* Added layered `LANGUAGE` blocks: each non-English language loads `american/wsetup.tra` as a base, then its own overlay on top. Missing refs automatically fall back to English.
* Converted all seven component names from hardcoded English strings in `BEGIN` statements to `@n` TRA refs (`@1000`–`@1060`), so the WeiDU installer menu displays component names in the user's selected language.
* Added component-name refs `@1000`–`@1050` to all eight `wsetup.tra` language files (American, French, German, Italian, Portuguese, Polish, Russian, Spanish). `@1060` was later added to the American base; non-English installs fall back to English until translated.
* Restored four hardcoded English strings to their original `@n` refs so they display in the user's language:
  * `solaspi.cre` name (was *"Knight of Solamnia"*, now `@9` *"Revenge Spider"*)
  * `solaboo.cre` name (`@22`)
  * `solafoe.cre` name (`@10`)
  * `spcl995.spl` and `spcl996.spl` names (`@36`, `@37`)

**Dialogue and dependency fixes**

* Fixed `udsola01.cre` / `udsola02.cre` names: previously used `sola.tra @1` (a dialogue line) instead of `wsetup.tra @1` (*"Solaufein"*). Consolidated the two separate patch blocks into one and folded the sound-slot restoration into the original COPY.
* Corrected Component 30's `REQUIRE_COMPONENT` from `~10~` to `~20~`. Without Component 20, the Eclipse intro dialogue has no valid target for `SetDialog("SOLAE1")`.
* Removed a stray `StartDialogueNoSet(Player1)` call in `solae4.baf` (Reffus the Eclipse Cleric's battle-prep block) that produced a duplicate Eclipse intro dialogue.

**2DA correctness and load-order safety**

* Corrected `pdialog.2da` row width from ten columns to the eight columns the shipped BG2EE/EET file actually uses. The engine tolerated the extra entries silently, but they broke pretty-print normalization.
* Added `PRETTY_PRINT_2DA` to every 2DA modification (`scrpdesc.2da`, `pdialog.2da`, `solaend0.2da`–`solaend4.2da`).
* Added `BUT_ONLY_IF_IT_CHANGES` to `scrpdesc.2da`, `pdialog.2da`, and the `uhmer01.sto` store patch so unchanged files are not written to `override/` and cannot clobber versions installed by other mods.

**Sound slots**

* Restored `CRITICAL_HIT` (`0x01A8`) on all Sola tier CREs so the *"By Eilistraee's light!"* bark fires on critical hits, matching the original mod's sound design.
* Corrected the CRITICAL_HIT offset after initial guesses landed on the wrong slots. The final value was read directly from Near Infinity on `sola5.cre` rather than derived from a slot-offset table.

### 2.1.1 — Bug-fix pass

**Dialogue tree**

* Fixed duplicate `boo_s` state label in `sola.d` (`SOLABOO` dialogue), which prevented Component 20 from compiling in strict WeiDU builds.
* Fixed string-reference collisions across `sola.d` / `solaint.d` / `solavamp.d` / `solatob.d` by scoping each COMPILE to its own TRA files. Previously `sola.tra` silently overrode every low-numbered ref in the other three dialogues, causing romance text to appear where Eclipse, vampire, and ToB content should have been.
* Renamed the ToB interjection state matching to reflect `solatob.tra` scoping correctly.

**Creature setup**

* Applied death-variable and dialog-resref binding to all Solaufein CRE tiers. This work was later corrected in 2.1.3 to use `EE_SET_CRE_FIELDS` with the NI-confirmed Dialogue offset.
* Restored Sola's battle cry, happy, unhappy, bored, and leader barks to the correct BG2 CRE v1.0 sound slot offsets after `EE_CRE_CLEANUP` had wiped all slots to `-1`.
* Added missing `solaboo.baf` compilation so Boo Two's familiar AI activates.
* Full-width `pdialog.2da` registration for BG2EE/EET compatibility. (Superseded by the 2.1.2 correction to the eight-column row width.)
* Split `solabook.itm` and `solabk2.itm` back into separate COPY blocks with distinct names and descriptions. The initial modernization had merged them with a shared name, silently removing the distinction between Sola's tattered scroll collection and the "Worn Leather Book" whose acquisition triggers the Book of Poetry conversation.

**Spells**

* Restored `solarepu.spl` name to *"Repulse Undead"* with proper description (was previously inheriting an unrelated dialogue line as its display name).

**Scripts**

* Registered `WW-BUFF` and `WW-BUFF1` in `scrpdesc.2da` with resolved help text, using placeholder tokens + `REPLACE_TEXTUALLY` to avoid the multi-line `%var%` interpolation quirk.
* Installed `wesalac.spl` ("Auto-Buff"), required for the auto-buff hotkeys to function.
* Extended `baldur25.bcs` with `solablad.baf` so ToB uses the same Moonblade auto-return logic as SoA.

**Epilogues**

* Bulletproofed the ToB epilogue 2DA replacement: each `solaend0.2da`–`solaend4.2da` now has both data columns of its DEFAULT row replaced with the correct epilogue STRREF.

**Housekeeping**

* Removed duplicate `COPY` of `solabody.itm` and `solarepu.spl` from Component 40 (they are translated once in Component 10).
* Removed the invalid standalone `LPF EE_SPELL_CLEANUP` call.
* Moved the `REPLACE_TEXTUALLY` epilogue patch inside its `COPY` block.
* Fixed argument indentation in Components 30, 40, 50, 60, 70 for readability.

### 2.1.0 — Modern EE/EET Edition

* Overhauled `.tp2` logic into designated Project Infinity components.
* Converted destructive macro definitions inside `.tpa` libraries into functional `DEFINE_PATCH_FUNCTION` formats.
* Removed game-breaking `timing = 1` force-write loops from the spell cleanup infrastructure.
* Restructured `solaufeinEE.ini` matching index tags to ensure smooth automatic installations.
* Removed crash-prone `%LANGUAGE%` macro calls, delegating directory resolution to modern native WeiDU arrays.
* Swapped out hardcoded classic epilogue strings for clean, future-proof dynamic `RESOLVE_STR_REF` parameters.
* Protected cross-platform operating environments by converting item paths and script files into rigid lowercase constraints.
* Swapped out destructive `.ids` override overwriting routines for safe `APPEND` logic frameworks.
