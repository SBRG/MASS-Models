(* ::Package:: *)

<<MASStoolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
SetDirectory[".."];
<<util`


(* ::Title:: *)
(*SB2*)
(*Systems Biology: Simulation of Dynamic Network States*)


(* ::Section:: *)
(*PPP*)


(* ::Subsection:: *)
(*Construct model*)


SetDirectory[NotebookDirectory[]];
glycolysis=Import["../../models/SB2/glycolysis.m.gz"];


chemicalFormulas={m["g6p","c"]->"H11C6O9P",m["f6p","c"]->"H11C6O9P",m["gap","c"]->"H5C3O6P",m["fbp","c"]->"H10C6O12P2",m["gl6p","c"]->"H9C6O9P",m["go6p","c"]->"H10C6O10P",m["ru5p","c"]->"H9C5O8P",m["x5p","c"]->"H9C5O8P",m["r5p","c"]->"H9C5O8P",m["s7p","c"]->"H13C7O10P",m["e4p","c"]->"H7C4O7P",m["nadp","c"]->"&NADP&",m["nadph","c"]->"H&NADP&",m["gsh","c"]->"H17C10N3O6S",m["gssg","c"]->"H32C20N6O12S2",m["co2","c"]->"CO2",m["h2o","c"]->"H2O",m["h","c"]->"H"};
rxns=str2mass/@{"vg6pdh: g6p_c + nadp_c <=> gl6p_c + h_c + nadph_c","vpglase: gl6p_c + h2o_c <=> go6p_c + h_c","vgl6pdh: go6p_c + nadp_c <=> co2_c + nadph_c + ru5p_c",
"vr5pe: ru5p_c <=> x5p_c","vr5pi: ru5p_c <=> r5p_c","vtki: r5p_c + x5p_c <=> gap_c + s7p_c","vtkii: e4p_c + x5p_c <=> f6p_c + gap_c","vtala: gap_c + s7p_c <=> e4p_c + f6p_c",
"vgssgr: gssg_c + h_c + nadph_c <=> 2 gsh_c + nadp_c","vgshr: 2 gsh_c <=> gssg_c + 2 h_c","vco2: co2_c <=> 0","EX_g6p_c: g6p_c <=> 0","EX_f6p_c: f6p_c <=> 0","EX_r5p_c: r5p_c <=> 0","EX_h_c: h_c <=> 0","EX_h2o_c: h2o_c <=> 0","EX_gap_c: gap_c <=> 0"};
ststConcentrations=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["g6p", "c"]->0.0486`,MASStoolbox`MASS`metabolite["f6p", "c"]->0.0198`,MASStoolbox`MASS`metabolite["gap", "c"]->0.00728`,MASStoolbox`MASS`metabolite["gl6p", "c"]->0.001754242723`,MASStoolbox`MASS`metabolite["go6p", "c"]->0.037475258`,MASStoolbox`MASS`metabolite["ru5p", "c"]->0.0049367903`,MASStoolbox`MASS`metabolite["x5p", "c"]->0.014784196`,MASStoolbox`MASS`metabolite["r5p", "c"]->0.00494`,MASStoolbox`MASS`metabolite["s7p", "c"]->0.023987984`,MASStoolbox`MASS`metabolite["e4p", "c"]->0.0050750696`,MASStoolbox`MASS`metabolite["nadp", "c"]->0.0002`,MASStoolbox`MASS`metabolite["nadph", "c"]->0.0658`,MASStoolbox`MASS`metabolite["gsh", "c"]->3.2`,MASStoolbox`MASS`metabolite["gssg", "c"]->0.11999999999999966`,MASStoolbox`MASS`metabolite["h", "c"]->0.00009929240111468596`,MASStoolbox`MASS`metabolite["h2o", "c"]->0.99999683`,MASStoolbox`MASS`metabolite["co2", "c"]->1.0000021`};
eqConstants={MASStoolbox`MASS`Keq["EX_r5p_c"]->\[Infinity](*originally 1*),MASStoolbox`MASS`Keq["EX_h_c"]->1/1000000,MASStoolbox`MASS`Keq["EX_h2o_c"]->1,MASStoolbox`MASS`Keq["EX_g6p_c"]->1,MASStoolbox`MASS`Keq["EX_gap_c"]->\[Infinity](*originally 1*),MASStoolbox`MASS`Keq["EX_f6p_c"]->\[Infinity](*originally 1*),MASStoolbox`MASS`Keq["vg6pdh"]->1000,MASStoolbox`MASS`Keq["vpglase"]->1000,MASStoolbox`MASS`Keq["vgl6pdh"]->Mole/Liter,MASStoolbox`MASS`Keq["vr5pe"]->3,MASStoolbox`MASS`Keq["vr5pi"]->2.57`,MASStoolbox`MASS`Keq["vtki"]->3,MASStoolbox`MASS`Keq["vtkii"]->10.3`,MASStoolbox`MASS`Keq["vtala"]->1.05`,MASStoolbox`MASS`Keq["vgssgr"]->Mole/(10 Liter),MASStoolbox`MASS`Keq["vgshr"]->(2000 Liter)/Mole,MASStoolbox`MASS`Keq["vco2"]->1};
(*eqConstantsBook={Underscript[K, vg6pdh]->1000,Underscript[K, vpglase]->1000,Underscript[K, vgl6pdh]->1000,Underscript[K, vr5pe]->3,Underscript[K, vr5pi]->2.57,Underscript[K, vtki]->1.2,Underscript[K, vtkii]->10.3,Underscript[K, vtala]->1.05,Underscript[K, vgssgr]->100,Underscript[K, vgshr]->2,Underscript[K, vco2]->1};*)
externalConcentrations={metabolite["h","Xt"]->10.^(-4.2)Milli Mole Liter^-1,metabolite[_,"Xt"]->1 Milli Mole Liter^-1};
Clear[ppp]
ppp=constructModel[
rxns,
ElementalComposition->chemicalFormulas,
Parameters->Join[eqConstants,externalConcentrations],
Ignore->{m["h","c"],m["h2o","c"]},
BoundaryConditions->{m["h","c"],m["h2o","c"]},
InitialConditions->Join[ststConcentrations],
Notes->defaultInitializationNotes[]
];
updateConstraints[ppp,{MASStoolbox`MASS`v["EX_g6p_c"]->{-0.21`,\[Infinity]},MASStoolbox`MASS`v["EX_f6p_c"]->{-\[Infinity],\[Infinity]},MASStoolbox`MASS`v["EX_r5p_c"]->{0.01`,0.01`},MASStoolbox`MASS`v["EX_h_c"]->{0,\[Infinity]},MASStoolbox`MASS`v["EX_h2o_c"]->{-\[Infinity],\[Infinity]},MASStoolbox`MASS`v["EX_gap_c"]->{0,\[Infinity]}}]
ssFluxes=#[[1]]->#[[2]]Milli Mole Liter^-1 Hour^-1&/@fba[ppp,"vg6pdh",{MASStoolbox`MASS`v["EX_g6p_c"]->{-0.21,\[Infinity]},MASStoolbox`MASS`v["EX_f6p_c"]->{-\[Infinity],\[Infinity]},MASStoolbox`MASS`v["EX_r5p_c"]->{0.01,0.01},MASStoolbox`MASS`v["EX_h_c"]->{0,\[Infinity]},MASStoolbox`MASS`v["EX_h2o_c"]->{-\[Infinity],\[Infinity]},MASStoolbox`MASS`v["EX_gap_c"]->{0,\[Infinity]}}];
updateInitialConditions[ppp,ssFluxes];
updateNotes[ppp,defaultInitializationNotes[]];
updateParameters[ppp,calcPERC[ppp]];
SetDirectory[NotebookDirectory[]];
Export["../../models/SB2/ppp.m.gz",ppp]


fba[ppp,"vg6pdh",{MASStoolbox`MASS`v["EX_g6p_c"]->{-0.21,\[Infinity]},MASStoolbox`MASS`v["EX_f6p_c"]->{-\[Infinity],\[Infinity]},MASStoolbox`MASS`v["EX_r5p_c"]->{0.01,0.01},MASStoolbox`MASS`v["EX_h_c"]->{0,\[Infinity]},MASStoolbox`MASS`v["EX_h2o_c"]->{-\[Infinity],\[Infinity]},MASStoolbox`MASS`v["EX_gap_c"]->{0,\[Infinity]}}]


fva[ppp]


(* ::Subsection:: *)
(*Analyze model*)


findSteadyState[ppp,Parameters->calcPERC[ppp]]


fluxSol/.t->100


ppp["Rates"]


{concSol,fluxSol}=simulate[ppp,{t,0,1000},Parameters->calcPERC[ppp]];
plotSimulation[concSol,{t,0,1000}]


rateconst["vgshr",True]/.ppp["Parameters"]


{concSol,fluxSol}=simulate[ppp,{t,0,1000},Parameters->{rateconst["vgshr",True]->(46 Liter)/(Hour Mole)}];
plotSimulation[concSol,{t,0,1000}]


ppp[[1,All,1]]


{concSol,fluxSol}=simulate[ppp,{t,0,1000},Parameters->{rateconst["vgshr",True]->0.046}];
plotSimulation[concSol,{t,0,1000}]



