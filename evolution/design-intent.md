# Design Intent — cristal-baschet rev A

- Master CAD: `cad/cristal-baschet.scad` (sha256: 4cdb730e0f642665c029e829bbd6ca33181440ba16682b894b22ac8d23e1214a) — a non-dimensional frame/rod-array bounding envelope. No design table (xlsx) exists for this instrument; `design.md` and `decision-record.md` are the governing sources.
- Function: Friction-excited glass idiophone. Wet fingers rub glass rods to excite stick-slip vibration; each rod couples through a threaded metal stem (with movable tuning mass) to a swappable resonator module (cone, flap, or whisker radiator) mounted on a frame. Every rod/stem/resonator dimension remains `estimate_pending_measurement` (design.md).
- Environment: bench/studio use; glass rods are fragile and require wet-finger contact; whisker radiator raises splinter/handling risk (risks.md).
- Target qty: 1 (prototype bench rig). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Rod count / spacing | 8 rods @ 2.5 in (assumption) | none — bench-planning only | wet-finger play access clearance | cad/cristal-baschet.scad header (assumption, not a design-table value) |
| Rod diameter / length | TBD | measurement_required | excitation, breakage risk | design.md exciter subsystem, cut-list.csv CL-001 |
| Stem thread family / length | TBD | measurement_required | vibration transmission | design.md transmission subsystem, cut-list.csv CL-003 |
| Movable mass position | TBD | measurement_required | tuning (not released) | design.md tuning_setup subsystem |
| Resonator geometry (cone/flap/whisker) | TBD | measurement_required | acoustic radiation | design.md radiators subsystem, cut-list.csv CL-005..CL-008 |
| Frame rail / leg dimensions | assumption bounding box only | none — bench-planning only | shop-space blocking | cad/cristal-baschet.scad header (assumption) |

## Incidental (free for DFM)

- Frame rail/leg cross-section styling, finish, and color; exact rod count and spacing (bench-planning placeholders, not released tuning geometry).

## Must-nots (DFM may never violate)

- Never invent rod, stem, mass, or resonator dimensions — every value in cut-list.csv/bom.csv stays `estimate_pending_measurement` until a coupon test or design table sets it (design.md, decision-record.md).
- Do not fabricate the whisker radiator before the safety/containment review in risks.md and decision-record.md clears.
- Do not treat the OpenSCAD envelope as a rod-tuning or resonator-acoustics model — it is explicitly out of scope (cad/cristal-baschet.scad header).
- Do not close/finalize the frame before rod, stem, and radiator modules have been bench-tested as independently serviceable (design.md Frame And Player Interface).

## Material intent

- Preferred: per bom.csv subsystem categories (glass rods, threaded metal stems, resonator sheet stock, fiberglass whisker material, frame stock) — all quantities/specs `estimate_pending_measurement`.
- Acceptable subs: none recorded (sourcing.csv is TBD pending coupon-test specs).
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
