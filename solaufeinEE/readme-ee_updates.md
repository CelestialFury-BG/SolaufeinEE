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
* Death variable, dialog resref, and sound slot normalization on all joinable CREs
* Correct per-dialogue TRA scoping to eliminate string-reference collisions
* Full CRE sound slot restoration for Solaufein's barks (Battle Cry, Critical Hit, mood, morale)
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

* **Death variable normalization.** All Solaufein tier CREs (`sola5`–`sola17`, `udsola01/02`) have `WRITE_ASCII 0x280 ~Sola~ #32` applied, then `EE_CRE_CLEANUP` lowercases it to `sola`. This matches the death-variable checks used throughout the existing scripts and dialogues (`InParty("sola")`, `Dead("sola")`, `ActionOverride("sola", …)`).
* **Dialog resref binding.** All Solaufein CREs have `WRITE_ASCII 0x2C4 ~SOLA~ #8` applied so the engine has an explicit dialogue file target for `StartDialogueNoSet`.
* **Sound slot restoration.** Sola's barks are restored into the correct BG2 CRE v1.0 sound slot offsets after the cleanup routine wipes them:
  * INITIAL_MEETING (`0x00A4`), HAPPY (`0x00AC`), UNHAPPY_ANNOYED (`0x00B0`), UNHAPPY_SERIOUS (`0x00B4`), UNHAPPY_BREAKING_POINT (`0x00B8`), LEADER (`0x00BC`), BORED (`0x00C4`), BATTLE_CRY1 (`0x00C8`)
  * CRITICAL_HIT (`0x01A8`) — restored so the *"By Eilistraee's light!"* bark fires on both combat start and critical hits, matching the original mod's sound design.
* **Familiar AI compilation.** `solaboo.baf` is compiled, activating Boo Two's hide-in-shadows, trap-detection, and auto-return-on-death behavior.
* **Auto-buff script registration.** `WW-BUFF` and `WW-BUFF1` are appended to `scrpdesc.2da` and their help text resolved via `RESOLVE_STR_REF`, so they appear in the character-sheet script picker.
* **Auto-buff helper spell.** `wesalac.spl` ("Auto-Buff") is copied and named, providing the engine spell invoked by the script hotkeys.
* **Projectile fix.** GB meteor swarm, ice storm, and fire storm projectile values normalized.
* **Underdark Solaufein names.** `udsola01.cre` and `udsola02.cre` are now named from `wsetup.tra @1` (*"Solaufein"*) instead of `sola.tra @1`, which previously wrote a dialogue line into the creature's name field.
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
* **Cross-mod safety.** `solaint.d` is only compiled if `valenj.dlg` is present; otherwise the mod safely skips without aborting.

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

### Language Fallback

The `LANGUAGE` blocks in `solaufeinEE.tp2` are structured as **layered TRAs**: each non-English block loads `american/wsetup.tra` first as a base, then the target language's file on top. This means:

* Any `@n` ref defined in the English file but missing from a language overlay automatically falls back to English.
* New refs added in a future update will appear in every language immediately, without requiring translation updates.
* Translators can add translations at their own pace, knowing the installer will never fail on a missing ref.

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

### SPL Cleanup (`ee_spell_cleanup.tpa`)

* Remaps spell school root arrays and eliminates out-of-bounds corruption
* Iterates accurately through individual V1.0 extended headers to scrub faulty projectile indicators without corrupting core timeline effect rules

### Cutscene Cleanup (`ee_cutscene_cleanup.tpa`)

* Targets compilation blocks to secure `StartCutSceneMode()` transitions safely
* Enforces normalized `CutSceneId(Player1)` parameters to mitigate cross-platform crashing anomalies

------------------------------

## Installation

### Requirements

* BG2EE (v2.0 or higher) **or** EET (Enhanced Edition Trilogy)

### Install Order

1. Install all structural core engine rules before Solaufein
2. Install Solaufein Romance (Modern Edition)
3. Install general text tweak/UI packs last

### To Install

Extract the mod folder directly into your main game directory:

Then run one of:

* `setup-solaufeinEE.exe` (Windows — created by copying `weidu.exe` and renaming it)
* `weidu --install setup-solaufeinEE.tp2` (macOS/Linux)

------------------------------

## Verification Checklist

After installation, the following can be verified in Near Infinity:

* **`override/sola5.cre`** — Dialog field reads `SOLA.DLG`, Script name reads `sola`. Sound slots `INITIAL_MEETING`/`HAPPY`/`UNHAPPY_*`/`LEADER`/`BORED`/`BATTLE_CRY1`/`CRITICAL_HIT` all contain the correct STRREFs; every other slot should read *"No such index"*.
* **`override/udsola01.cre`** and **`udsola02.cre`** — Name reads *"Solaufein"* (not a dialogue line).
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
* **WeiDU installer menu** — Component names display in the selected language (falls back to English for any ref not yet translated in that language's `wsetup.tra`).

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

------------------------------

## Changelog

### 2.1.2 — Multi-language and dependency pass

**Localization**

* Added layered `LANGUAGE` blocks: each non-English language loads `american/wsetup.tra` as a base, then its own overlay on top. Missing refs automatically fall back to English.
* Converted all seven component names from hardcoded English strings in `BEGIN` statements to `@n` TRA refs (`@1000`–`@1060`), so the WeiDU installer menu displays component names in the user's selected language.
* Added translated `@1000`–`@1060` component-name refs to all eight `wsetup.tra` language files (American, French, German, Italian, Portuguese, Polish, Russian, Spanish).
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

* Applied `WRITE_ASCII 0x280 ~Sola~` and `WRITE_ASCII 0x2C4 ~SOLA~` to all Solaufein CRE tiers, binding both death variable and dialog resref. Without these, `StartDialogueNoSet` had no target and interactions would fall through to sound-slot barks.
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
