<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Cristal Baschet

Status: L1 V5 concept packet; glass-rod friction idiophone study only, not
fabrication-ready.

This repository is a V5 L1 build-packet seed for a Cristal Baschet-inspired
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
- `bom.csv` - estimated subsystem list with pending measurement authority.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register for this concept packet.
- `cad/mcp-session-log.md` - QMD and no-MCP provenance log.

## Core Mechanisms

- Wet fingers rub glass rods to excite stick-slip vibration.
- Each rod couples to a threaded metal stem or similar transmission member.
- Movable masses on stems are treated as setup variables, not released tuning
  data.
- Resonators and radiators convert the stem vibration into audible sound.
- The whisker radiator is a concept surface for broad, sculptural radiation,
  pending measured material, mounting, and safety review.

## Readiness Boundary

L1 means intent, risks, and subsystem interfaces are documented. Promotion to
L2 requires reviewed parameters, measured or sourced reference constraints, and
prototype test plans. L3 or stronger requires validated geometry and measured
setup evidence.
