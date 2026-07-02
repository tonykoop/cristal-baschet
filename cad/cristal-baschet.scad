// Cristal Baschet — frame / rod-array ENVELOPE ONLY
// SPDX-License-Identifier: CC-BY-4.0
//
// Source of truth: no design table (xlsx) or measured reference exists for
// this instrument yet (see ../design.md, ../decision-record.md). Every
// dimension below is an `assumption` bounding-envelope placeholder for
// bench-rig layout planning, NOT a released rod, stem, or resonator spec.
//
// Authority: pending_measurement. NOT fabrication authority until reviewed
// against a measured reference or design table (see
// ../visual-output-register.csv, ../cad/mcp-session-log.md).
//
// EXPLICITLY OUT OF SCOPE (per design.md subsystem gates — hand-refined,
// tuning-sensitive regions this envelope does not model):
//   - glass rod diameter/length/finish and wet-finger friction tuning
//   - threaded stem thread family, length, and boundary conditions
//   - movable-mass position / tuning-table values
//   - cone/flap/whisker resonator geometry and acoustic response
// This file models only the bounding frame and rod-array LAYOUT (count and
// spacing as bench-planning placeholders) so a builder can block out shop
// space and a swappable-module frame before any of the above is measured.

// ---- Parameters (all `assumption`, bounding-envelope only) ----
rod_count           = 8;      // assumption: bench-rig planning count, design.md BOM-001 (not released)
rod_spacing_in       = 2.5;   // assumption: clearance for wet-finger play access, design.md player_interface subsystem
rod_envelope_len_in  = 20;    // assumption: bounding length only, NOT a released rod length (design.md CL-001: pending_measurement)
rod_envelope_dia_in  = 0.75;  // assumption: bounding diameter only, NOT a released rod diameter (design.md CL-001: pending_measurement)
stem_envelope_len_in = 10;    // assumption: bounding length only, NOT a released stem length (design.md CL-003: pending_measurement)
stem_envelope_dia_in = 0.375; // assumption: bounding diameter only, NOT a released stem diameter (design.md CL-003: pending_measurement)
frame_rail_len_in    = rod_count * rod_spacing_in + 6;  // formula: rod array footprint + margin, not a fixed value
frame_rail_h_in      = 4;     // assumption: rail cross-section height, design.md CL-009 (pending_measurement)
frame_rail_w_in      = 2;     // assumption: rail cross-section width, design.md CL-009 (pending_measurement)
frame_leg_h_in       = 30;    // assumption: player standing/seated access height, design.md player_interface subsystem

in = 25.4; // mm per inch

// ---- Modules ----

// One rod-array bounding envelope (cylinder placeholder — NOT a rod spec)
module rod_envelope() {
    cylinder(h = rod_envelope_len_in * in, d = rod_envelope_dia_in * in, center = false, $fn = 24);
}

// One stem-array bounding envelope (cylinder placeholder — NOT a stem spec)
module stem_envelope() {
    cylinder(h = stem_envelope_len_in * in, d = stem_envelope_dia_in * in, center = false, $fn = 16);
}

// Frame rail bounding box (base rail the rod/stem modules mount to)
module frame_rail() {
    cube([frame_rail_len_in * in, frame_rail_w_in * in, frame_rail_h_in * in], center = false);
}

// Frame legs (simple bounding-box supports, count derived from rail length)
module frame_legs() {
    leg_w_in = frame_rail_w_in;
    for (x = [leg_w_in, frame_rail_len_in - leg_w_in])
        translate([x * in, 0, -frame_leg_h_in * in])
            cube([leg_w_in * in, frame_rail_w_in * in, frame_leg_h_in * in], center = false);
}

// Rod + stem array laid out across the rail (bench-rig planning layout only)
module rod_stem_array() {
    for (i = [0 : rod_count - 1]) {
        x = (3 + i * rod_spacing_in) * in;
        translate([x, frame_rail_w_in * in / 2, frame_rail_h_in * in])
            rod_envelope();
        translate([x, frame_rail_w_in * in / 2, frame_rail_h_in * in - stem_envelope_len_in * in])
            stem_envelope();
    }
}

// ---- Top-level assembly ----
module cristal_baschet_envelope() {
    color("SlateGray") frame_rail();
    color("DimGray") frame_legs();
    color("LightSkyBlue") rod_stem_array();
}

cristal_baschet_envelope();
