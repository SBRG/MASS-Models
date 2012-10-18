(* ::Package:: *)

<<MASStoolbox`Style`
<<MASStoolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
SetDirectory[".."];
<<util`


(* ::Title:: *)
(*SB2*)
(*Systems Biology: Simulation of Dynamic Network States*)


(* ::Section:: *)
(*Glycolysis*)


(* ::Subsection:: *)
(*Construct model*)


chemicalFormulas={m["glu", "c"]->"C6H12O6",m["g6p", "c"]->"H11C6O9P",m["f6p", "c"]->"H11C6O9P",m["fdp", "c"]->"H10C6O12P2",m["dhap", "c"]->"H5C3O6P",m["gap", "c"]->"H5C3O6P",m["pg13", "c"]->"H4C3O10P2",m["pg3", "c"]->"H4C3O7P",m["pg2", "c"]->"H4C3O7P",m["pep", "c"]->"H2C3O6P",m["pyr", "c"]->"H3C3O3",m["lac", "c"]->"H5C3O3",m["nad", "c"]->"&NAD&",m["nadh", "c"]->"H&NAD&",m["amp", "c"]->"H13C10N5O7P",m["adp", "c"]->"H13C10N5O10P2",m["atp", "c"]->"H13C10N5O13P3",m["phos", "c"]->"HO4P",m["h", "c"]->"H",m["h2o", "c"]->"H2O"};
rxns=str2mass/@{"vhk: atp_c + glu_c <=> adp_c + g6p_c + h_c","vpgi: g6p_c <=> f6p_c","vpfk: atp_c + f6p_c <=> adp_c + fdp_c + h_c","vtpi: dhap_c <=> gap_c","vald: fdp_c <=> dhap_c + gap_c","vgapdh: gap_c + nad_c + phos_c <=> h_c + nadh_c + pg13_c","vpgk: adp_c + pg13_c <=> atp_c + pg3_c","vpglm: pg3_c <=> pg2_c","veno: pg2_c <=> h2o_c + pep_c","vpk: adp_c + h_c + pep_c <=> atp_c + pyr_c","vldh: h_c + nadh_c + pyr_c <=> lac_c + nad_c","vamp: amp_c <=> 0","vapk: 2 adp_c <=> amp_c + atp_c","vpyr: pyr_c <=> 0","vlac: lac_c <=> 0","vatp: atp_c + h2o_c <=> adp_c + h_c + phos_c","vnadh: nadh_c <=> h_c + nad_c","vgluin: 0 <=> glu_c","vampin: 0 <=> amp_c","vh: h_c <=> 0","vh2o: h2o_c <=> 0"};
equilibriumConstants={Keq["vhk"]->850,Keq["vpgi"]->0.41,Keq["vpfk"]->310,Keq["vtpi"]->0.05714285714285714,Keq["vald"]->0.082,Keq["vgapdh"]->0.0179,Keq["vpgk"]->1800,Keq["vpglm"]->0.14705882352941177,Keq["veno"]->1.6949152542372883,Keq["vpk"]->363000,Keq["vldh"]->26300,Keq["vamp"]->Infinity,Keq["vapk"]->1.65,Keq["vpyr"]->1.,Keq["vlac"]->1.,Keq["vatp"]->Infinity,Keq["vnadh"]->Infinity,Keq["vgluin"]->Infinity,Keq["vampin"]->Infinity,Keq["vh"]->1.,Keq["vh2o"]->1.};
externalFixedConc=#[[1]]->#[[2]]Millimole Liter^-1&/@{m["pyr","Xt"]->.06,m["amp","Xt"]->1,m["h","Xt"]->10.^(-4.2),m[_,"Xt"]->1};
steadyStateConcentrations=#[[1]]->#[[2]]Millimole Liter^-1&/@{m["glu", "c"] -> 1., m["g6p", "c"] -> 0.0486, m["f6p", "c"] -> 0.0198, m["fdp", "c"] -> 0.0146, m["dhap", "c"] -> 0.16, 
 m["gap", "c"] -> 0.00728, m["pg13", "c"] -> 0.000243, m["pg3", "c"] -> 0.0773, m["pg2", "c"] -> 0.0113, m["pep", "c"] -> 0.017, 
 m["pyr", "c"] -> 0.060301, m["lac", "c"] -> 1.36, m["nad", "c"] -> 0.0589, m["nadh", "c"] -> 0.0301, m["amp", "c"] -> 0.08672812499999999, 
 m["adp", "c"] -> 0.29, m["atp", "c"] -> 1.6, m["phos", "c"] -> 2.5, m["h", "c"] -> 0.00008997573444801929, m["h2o", "c"] -> 1.};
glycolysis=constructModel[rxns,
"ElementalComposition"->chemicalFormulas,
"Ignore"->{m["h","c"],m["h2o","c"]},
"CustomRateLaws"->{"vh"->MASStoolbox`MASS`rateconst["vh", True](m["h","c"][t]-m["h", "Xt"] /MASStoolbox`MASS`Keq["vh"]),"vh2o"->MASStoolbox`MASS`rateconst["vh2o", True](m["h2o","c"][t]-m["h2o", "Xt"] /MASStoolbox`MASS`Keq["vh2o"])},
"InitialConditions"->steadyStateConcentrations,
"Parameters"->Join[equilibriumConstants,externalFixedConc],
"Notes"->defaultInitializationNotes[]
];

null=({
 {1, 0, 1},
 {1, 0, 0},
 {0, 1, 0}
}).NullSpace[glycolysis];
gluin=1.12;
ststloadnadh=0.2*gluin;
ampin=.014;
givenststfluxes=({
 {gluin, ststloadnadh, ampin}
});
solution=Flatten[Transpose[givenststfluxes.null]];
steadyStateFluxes=#[[1]]->#[[2]]Millimole Liter^-1 Hour^-1&/@Thread[Rule[glycolysis["Fluxes"],solution]];

updateInitialConditions[glycolysis,steadyStateFluxes];

perc=calcPERC[DropUnits@glycolysis]/.Undefined->100000;
(*perc=updateRules[perc,{Subsuperscript[k, vapk, \[LongRightArrow]]->1,Subsuperscript[k, vh2o, \[LongRightArrow]]->100000}]*)
updateParameters[glycolysis,perc];

SetDirectory[NotebookDirectory[]];
Export["../../models/SB2/glycolysis.m.gz",glycolysis]


{concSol,fluxSol}=simulate[glycolysis,{t,0,10}];


DropUnits[fluxSol]


perc=calcPERC[DropUnits@glycolysis]/.Undefined->100000;


perc2=adjustUnits[perc,glycolysis]


glycolysis["Rates"]/.elem_[t]:>elem/.glycolysis["Parameters"]/.glycolysis["InitialConditions"]/.perc2


(* ::Subsection:: *)
(*Analyze model*)


{concSol,fluxSol}=simulate[glycolysis,{t,0,1000}];
plotSimulation[concSol,{t,0,1000}]


{concSol,fluxSol}=simulate[glycolysis,{t,0,1000},Parameters->{MASStoolbox`MASS`rateconst["vatp", True]->2}];
plotSimulation[concSol,{t,0,1000}]


TableForm[stripUnits@glycolysis["InitialConditions"]]


TableForm[stripUnits@glycolysis["Parameters"]]


plotPhasePortrait[stripUnits@concSol/.m_metabolite:>ToString[m]]
