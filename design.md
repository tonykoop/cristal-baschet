<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Cristal Baschet Design Study

## Design Thesis

This concept treats the Cristal Baschet as a friction-excited transmission and
radiation system rather than a set of decorative sculptures. The playable
surface is the wet-finger glass rod; the engineering core is the chain from rod
contact to threaded stem, movable mass, resonator, and whisker radiator.

## Mechanism Overview

The player wets the fingers and rubs glass rods. Stick-slip motion in the rod
drives a coupled metal stem. The stem carries vibration away from the glass and
into resonating or radiating structures. Threaded hardware and movable masses
allow setup experiments, but this L1 packet does not claim final positions,
pitch values, or measured tuning behavior.

Large cone or flap resonators can emphasize particular voices, while the tall
whisker radiator provides a broad visual and acoustic radiation surface. Both
remain concept mechanisms until their materials, attachment points, stiffness,
and measured response are known.

The design challenge is balancing playability, glass safety, energy transfer,
and serviceability. A beautiful radiator that overloads the glass rod or hides
threaded adjustments is a failed engineering surface. A clean test rig that
lets one rod, one stem, one mass, and one radiator be measured is the right
first artifact.

## Subsystems

### Glass Rod Exciters

- Glass rods are the finger-rubbed excitation surface.
- Rod material, diameter, length, support, and finish are all
  `estimate_pending_measurement`.
- Rod mounting must protect the player from breakage and isolate useful
  vibration from unsafe stress concentration.
- No pitch, tuning, or rod geometry is released in this packet.

### Threaded Stem Transmission

- Threaded stems carry vibration from the rod into downstream radiators.
- Threads are treated as adjustment and coupling features, not as released
  fabrication specs.
- Stem stiffness, boundary condition, nut stack, washer stack, and mass position
  require bench measurement.

### Movable Mass Tuning

- Movable masses on stems are concept setup controls.
- Future work should log mass position, contact tightness, audible response,
  sustain, and unwanted rattles.
- This packet does not provide mass values, coordinates, or tuning tables.

### Cone And Flap Resonators

- Cone and flap resonators are candidate radiation surfaces.
- Each resonator must be tested as a replaceable module rather than fixed into
  the first frame.
- Mounting should allow comparison without rebuilding the glass rod assembly.
- Sheet thickness, cone angle, flap outline, and material are pending review.

### Whisker Radiator

- The whisker radiator is a tall array or bundle-like radiating surface,
  conceptually associated with fiberglass whiskers.
- Safety, splinter control, edge handling, mounting strain, and transport
  protection are first-order design gates.
- Whisker count, length, spacing, and anchoring are not specified at L1.

### Frame And Player Interface

- The frame must hold fragile glass, threaded stems, resonators, and radiator
  surfaces without making setup inaccessible.
- The player interface must keep wet-finger access comfortable while isolating
  sharp, brittle, or high-strain regions.
- Cleaning, drying, rod replacement, and resonator swaps should be possible
  without destructive disassembly.

## Parametric Intent

Future design work should use named parameters before any fabrication file is
created:

- `estimate_glass_rod_count_pending_measurement`
- `estimate_glass_rod_geometry_pending_measurement`
- `estimate_threaded_stem_family_pending_measurement`
- `estimate_movable_mass_position_pending_measurement`
- `estimate_resonator_family_pending_measurement`
- `estimate_whisker_radiator_layout_pending_measurement`
- `estimate_frame_interface_pending_measurement`
- `estimate_player_clearance_pending_measurement`

These names are placeholders, not values.

## First Measurement Gates

- Excitation: verify one glass rod can be played repeatably with wet fingers
  without unsafe mounting stress.
- Transmission: measure whether one stem carries vibration without loosening,
  rattling, or overloading the rod joint.
- Mass sweep: log audible changes from movable mass position without publishing
  final tuning values.
- Resonator swap: compare one cone-like and one flap-like radiator module with
  the same rod/stem setup.
- Whisker safety: test handling, strain relief, and containment before any
  public-facing radiator claim.
- Serviceability: prove rod, stem, mass, and radiator modules can be inspected
  and replaced independently.

## L1 Boundary

This file is a concept and engineering-risk map. It does not provide CAD,
DXF, tooling instructions, dimensions, tuning, pressure values, resonator
coordinates, or a measured acoustic model.
