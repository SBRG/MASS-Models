(* ::Package:: *)

<<MASStoolbox`
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
model=sbml2model["../data/iJO1366/msb201165-s3.xml.gz",Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements]
setModelAttribute[model,"GPR",gpr];
updateModelAttribute[model,"Constraints",referenceBounds//.s_String:>StringReplace[s,biggCommonStringReplacements]];
setModelAttribute[model,"Notes",defaultInitializationNotes[]];


model["Notes"]


SetDirectory[NotebookDirectory[]];
Export["../models/iJO1366/iJO1366.m.gz",model]


(* ::Section:: *)
(*Analyze model*)


SetDirectory[NotebookDirectory[]];
iJO1366=Import["../models/iJO1366/iJO1366.m.gz"];


iJO1366["Constraints"]


biomassRxn=Cases[iJO1366["Fluxes"],s_String/;StringMatchQ[s,RegularExpression[".*bio.*"]],\[Infinity]][[1]]


fluxes=fba[iJO1366,biomassRxn,Solver->GurobiSolve];


biomassRxn/.fluxes


fvaResult=GurobiFVA[iJO1366];


fvaResult//Length


fvaResult[[1]]


SlideView[fvaResult,AppearanceElements->All]
