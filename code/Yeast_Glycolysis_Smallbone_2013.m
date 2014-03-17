(* ::Package:: *)

<<Toolbox`
<<Toolbox`Style`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*A model of yeast glycolysis based on a consistent kinetic characterisation of all its enzymes. *)


(* ::Subtitle:: *)
(*Smallbone K, Messiha HL, Carroll KM, Winder CL, Malys N, Dunn WB, Murabito E, Swainston N, Dada JO, Khan F, Pir P, Simeonidis E, Spasi? I, Wishart J, Weichart D, Hayes NW, Jameson D, Broomhead DS, Oliver SG, Gaskell SJ, McCarthy JE, Paton NW, Westerhoff HV, Kell DB, Mendes P. *)
(**)
(*FEBS Lett. 2013 Sep; 587(17): 2832-2841 *)


(* ::Section:: *)
(*Build model*)


(* ::Subsection:: *)
(*Construct model*)


model["Rates"][[1]]


Import["../data/Yeast_Glycolysis_Smallbone_2013/MODEL1303260018.xml","XML"]


SetDirectory[NotebookDirectory[]];
model=sbml2model["../data/Yeast_Glycolysis_Smallbone_2013/MODEL1303260018.xml"];


(* ::Subsection:: *)
(*Export model*)


SetDirectory[NotebookDirectory[]];
Export["../models//Yeast_Glycolysis_Smallbone_2013/Yeast_Glycolysis_Smallbone_2013.m.gz",model]


(* ::Subsection:: *)
(*Simulate model*)


SortBy[FilterRules[model["Parameters"],$MASS$speciesPattern],Last]


Histogram[stripUnits[FilterRules[model["Parameters"],$MASS$speciesPattern][[All,2]]]]


model["Reactions"]


model["Species"]


visualizePathways[model,PlotFunction->GraphPlot,ImageSize->1200]


model["Reactions"]


{concSol,fluxSol}=simulate[model,{t,0,1000}];


plotSimulation[concSol,PlotFunction->Plot]/.model["Synonyms"]


plotSimulation[filter[fluxSol,{v["HXK_GLK1"]}]]/.model["Synonyms"]


plotSimulation[filter[fluxSol,{v["HXK_GLK1"],v["HXK_HXK1"],v["HXK_HXK2"]}],Legend->True]/.model["Synonyms"]
