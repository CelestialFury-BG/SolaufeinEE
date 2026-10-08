## A Note on Legacy Ports and This Edition

There are several community builds of the Solaufein mod in circulation. This section explains how this edition differs technically from legacy ports — not to critique any particular author's work, but because the differences determine whether the mod installs cleanly on a modern Enhanced Edition setup.

**All builds preserve the original Weimer content.** Every dialogue, banter, quest, item, and epilogue text is intact. If you only care about the writing, any build will show it to you.

**The technical foundation is where builds diverge.** Legacy ports were written for the original BG2 engine (2000–2013) and then moved to EE with minimal changes. This edition was rebuilt from the ground up for BG2EE and EET specifically.

### What Legacy Ports Typically Do

Most pre-EE mods, and the ports derived from them, share a common set of patterns that worked fine on the original engine but create problems on EE:

| Legacy Pattern | Why It Was Fine Then | Why It Matters on EE |
|---|---|---|
| Mixed-case filenames (`SOLABLAD.ITM` referenced as `solablad.itm`) | Windows is case-insensitive | Aborts install on Linux and macOS |
| `Setup-` TP2 prefix (capital S) | Manual `weidu.exe` invocation | Breaks auto-discovery in Project Infinity and modern packagers |
| No `HANDLE_CHARSETS` directive | One system codepage per user | Russian and Chinese TRAs render as mojibake on modern systems |
| Unconditional `COPY` to `override/` | Mods were installed one at a time | Clobbers shared tables that other mods depend on |
| No `PRETTY_PRINT_2DA` on appends | The engine tolerated ragged columns | Column misalignment breaks subsequent mod parsing |
| Raw `WRITE_ASCII`/`WRITE_LONG` on binary offsets | The offset was stable for the BG2 file format | Corrupts files if the shipped EE format differs |
| Barks written via `WRITE_LONG` with text-only strrefs | Original BG2 fired text-only barks fine | BG2EE suppresses any bark whose TLK entry has no associated sound file — the strref writes correctly and NI shows it, but no bark fires in-game |
| `AUTO_TRA` for translations | Single TRA namespace worked | Silent string collisions when multiple TRA files define the same `@n` |
| Single monolithic component | Players wanted one install click | No dependency verification, no partial installs, no modularity |
| Static string pointers for ToB epilogues | String resources were stable | Epilogues misalign or display wrong text after EE patches |

### What This Edition Does Differently

Every item above has a corresponding fix in this edition:

- **All-lowercase filenames** — installs cleanly on Windows, Linux, and macOS
- **`setup-solaufeinEE.tp2`** — auto-detected by Project Infinity and WeiduModPackager
- **`HANDLE_CHARSETS`** — every translation reads as UTF-8 natively, regardless of the installing system's codepage
- **`BUT_ONLY_IF_IT_CHANGES`** on every file-modifying `COPY` — shared tables are only written when actually modified, so this mod can be installed alongside SCS, Tweaks, and anything else that patches the same files
- **`PRETTY_PRINT_2DA`** on every 2DA patch — output matches BioWare's column-aligned format
- **`EE_CRE_CLEANUP` / `EE_SPELL_CLEANUP` / `EE_CUTSCENE_CLEANUP`** patch functions — remap legacy animation IDs, sweep deprecated effect opcodes, and harden cutscene timing for the EE engine
- **`EE_SET_CRE_FIELDS`** (in `ee_cre_fields.tpa`) — a reusable joinable-NPC field writer that binds script name, dialogue resref, and the known-spells table at NI-confirmed CRE v1.0 offsets. One `STR_VAR` parameter per field, never a delimited list, so it parses cleanly on WeiDU 25100 and any future version
- **CRE v1.0 format guard** on every binary write — `READ_ASCII 0x04` + `STRING_EQUAL ~V1.0~`. A future Beamdog format change skips rather than corrupts, instead of the legacy pattern of writing to a hardcoded offset regardless of format
- **Working bark playback** — barks are written via `SAY` rather than raw `WRITE_LONG`, and each bark string in `wsetup.tra` carries a `[blank]` tag that associates a silent placeholder WAV with the TLK entry. This is required because BG2EE suppresses any bark whose TLK entry has no associated sound file. A legacy port that writes barks via raw `WRITE_LONG` produces slots that look correct in Near Infinity but never fire in-game
- **Per-dialogue TRA scoping** — each `.d` file compiles with only its own TRA files, eliminating cross-file `@n` collisions
- **Seven modular components** with `DESIGNATED` IDs and verified `REQUIRE_COMPONENT` chains — you can install just the Core NPC, or the full experience, and the installer refuses invalid combinations
- **Dynamic `RESOLVE_STR_REF` allocation** for ToB epilogues — the ending screen always displays the correct text, in any language

### Full Comparison Table

| Capability | Legacy Port | This Edition |
|---|---|---|
| Target platform | Original BG2 engine, ported forward | BG2EE / EET, designed for EE |
| Filename casing | Mixed | All lowercase |
| TP2 prefix | `Setup-` (capital) | `setup-` |
| Translation encoding | System codepage | Native UTF-8 via `HANDLE_CHARSETS` |
| Load-order safety | None | Full `BUT_ONLY_IF_IT_CHANGES` |
| 2DA formatting | Ragged columns | `PRETTY_PRINT_2DA` |
| Binary file writes | Raw offsets, format-unaware | Format-aware patching via `lib/*.tpa`, with CRE v1.0 guard |
| Joinable-NPC field binding | Raw `WRITE_ASCII` at hand-picked offsets | `EE_SET_CRE_FIELDS` at NI-confirmed v1.0 offsets |
| Component structure | Single monolithic | Seven modular components |
| CRE tiers | Reduced (single level) | All six original tiers + `udsola01/02` |
| Sound slots restored | Partial | Full 12-slot set: `MORALE`, `INITIAL_MEETING`, `HAPPY`, `UNHAPPY_ANNOYED`, `UNHAPPY_SERIOUS`, `UNHAPPY_BREAKING_POINT`, `LEADER`, `BORED`, `BATTLE_CRY1`, `SELECT_COMMON1`, `CRITICAL_HIT`, `CRITICAL_MISS` |
| Bark content | Original template audio (generic BioWare creature barks) | Correct Solaufein lines sourced from `wsetup.tra` |
| Bark playback in-game | Silent — text-only strrefs suppressed by BG2EE | Fires correctly via `SAY` + TRA `[blank]` + silent placeholder WAV |
| Bark audio | Original generic creature audio, if any | Silent (no Solaufein voice set exists); the floating bark text displays |
| ToB Fate Spirit summon | Absent | Present via `fatesp.d` |
| Eclipse dialogue double-fire | Present | Fixed |
| Component 30 dependency | Requires Component 10 only | Requires Component 20 (which requires 10) |
| Cross-mod compatibility checks | None | `FILE_EXISTS_IN_GAME` guards for optional dependencies |
| Languages | 4 | 8, with layered English fallback |
| EE cutscene hardening | None | `EE_CUTSCENE_CLEANUP` |
| Project Infinity metadata | None or partial | Full `solaufeinEE.ini` + `solaufeinEE.json` |
| Cross-mod install-order docs | None | Documented Valen-before-Solaufein requirement for cross-mod interjections |

### Why This Matters for EE Users

On a lightly modded BG2EE install running on Windows, a legacy port will often work. The problems surface when any of these are true:

- **You're on Linux or macOS** — mixed-case filenames and non-UTF-8 TRAs will abort or garble the install
- **You're running a large mod stack** — unconditional `COPY` to `override/` overwrites tables that SCS, Tweaks, or other mods have already customized
- **You've installed another mod that ships Solaufein content** — duplicate `pdialog.2da` rows can corrupt the party menu
- **You want to install only part of the mod** — legacy ports don't offer granular components
- **You play in a non-English language** — legacy ports only translate the strings their original translator chose to include
- **You want Solaufein to actually speak when you click him** — legacy ports that write barks via raw `WRITE_LONG` produce silent CRE slots on BG2EE because the TLK entries have no associated sound file. This edition associates a silent placeholder WAV with each bark string, which is what allows the engine to fire the bark and display the floating text. Bark audio is silent because no Solaufein voice set exists, but the text displays correctly on portrait click, combat start, critical hit, and the other normal trigger conditions
- **You use ValenEE alongside this mod** — the cross-mod interjections only compile when Valen is installed first. Legacy ports don't ship these at all; this edition does, but only in the correct install order

For all of these scenarios, this edition is the correct choice. For a Windows-only, English-only, minimal-mod install on original BG2, a legacy port will serve you fine — the content is the same either way.

### A Word on the Original Engine

This edition explicitly **refuses to install** on the original BG2 or on a non-EE game. This is deliberate: the binary file formats, script opcodes, and engine behavior for `StartCutSceneMode`, `StartDialogueNoSet`, and the CRE sound slot layout are all different between classic BG2 and BG2EE. Writing code that satisfies both engines means writing code that is optimal for neither. This edition commits to the EE family so that every patch, every cleanup routine, and every 2DA format assumption can be made without compromise.

If you're on the original engine, a pre-EE build of Solaufein is the right choice. If you're on BG2EE or EET — which is the overwhelming majority of active installs today — this edition is built specifically for you.
