<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# MCP Session Log

No MCP, rendering, image-generation, creative-tool, SolidWorks, DXF, or
acoustic-computation session was run for this L2 packet. As of the 2026-07-01
V5 refresh, one non-dimensional OpenSCAD frame/rod-array envelope
(`cad/cristal-baschet.scad`) was authored and render-checked — see the
`fable-v5-refresh-2026-07-01` rows below. It carries `pending_measurement`
authority and does not model rod, stem, or resonator dimensions, tuning
numbers, pressure values, DXF coordinates, G-code, or fabrication outputs.

## QMD Step 0

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-qmd-query | qmd CLI | `qmd query "cristal-baschet Cristal Baschet - glass rods rubbed with wet fingers, vibration transmitted through threaded metal stems to large metal cone/flap resonators and a tall fiberglass 'whisker' radiator; tuning by mass position on the stems"` | none | context_retrieval | concept_only | attempted | Query reached search and rerank, then timed out after 30 seconds before returning usable context. |
| 2026-05-30-local-authoring | Codex local edit | Real Cristal Baschet mechanism knowledge plus timed-out QMD Step 0 | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | concept_packet_authoring | concept_only | self_checked | Authored an L1 concept packet only. All fabrication-relevant claims remain pending measurement. |
| 2026-05-30-r7-qmd-search | qmd CLI | `qmd search "cristal-baschet" -c instrument-builds` | none | context_retrieval | concept_only | attempted | Search failed locally because sqlite-vec was unavailable: unable to open database file. No external context was used for fabricated geometry, tuning, or dimensions. |
| 2026-05-30-r7-l2-uplift | Codex local edit | Repository README/design/BOM/decision record plus failed QMD Step 0 | `README.md`; `design.md`; `bom.csv`; `cut-list.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | l2_planning_uplift | pending_measurement | self_checked | Promoted to L2 planning handoff by adding non-dimensional shop interfaces and measurement gates only. |
| 2026-05-30-r8-wolfram-hand-authored | Codex local edit | Round 8 Wolfram author contract; existing L2 packet boundary | `cristal-baschet-starter.wl`; `wolfram/cristal-baschet-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | reference_only_wolfram_source | reference_only | self_checked | No MCP, Wolfram Desktop, Wolfram Cloud, CAD, DXF, measurement, tuner, rod-rub test, resonator test, or acoustic calibration session was run; source was authored by hand with estimate placeholders only. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md, decision-record.md (no design table/xlsx exists for this instrument) | bom.csv, cut-list.csv, sourcing.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass: added sourcing.csv and validation.csv baseline files; reviewed existing bom.csv/cut-list.csv against design.md — no dimension changes made, all rows remain estimate_pending_measurement. Provenance rows added to satisfy V5 fabrication-artifact logging. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | design.md subsystem gates (no design table/xlsx; all values marked `assumption`) | cad/cristal-baschet.scad | cad_authoring | pending_measurement | self_checked | Non-dimensional frame/rod-array bounding envelope (rod count/spacing, rail, legs) authored as bench-planning layout only; rod friction tuning, stem thread geometry, mass position, and resonator acoustics explicitly out of scope per design.md subsystem gates. OpenSCAD render check: pass (openscad -o STL, exit 0). |
