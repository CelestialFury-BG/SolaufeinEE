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
| Partial support-CRE field writes | Only the joinable NPC was authored | Support creatures (`solafoe`, `solaboo`, `solavamp`, `solaspi`, `solaspy1/2`) ship with broken Dialogue resrefs and empty Script names, causing silent failure of their dialogue and death-variable checks |
| Phantom entries in known-spells tables | The original engine ignored them | Near Infinity displays them as `0.SPL`, inflating the count and shifting every subsequent entry's index |

### What This Edition Does Differently

Every item above has a corresponding fix in this edition:

- **All-lowercase filenames** — installs cleanly on Windows, Linux, and macOS
- **`setup-solaufeinEE.tp2`** — auto-detected by Project Infinity and WeiduModPackager
- **`HANDLE_CHARSETS`** — every translation reads as UTF-8 natively, regardless of the installing system's codepage
- **`BUT_ONLY_IF_IT_CHANGES`** on every file-modifying `COPY` — shared tables are only written when actually modified, so this mod can be installed alongside SCS, Tweaks, and anything else that patches the same files
- **`PRETTY_PRINT_2DA`** on every 2DA patch — output matches BioWare's column-aligned format
- **`EE_CRE_CLEANUP` / `EE_SPELL_CLEANUP` / `EE_CUTSCENE_CLEANUP`** patch functions — sweep deprecated effect opcodes, normalize script-name casing, clamp out-of-range saving throws, and harden cutscene timing for the EE engine
- **`EE_SET_CRE_FIELDS`** (in `ee_cre_fields.tpa`) — a reusable joinable-NPC field writer that binds script name, dialogue resref, and the known-spells table at NI-confirmed CRE v1.0 offsets. One `STR_VAR` parameter per field, never a delimited list, so it parses cleanly on WeiDU 25100 and any future version
- **`EE_COMPACT_KNOWN_SPELLS`** — removes phantom known-spells entries whose resref is not a real resref and shifts the remaining entries left. Detection uses the first byte of the resref (printable ASCII vs control byte) so it correctly identifies entries Near Infinity renders as `0.SPL`. Idempotent: running twice produces no second-pass changes
- **CRE v1.0 format guard** on every binary write — `READ_ASCII 0x04` + `STRING_EQUAL ~V1.0~`. A future Beamdog format change skips rather than corrupts, instead of the legacy pattern of writing to a hardcoded offset regardless of format
- **Working bark playback** — barks are written via `SAY` rather than raw `WRITE_LONG`, and each bark string in `wsetup.tra` carries a `[blank]` tag that associates a silent placeholder WAV with the TLK entry. This is required because BG2EE suppresses any bark whose TLK entry has no associated sound file. A legacy port that writes barks via raw `WRITE_LONG` produces slots that look correct in Near Infinity but never fire in-game
- **Support-CRE field writes** — `solafoe.cre`, `solaboo.cre`, `solavamp.cre`, `solaspi.cre`, `solaspy1.cre`, and `solaspy2.cre` receive explicit `script_name` and (where applicable) `dialogue_resref` writes. Legacy ports typically only patch the joinable NPC, leaving the support creatures with broken Dialogue resrefs (e.g. `SOLAN.DLG` on `solafoe.cre`) and empty Script names
- **Per-dialogue TRA scoping** — each `.d` file compiles with only its own TRA files, eliminating cross-file `@n` collisions
- **Content-aligned component layout** — five components grouped by when their content actually fires in the campaign, with verified `REQUIRE_COMPONENT` and `REQUIRE_PREDICATE` chains. You can install just Core, or Core + ToB Continuation, or any other combination, and the installer refuses invalid combinations
- **Dynamic `RESOLVE_STR_REF` allocation** for ToB epilogues — the ending screen always displays the correct text, in any language

### Component Layout

This edition groups its components by **when the content fires in the campaign**, not by arbitrary categories:

| Designated | Name | Content fires in |
|---|---|---|
| 10 | Core NPC + SoA Content | SoA + ToB (joinable NPC, spawn triggers, banter, SoA-side quests) |
| 20 | Vampiric Solaufein + Cleanse | SoA Chapter 6 (Bodhi abduction) |
| 30 | ToB Continuation | Throne of Bhaal (interjections, epilogue) |
| 40 | Eclipse Sequence | Throne of Bhaal (post-Sendai/Abazigal challenge) |
| 50 | Extras | Any (independent vanilla patches, does not require Component 10) |

A user who wants only the joinable NPC installs Component 10. A user who wants the full original mod experience installs 10 + 20 + 30 + 40 (and optionally 50). A user who wants just the ToB challenge fight installs 10 + 40, without being forced into the SoA side content or the vampire branch.

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
| Support-CRE field binding | None | `EE_SET_CRE_FIELDS` on `solafoe`, `solaboo`, `solavamp`, `solaspi`, `solaspy1`, `solaspy2` |
| Known-spells table | Phantom `0.SPL` entry at index 0 | Compacted via `EE_COMPACT_KNOWN_SPELLS` |
| Component structure | Single monolithic | Five modular components, content-aligned |
| Component renumbering | N/A | Designated IDs 10/20/30/40/50 |
| CRE tiers | Reduced (single level) | All six original tiers + `udsola01/02` |
| Sound slots restored | Partial | Full 12-slot set: `MORALE`, `INITIAL_MEETING`, `HAPPY`, `UNHAPPY_ANNOYED`, `UNHAPPY_SERIOUS`, `UNHAPPY_BREAKING_POINT`, `LEADER`, `BORED`, `BATTLE_CRY1`, `SELECT_COMMON1`, `CRITICAL_HIT`, `CRITICAL_MISS` |
| Bark content | Original template audio (generic BioWare creature barks) | Correct Solaufein lines sourced from `wsetup.tra` |
| Bark playback in-game | Silent — text-only strrefs suppressed by BG2EE | Fires correctly via `SAY` + TRA `[blank]` + silent placeholder WAV |
| Bark audio | Original generic creature audio, if any | Silent (no Solaufein voice set exists); the floating bark text displays |
| ToB Fate Spirit summon | Absent | Present via `fatesp.d` in Component 10 |
| SoA spawn triggers | Partial or absent | Present in Component 10 (`sola2500.baf`, `sola2100.baf`) |
| Eclipse dialogue double-fire | Present | Fixed (removed stray `StartDialogueNoSet` in `solae4.baf`) |
| Eclipse caster memorization | Relies on empty memorized tables (broken) | LOCALS-global spell economy in each caster's BAF, cast via `SpellNoDec()` |
| ToB interjection SOLA.DLG dependency | Fragile (aborts on `CHAIN3` if SoA component skipped) | `SOLA.DLG` compiled in Core, always present |
| Cross-mod compatibility checks | None | `FILE_EXISTS_IN_GAME` guards for optional dependencies |
| Languages | 4 | 8, with layered English fallback |
| EE cutscene hardening | None | `EE_CUTSCENE_CLEANUP`, folded into Component 40 |
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
- **You want Archryssa to actually deliver her intro dialogue** — legacy ports ship `solafoe.cre` with a Dialogue resref of `SOLAN.DLG`, which does not resolve. Archryssa's intro never fires. This edition writes `SOLAFOE.DLG` into the field
- **You use ValenEE alongside this mod** — the cross-mod interjections only compile when Valen is installed first. Legacy ports don't ship these at all; this edition does, but only in the correct install order
- **You want a clean known-spells table** — the shipped 2010 CREs have a phantom entry at index 0 (Near Infinity displays it as `0.SPL`) that inflates the count. This edition compacts it away
- **You want the ToB fate spirit to be able to summon Solaufein** — legacy ports omit this; this edition includes it in Component 10

For all of these scenarios, this edition is the correct choice. For a Windows-only, English-only, minimal-mod install on original BG2, a legacy port will serve you fine — the content is the same either way.

### A Word on the Original Engine

This edition explicitly **refuses to install** on the original BG2 or on a non-EE game. This is deliberate: the binary file formats, script opcodes, and engine behavior for `StartCutSceneMode`, `StartDialogueNoSet`, and the CRE sound slot layout are all different between classic BG2 and BG2EE. Writing code that satisfies both engines means writing code that is optimal for neither. This edition commits to the EE family so that every patch, every cleanup routine, and every 2DA format assumption can be made without compromise.

If you're on the original engine, a pre-EE build of Solaufein is the right choice. If you're on BG2EE or EET — which is the overwhelming majority of active installs today — this edition is built specifically for you.

### Compatibility Notes for Specific Mods

**ValenEE.** If you want the cross-mod interjections between Solaufein and Valen (156 additional strings compiled into `solaint.d`), you must install ValenEE **before** SolaufeinEE. This is a documented, one-way dependency: Solaufein's Component 10 checks `FILE_EXISTS_IN_GAME ~valenj.dlg~` at install time, and that check succeeds only if Valen is already installed. Both install orders produce a working Solaufein; only the Valen-first order includes the cross-mod dialogue.

Note that ValenEE's Component 20 (Give More Creatures Protection From Level Drain & Undead) scans every CRE in `override/` and patches those matching its race/class criteria. If ValenEE is installed after SolaufeinEE, this scan will touch two Solaufein CREs (`solafoe.cre` and `solae4.cre`) and give them the `PRODEAD` item. This is a small difficulty tweak, not a compatibility break. If you want the pure Solaufein Eclipse encounter without the extra protection, install SolaufeinEE first.

**Sword Coast Stratagems (SCS), Tweaks Anthology, and other large mod stacks.** This edition uses `BUT_ONLY_IF_IT_CHANGES` on every file-modifying `COPY` and `PRETTY_PRINT_2DA` on every 2DA patch. It can be installed alongside SCS and Tweaks without clobbering their changes to shared tables like `pdialog.2da`, `scrpdesc.2da`, or the CRE files it touches. Load-order recommendation: install SolaufeinEE after the content mods (SCS, Tweaks, spell packs) but before UI and text tweak packs.

**Classic (non-EE) Solaufein ports.** Cannot coexist with this edition. If you have an older Solaufein Romance installed, uninstall it before installing this edition, and start a new save. Saves made under a classic install embed strref numbers that resolve differently under this edition's tlk layout.

**EET (Enhanced Edition Trilogy).** Fully supported. The mod installs into the BG2EE portion of the EET installation. `GAME_IS ~bg2ee eet~` guards the Core component; the SoA content fires after the EET transition into SoA, and the ToB content fires after the transition into ToB.
