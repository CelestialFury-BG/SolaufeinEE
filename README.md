# Solaufein — Modern EE/EET Edition

> A fully modernized, modular rebuild of Weimer's classic Solaufein mod, restored for Baldur's Gate II: Enhanced Edition and EET.

---

## What Is This?

The **Solaufein** mod adds Solaufein — the Drow fighter/mage from Ust Natha — as a fully joinable party companion in Baldur's Gate II. Beyond recruiting him, the mod weaves an extensive romantic storyline with a strong philosophical bent: Solaufein is a redeemed Drow, a worshipper of Eilistraee, and a man reconciling himself with the surface world.

Originally released by Weimer in the early 2000s, this edition is a ground-up technical modernization. The **content is preserved exactly** — every dialogue, every quest, every banter, every poem — but the underlying WeiDU code has been rebuilt to work reliably on modern Enhanced Edition installs.

Solaufein Portrait: Original artwork by Jeff Easley, published by TSR/Wizards of the Coast.
Used without license in a non-commercial fan modification. All rights reserved
by the copyright holder. This portrait will be removed upon request by the
rights holder.

Key features:

- **Solaufein joins your party** in Shadows of Amn and continues into Throne of Bhaal
- **A full romance arc** for the player character, with two distinct philosophical paths (pragmatism vs. compassion) that shape the ending
- **The Eclipse**, a legendary high-difficulty tactical encounter with six unique enemies
- **A vampiric abduction storyline** in Chapter 6, where Solaufein is turned by Bodhi and must be restored
- **Full commentary** on your other companions — banters with every BioWare NPC
- **Custom items, spells, and a Moonblade** granted by Eilistraee herself

---

## What's New in This Edition

For a detailed technical comparison of how this edition differs from legacy
builds of the same mod — including install safety, cross-platform behavior,
and load-order compatibility — see [COMPATIBILITY.md](COMPATIBILITY.md).

The **2.x modernization** fixes a long list of legacy issues that plagued the original mod on EE installs:

- **Per-dialogue TRA scoping** — eliminates string-reference collisions that silently corrupted dialogue text
- **Layered language fallback** — new strings appear in every language automatically, without translator updates
- **8 supported languages** — English, Italian, German, French, Portuguese, Polish, Russian, Spanish
- **Sound slot restoration** — Solaufein's battle cries, critical hit bark, and mood barks all fire correctly again
- **Load-order-safe 2DA patches** — `BUT_ONLY_IF_IT_CHANGES` on every shared table so we don't clobber other mods
- **Corrected component dependencies** — the Eclipse fight now properly requires the romance files it uses
- **ToB epilogue bulletproofing** — both data columns of every epilogue 2DA are patched so the ending screen always displays correctly

See [`readme-ee_updates.md`](solaufeinEE/readme-ee_updates.md) for the full changelog.

---

## Requirements

- **Baldur's Gate II: Enhanced Edition** (v2.0 or higher), **or**
- **EET** (Enhanced Edition Trilogy)

Baldur's Gate: Enhanced Edition is **not** supported — Solaufein is a Shadows of Amn companion, and his content begins in the Underdark chapter of BG2.

---

## Installation

### Windows

1. Download the latest release from the [Releases page](../../releases/latest).
2. Extract the archive into your **BG2EE/EET game folder** (the one containing `Baldur.exe`).
3. Run **`setup-solaufeinEE.exe`** and follow the installer prompts.

If `setup-solaufeinEE.exe` is not included in the archive, copy `weidu.exe` from your game folder and rename the copy to `setup-solaufeinEE.exe`, then run it.

### macOS / Linux

1. Extract the mod folder into your BG2EE/EET game directory.
2. Open a terminal in that directory and run:

       weidu --install setup-solaufeinEE.tp2

### Project Infinity

The mod ships with `solaufeinEE.ini` and `solaufeinEE.json` metadata. Point PI at the extracted mod folder and it will detect the components automatically.

---

## Components

The installer offers seven modular components. You can safely install just the first one, or all seven.

| # | Component | What It Does |
|---|---|---|
| **10** | **Core NPC (Required)** | Solaufein joins your party. Includes his items, spells, biography, custom sound barks, and Boo Two the familiar. |
| **20** | **SoA Romance** | The full Shadows of Amn romance arc, including interjections, dream sequences, and plot interjections. |
| **30** | **Eclipse Sequence** | A high-difficulty endgame encounter featuring six unique enemies and a custom area. Requires Component 20. |
| **40** | **Vampiric Solaufein + Cleanse** | Solaufein is abducted by Bodhi in Chapter 6, turned, and can be restored by the Suldanessellar cleanse ritual. Requires Component 20. |
| **50** | **ToB Continuation** | Extends Solaufein's story into Throne of Bhaal, including the Moonblade upgrade and five ending epilogues. Requires Component 10. |
| **60** | **Extras** | Optional tweaks: Korgan loop fix, Viconia Lovetalk 46 fix, multiplayer NPC kick-out dialogue, UHMER store patch. |
| **70** | **Cutscene Hardening** | Optional safety overlay for the Eclipse sequence cutscenes. Purely protective. |

**Minimum install:** Component 10. **Recommended for a full playthrough:** 10 + 20 + 40 + 50.

---

## Languages

The installer will present component names, item descriptions, and dialogue in your selected language. Every translation is a **layered overlay** — any string missing from a language file automatically falls back to English, so no install ever fails on a missing ref.

Supported languages: **American English · Italiano · Deutsch · Français · Português · Polski · Русский · Español**

---

## How It Works

Under the hood, this edition uses proper WeiDU `DEFINE_PATCH_FUNCTION` routines rather than legacy macros:

- **`ee_cre_cleanup.tpa`** — remaps old BG2 animation indices to EE equivalents, sweeps deprecated effect opcodes, and normalizes script slots to lowercase for cross-platform safety.
- **`ee_spell_cleanup.tpa`** — cleans up corrupt spell school values and out-of-bounds projectile fields inside extended spell headers.
- **`ee_cutscene_cleanup.tpa`** — hardens `StartCutSceneMode()` transitions against timing-based engine freezes.

All 2DA modifications use `PRETTY_PRINT_2DA` for column-aligned output and `BUT_ONLY_IF_IT_CHANGES` for load-order safety. No file is written to `override/` unless it was actually modified.

---

## Credits

- **Original Mod Author:** Weimer
- **Modern EE/EET Edition:** /u/celestialfury
- **Italian translation (2.1.2):** Luciana Stella Boscaratto
- **Polish TRAs (2.1.2):** completed for this release
- **Tools:** WeiDU · Near Infinity · Project Infinity

---

## Links

- [Full changelog](solaufeinEE/readme-ee_updates.md)
- [Eclipse readme](solaufeinEE/readme-eclipse.txt)
- [Original Solaufein readme](solaufeinEE/readme-solaromance.txt)
- [Report a bug or request a feature](../../issues)
