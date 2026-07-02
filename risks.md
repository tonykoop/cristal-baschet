<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Cristal Baschet Risks

- Glass rods are fragile and can shatter or splinter under unsafe mounting
  stress or mishandling; rod support and edge finishing must be reviewed
  before any play testing (design.md exciter subsystem).
- The whisker radiator is a fiberglass-adjacent safety-critical surface;
  splinter control, edge handling, mounting strain, and transport protection
  are first-order gates before any public-facing use (decision-record.md).
- Threaded stem joints can loosen, rattle, or overload the rod joint if
  coupling hardware is undersized; treat as a bench-measured item, not an
  assumed spec.
- Movable-mass tuning setups are not final until a mass-sweep log exists;
  do not publish or fabricate to an unmeasured tuning target.
- No design table, measured reference, or prototype currently exists for this
  instrument; every physical dimension in this packet is
  `estimate_pending_measurement` and must not be treated as build-ready.
- Remain at L2 until the one-rod bench rig and radiator coupon tests produce
  measured evidence (see design.md L2 Boundary).
