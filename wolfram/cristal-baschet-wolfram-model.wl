(* Cristal Baschet parametric acoustic and engineering model.
   Wolfram Language 14.3.
   All numeric physical inputs are estimates only: pending measurement, not fabrication authority. *)

ClearAll["Global`*"];

cristalBaschetMetadata = <|
  "instrument" -> "cristal-baschet",
  "packet" -> "Round 8 Wolfram build-packet model",
  "modelName" -> "Estimate-only glass rod, stem-mass, and radiator coupling explorer",
  "authority" -> "reference_only",
  "measurementStatus" -> "pending measurement, not fabrication authority"
|>;

(* estimate - pending measurement, not fabrication authority *)
glassRodLengthEstimate = 0.42;
(* estimate - pending measurement, not fabrication authority *)
glassRodLengthMinEstimate = 0.15;
(* estimate - pending measurement, not fabrication authority *)
glassRodLengthMaxEstimate = 0.90;
(* estimate - pending measurement, not fabrication authority *)
glassRodLengthStepEstimate = 0.005;

(* estimate - pending measurement, not fabrication authority *)
glassRodDiameterEstimate = 0.010;
(* estimate - pending measurement, not fabrication authority *)
glassRodDiameterMinEstimate = 0.004;
(* estimate - pending measurement, not fabrication authority *)
glassRodDiameterMaxEstimate = 0.025;
(* estimate - pending measurement, not fabrication authority *)
glassRodDiameterStepEstimate = 0.0005;

(* estimate - pending measurement, not fabrication authority *)
glassYoungModulusEstimate = 6.4*10^10;
(* estimate - pending measurement, not fabrication authority *)
glassYoungModulusMinEstimate = 4.5*10^10;
(* estimate - pending measurement, not fabrication authority *)
glassYoungModulusMaxEstimate = 8.0*10^10;
(* estimate - pending measurement, not fabrication authority *)
glassYoungModulusStepEstimate = 0.1*10^10;

(* estimate - pending measurement, not fabrication authority *)
glassDensityEstimate = 2500.;
(* estimate - pending measurement, not fabrication authority *)
glassDensityMinEstimate = 2200.;
(* estimate - pending measurement, not fabrication authority *)
glassDensityMaxEstimate = 3200.;
(* estimate - pending measurement, not fabrication authority *)
glassDensityStepEstimate = 25.;

(* estimate - pending measurement, not fabrication authority *)
stemLengthEstimate = 0.20;
(* estimate - pending measurement, not fabrication authority *)
stemLengthMinEstimate = 0.05;
(* estimate - pending measurement, not fabrication authority *)
stemLengthMaxEstimate = 0.45;
(* estimate - pending measurement, not fabrication authority *)
stemLengthStepEstimate = 0.005;

(* estimate - pending measurement, not fabrication authority *)
stemDiameterEstimate = 0.006;
(* estimate - pending measurement, not fabrication authority *)
stemDiameterMinEstimate = 0.002;
(* estimate - pending measurement, not fabrication authority *)
stemDiameterMaxEstimate = 0.018;
(* estimate - pending measurement, not fabrication authority *)
stemDiameterStepEstimate = 0.0005;

(* estimate - pending measurement, not fabrication authority *)
stemYoungModulusEstimate = 2.0*10^11;
(* estimate - pending measurement, not fabrication authority *)
stemYoungModulusMinEstimate = 8.0*10^10;
(* estimate - pending measurement, not fabrication authority *)
stemYoungModulusMaxEstimate = 2.2*10^11;
(* estimate - pending measurement, not fabrication authority *)
stemYoungModulusStepEstimate = 0.05*10^11;

(* estimate - pending measurement, not fabrication authority *)
movableMassEstimate = 0.08;
(* estimate - pending measurement, not fabrication authority *)
movableMassMinEstimate = 0.005;
(* estimate - pending measurement, not fabrication authority *)
movableMassMaxEstimate = 0.40;
(* estimate - pending measurement, not fabrication authority *)
movableMassStepEstimate = 0.005;

(* estimate - pending measurement, not fabrication authority *)
radiatorEffectiveMassEstimate = 0.35;
(* estimate - pending measurement, not fabrication authority *)
radiatorEffectiveMassMinEstimate = 0.05;
(* estimate - pending measurement, not fabrication authority *)
radiatorEffectiveMassMaxEstimate = 2.0;
(* estimate - pending measurement, not fabrication authority *)
radiatorEffectiveMassStepEstimate = 0.01;

(* estimate - pending measurement, not fabrication authority *)
radiatorStiffnessEstimate = 2.5*10^4;
(* estimate - pending measurement, not fabrication authority *)
radiatorStiffnessMinEstimate = 1.0*10^3;
(* estimate - pending measurement, not fabrication authority *)
radiatorStiffnessMaxEstimate = 5.0*10^5;
(* estimate - pending measurement, not fabrication authority *)
radiatorStiffnessStepEstimate = 1.0*10^3;

(* estimate - pending measurement, not fabrication authority *)
stemCouplingFactorEstimate = 0.25;
(* estimate - pending measurement, not fabrication authority *)
stemCouplingFactorMinEstimate = 0.0;
(* estimate - pending measurement, not fabrication authority *)
stemCouplingFactorMaxEstimate = 0.8;
(* estimate - pending measurement, not fabrication authority *)
stemCouplingFactorStepEstimate = 0.01;

rodAreaEstimate[diameter_] := Pi diameter^2/4;

longitudinalRodFrequencyEstimate[length_, youngModulus_, density_] :=
  Sqrt[youngModulus/density]/(2 length);

rodMassEstimate[length_, diameter_, density_] :=
  density rodAreaEstimate[diameter] length;

axialStemStiffnessEstimate[length_, diameter_, youngModulus_] :=
  youngModulus rodAreaEstimate[diameter]/length;

stemMassResonanceEstimate[length_, diameter_, youngModulus_, movableMass_] :=
  Sqrt[axialStemStiffnessEstimate[length, diameter, youngModulus]/movableMass]/(2 Pi);

radiatorResonanceEstimate[stiffness_, mass_] :=
  Sqrt[stiffness/mass]/(2 Pi);

coupledCristalResponseEstimate[rodHz_, stemHz_, radiatorHz_, couplingFactor_] :=
  Sqrt[(1 - couplingFactor) rodHz^2 + couplingFactor ((stemHz + radiatorHz)/2)^2];

CristalBaschetSummary[rodLength_, rodDiameter_, glassYoungModulus_, glassDensity_, stemLength_, stemDiameter_, stemYoungModulus_, movableMass_, radiatorMass_, radiatorStiffness_, couplingFactor_] :=
  Module[
    {rodHzEstimate, rodMassValueEstimate, stemHzEstimate, radiatorHzEstimate,
      coupledHzEstimate},
    rodHzEstimate = longitudinalRodFrequencyEstimate[
      rodLength, glassYoungModulus, glassDensity];
    rodMassValueEstimate = rodMassEstimate[
      rodLength, rodDiameter, glassDensity];
    stemHzEstimate = stemMassResonanceEstimate[
      stemLength, stemDiameter, stemYoungModulus, movableMass];
    radiatorHzEstimate = radiatorResonanceEstimate[
      radiatorStiffness, radiatorMass];
    coupledHzEstimate = coupledCristalResponseEstimate[
      rodHzEstimate, stemHzEstimate, radiatorHzEstimate, couplingFactor];
    <|
      "glassRodLongitudinalHzEstimate" -> rodHzEstimate,
      "glassRodMassKgEstimate" -> rodMassValueEstimate,
      "stemMassResonanceHzEstimate" -> stemHzEstimate,
      "radiatorResonanceHzEstimate" -> radiatorHzEstimate,
      "coupledResponseHzEstimate" -> coupledHzEstimate,
      "authority" -> "estimate only - pending measurement, not fabrication authority"
    |>
  ];

cristalBaschetModelManipulate =
  Manipulate[
    Module[
      {summary = CristalBaschetSummary[
          rodLength, rodDiameter, glassYoungModulus, glassDensity,
          stemLength, stemDiameter, stemYoungModulus, movableMass,
          radiatorMass, radiatorStiffness, couplingFactor]},
      Grid[
        {
          {"instrument", cristalBaschetMetadata["instrument"]},
          {"authority", summary["authority"]},
          {"glass rod longitudinal estimate (Hz)", NumberForm[summary["glassRodLongitudinalHzEstimate"], {8, 2}]},
          {"glass rod mass estimate (kg)", NumberForm[summary["glassRodMassKgEstimate"], {8, 4}]},
          {"stem and movable mass estimate (Hz)", NumberForm[summary["stemMassResonanceHzEstimate"], {8, 2}]},
          {"radiator resonance estimate (Hz)", NumberForm[summary["radiatorResonanceHzEstimate"], {8, 2}]},
          {"coupled response estimate (Hz)", NumberForm[summary["coupledResponseHzEstimate"], {8, 2}]}
        },
        Frame -> All,
        Alignment -> Left
      ]
    ],
    {{rodLength, glassRodLengthEstimate, "glass rod length estimate (m)"}, glassRodLengthMinEstimate, glassRodLengthMaxEstimate, glassRodLengthStepEstimate},
    {{rodDiameter, glassRodDiameterEstimate, "glass rod diameter estimate (m)"}, glassRodDiameterMinEstimate, glassRodDiameterMaxEstimate, glassRodDiameterStepEstimate},
    {{glassYoungModulus, glassYoungModulusEstimate, "glass Young's modulus estimate (Pa)"}, glassYoungModulusMinEstimate, glassYoungModulusMaxEstimate, glassYoungModulusStepEstimate},
    {{glassDensity, glassDensityEstimate, "glass density estimate (kg/m^3)"}, glassDensityMinEstimate, glassDensityMaxEstimate, glassDensityStepEstimate},
    {{stemLength, stemLengthEstimate, "stem length estimate (m)"}, stemLengthMinEstimate, stemLengthMaxEstimate, stemLengthStepEstimate},
    {{stemDiameter, stemDiameterEstimate, "stem diameter estimate (m)"}, stemDiameterMinEstimate, stemDiameterMaxEstimate, stemDiameterStepEstimate},
    {{stemYoungModulus, stemYoungModulusEstimate, "stem Young's modulus estimate (Pa)"}, stemYoungModulusMinEstimate, stemYoungModulusMaxEstimate, stemYoungModulusStepEstimate},
    {{movableMass, movableMassEstimate, "movable mass estimate (kg)"}, movableMassMinEstimate, movableMassMaxEstimate, movableMassStepEstimate},
    {{radiatorMass, radiatorEffectiveMassEstimate, "radiator effective mass estimate (kg)"}, radiatorEffectiveMassMinEstimate, radiatorEffectiveMassMaxEstimate, radiatorEffectiveMassStepEstimate},
    {{radiatorStiffness, radiatorStiffnessEstimate, "radiator stiffness estimate (N/m)"}, radiatorStiffnessMinEstimate, radiatorStiffnessMaxEstimate, radiatorStiffnessStepEstimate},
    {{couplingFactor, stemCouplingFactorEstimate, "stem-radiator coupling factor estimate"}, stemCouplingFactorMinEstimate, stemCouplingFactorMaxEstimate, stemCouplingFactorStepEstimate}
  ];

cristalBaschetModelManipulate
