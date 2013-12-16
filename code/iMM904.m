(* ::Package:: *)

<<Toolbox`
<<Toolbox`Style`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*iMM904*)


(* ::Section:: *)
(*Build model*)


(* ::Subsection:: *)
(*Get GPRs from simpheny dump*)


SetDirectory[NotebookDirectory[]];
gprData=Import["../data/iMM904/iMM904_gpr.txt","CSV"];
gpr=simphenyGPRr2gpr[gprData[[2;;]]];


SlideView[visualizeGPR/@gpr2graphs[gpr][[1;;100]],AppearanceElements->All]


(* ::Subsection:: *)
(*Synonyms*)


(* ::Subsection:: *)
(*Get reactions, constraints etc. from simpheny dump*)


SetDirectory[NotebookDirectory[]];
stoich=DeleteCases[Import["../data/iMM904/iMM904.sto","Table"],l_List/;l=={}||Quiet@StringMatchQ[l[[1]],RegularExpression["\\*.*"]]];
mets=m[Sequence@@StringCases[#[[1]],RegularExpression["(.*)\\((.*)\\)"]:>{"$1","$2"}][[1]]]->#[[2]]&/@DeleteCases[Import["../data/iMM904/iMM904.met","Table"],l_List/;l=={}||Quiet@StringMatchQ[l[[1]],RegularExpression["\\*.*"]]][[2;;,{2,3}]];
{rxnIDs,rxnNames,revTags,lowerBounds,upperBounds,fluxes}=Transpose[Import["../data/iMM904/iMM904.rxn","TSV"][[19;;]][[All,{2,3,4,5,6,8}]]];
irreversibleColumns=Flatten[Position[revTags,"Irreversible"]];
irreversibleRxnIDs=rxnIDs[[irreversibleColumns]];
referenceBounds=Thread[(v/@rxnIDs)->Thread[{lowerBounds,upperBounds}]];
referenceFluxes=Thread[(v/@rxnIDs)->fluxes];


(* ::Subsection:: *)
(*Construct model*)


iMM904=constructModel[stoich,mets[[All,1]],rxnIDs,"Irreversible"->irreversibleRxnIDs,"GPR"->gpr];
updateConstraints[iMM904, referenceBounds];
setObjective[iMM904,Toolbox`v["biomass_SC5_notrace"]]
updateSynonyms[iMM904,mets]
updateSynonyms[iMM904,Thread[rxnIDs->rxnNames]]
setNotes[iMM904,defaultInitializationNotes[]];


(* ::Subsection:: *)
(*Export model*)


SetDirectory[NotebookDirectory[]];
Export["../models/iMM904/iMM904.m.gz",iMM904]


(* ::Subsection:: *)
(*Do FBA and compare fluxes to reference solution*)


fbaSolution=fba[iMM904,Solver->GurobiSolve];


(* ::Text:: *)
(*Fluxe comparison looks ok ... objective values are identical.*)


Toolbox`v["biomass_SC5_notrace"]/.{fbaSolution,referenceFluxes}
scatter=scatterFromDicts[referenceFluxes,fbaSolution];
ListPlot[Thread[Tooltip[#[[All,2]],#[[All,1]]]],PlotRange->Automatic]&[scatter]


Select[FilterRules[iMM904["Constraints"],v[getID[#]]&/@iMM904["Exchanges"]],#[[2]]!={0,999999}&]


"22199\t222668\tAmino Acid Metabolism
35089\t222668\tCofactor and Vitamin Biosynthesis
38537\t222668\tLipid Metabolism
20179\t222668\tNucleotide Metabolism
666364\t222668\tCOMBINED"
