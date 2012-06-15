(* ::Package:: *)

<<MASStoolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*Platelet*)


(* ::Section:: *)
(*SBML2MODEL*)


(* ::Subsection:: *)
(*Import model from SBML and translate to MASSmodel*)


SetDirectory[NotebookDirectory[]];
platelet=sbml2model["../data/Platelet/platelet.xml.gz",BIGG->True,Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements];
setModelAttribute[platelet,"Notes",defaultInitializationNotes[]];


platelet["Fluxes"]//Length
platelet["Fluxes"]//Union//Length


SetDirectory[NotebookDirectory[]];
Export["../models/Platelet/platelet.m.gz",platelet]
