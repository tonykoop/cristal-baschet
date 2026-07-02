<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Cristal Baschet

**Status:** L2 V5 build-packet candidate; glass-rod friction idiophone study
only, not fabrication-ready.

This repository is a V5 L2 planning packet for a Cristal Baschet-inspired
instrument. The design centers on glass rods rubbed with wet fingers,
vibration carried through threaded metal stems, adjustable masses on those
stems, large cone or flap resonators, and a tall whisker-style radiator.

This packet is intentionally conservative. It does not release rod dimensions,
thread sizes, resonator geometry, whisker layout, stem lengths, mass positions,
tuning values, CAD, DXF, toolpaths, acoustic predictions, or fabrication
instructions. Every physical claim remains `estimate_pending_measurement` until
a measured reference, prototype, or reviewed design table exists.

## Packet Map

- `design.md` - mechanism, parametric intent, and measurement gates.
- `bom.csv` - subsystem-level materials and support inventory with pending
  measurement authority.
- `cut-list.csv` - non-dimensional cut/workpiece planning list; all sizes and
  counts remain pending measurement.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register for this concept packet.
- `cad/mcp-session-log.md` - QMD and no-MCP provenance log.
- `sourcing.csv`, `validation.csv`, `risks.md`, `drawing-brief.md` - V5
  baseline packet tables (TBD-marked; no design table exists yet).
- `cad/cristal-baschet.scad` - non-dimensional frame/rod-array bounding
  envelope; authority `pending_measurement`.
- `evolution/` - evolution-pipeline Stage 0 intake: master manifest,
  design-intent, and revision register (Gate A not yet run).

## Core Mechanisms

- Wet fingers rub glass rods to excite stick-slip vibration.
- Each rod couples to a threaded metal stem or similar transmission member.
- Movable masses on stems are treated as setup variables, not released tuning
  data.
- Resonators and radiators convert the stem vibration into audible sound.
- The whisker radiator is a concept surface for broad, sculptural radiation,
  pending measured material, mounting, and safety review.

## L2 Readiness Boundary

L2 means the packet now names the shop subsystems, cut/workpiece categories,
review gates, and authority boundaries a careful builder would need before
deciding what to measure next. It is still not build-ready: rod stock, stem
hardware, masses, resonators, radiator material, frame layout, dimensions, and
tuning behavior all require measured or sourced evidence. L3 or stronger
requires validated geometry and measured setup evidence.
