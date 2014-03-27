(* ::Package:: *)

<<Toolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*iJO1366*)


(* ::Section:: *)
(*Build model*)


SetDirectory[NotebookDirectory[]];
gprData=Import["../data/iJO1366/Ecoli_iJO1366_GPRs.csv.gz"];
gpr=simphenyGPRr2gpr[gprData[[2;;]]];


SetDirectory[NotebookDirectory[]];
referenceFluxesPlusBounds=getReferenceFluxesAndBoundsFromXML["../data/iJO1366/msb201165-s3.xml.gz"]/.s_String:>StringReplace[s,{RegularExpression["^M_"]->"",RegularExpression["^R_"]->""}];
referenceBounds=#[[1]]->#[[2,1;;2]]&/@referenceFluxesPlusBounds;
referenceFluxes=#[[1]]->#[[2,-1]]&/@referenceFluxesPlusBounds;


SetDirectory[NotebookDirectory[]];
ecogeneMapping=Import["../data/ecogene_mapping_ecodownload_xref_1379576319.csv.gz"];


rawXML=Import["../data/iJO1366/msb201165-s3.xml.gz","XML"];
elementalComposition=str2mass[("id"/.#[[2]])]->formula2elementalComposition[StringReplace[Cases[#,XMLElement["p",__],\[Infinity]][[1,3,1]],"FORMULA: "->""]]&/@Cases[rawXML,XMLElement["species",__],\[Infinity]];


SetDirectory[NotebookDirectory[]];
model=sbml2model["../data/iJO1366/msb201165-s3.xml.gz",Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements];
setGPR[model,gpr];
updateConstraints[model,referenceBounds//.s_String:>StringReplace[s,biggCommonStringReplacements]];
setObjective[model,Toolbox`v["Ec_biomass_iJO1366_WT_53p95M"]];
setElementalComposition[model,elementalComposition];
setNotes[model,defaultInitializationNotes[]];


SetDirectory[NotebookDirectory[]];
Export["../models/iJO1366/iJO1366.m.gz",model]


(* ::Section:: *)
(*Analyze model*)


SetDirectory[NotebookDirectory[]];
iJO1366=Import["../models/iJO1366/iJO1366.m.gz"];


fluxes=fba[iJO1366,Solver->GurobiSolve];


iJO1366["Objective"]/.fluxes


<<Toolbox`


exclude=model["Exchanges"];
balancing=Thread[Rule[model["Reactions"],Expand/@((model["Species"]/.model["ElementalComposition"]).model)]];
balancing=DeleteCases[balancing,r_Rule/;MemberQ[exclude,r[[1]]]];


balancing[[1;;4]]


balancing[[1;;4]][[All,2]]


elementallyBalancedQ[iJO1366]


iJO1366["ElementalComposition"]


fvaResult=GurobiFVA[iJO1366];


fvaResult//Length


fvaResult[[1]]


SlideView[fvaResult,AppearanceElements->All]
