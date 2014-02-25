(* ::Package:: *)

<<Toolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*Recon 2*)


(* ::Section:: *)
(*Build model*)


SetDirectory[NotebookDirectory[]];
stuff=Import["../data/Recon2/MODEL1109130000.xml","XML"];


SetDirectory[NotebookDirectory[]];
model=sbml2model["../data/Recon2/MODEL1109130000.xml",Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements];;
setNotes[model,defaultInitializationNotes[]];


SetDirectory[NotebookDirectory[]];
Export["../models/Recon2/Recon2.m.gz",model];


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
