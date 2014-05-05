(* ::Package:: *)

<<Toolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*iJO1366*)


(* ::Section:: *)
(*Build model*)


simphenyGPRr2gpr[table_]:=Module[{protHelperFunc,convertLogic,parseProteinAssociation,proteinAssociations,proteinGeneAssociations},
	protHelperFunc=#/.If[StringQ[#]&&#=!=Null,#->protein[#],(#->protein[#]&/@Union[Cases[#,_String,\[Infinity]]])]&;
	convertLogic=StringReplace[#,{"and"->"&&","or"->"||",RegularExpression["([^\\(\\)\\s]+)"]->"\""<>"$1"<>"\""}]&;
	parseProteinAssociation=#[[1]]->protHelperFunc[ToExpression@convertLogic[#[[-1]]]]/.a_And:>proteinComplex@@Union[a]/.o_Or:>Union[o]&;
	proteinAssociations=(parseProteinAssociation/@table)/.Null->None;
	proteinGeneAssociations=StringCases[#[[6]],RegularExpression["(\\S+)\\s+\\(([\\&\\s\\w]+)\\)"]:>protein["$1"]->(If[Length[#]>1,geneComplex[Sequence@@(gene[ToString[#]]&/@#)],gene@ToString[#]]&[(ToExpression[convertLogic@"$2"])])]&/@table;
	(*proteinGeneAssociations=Union[Flatten[(ToExpression[convertLogic[#[[-3]]]]/.times_Times:>protein[times[[1]]]->gene[times[[2]]]/.stuff:gene[_And]:>geneComplex[Sequence@@(gene/@Union[List@@stuff[[1]]])]&/@table)/.{And->List,Or->List}]]/.Null->Sequence[];*)
	Union[Flatten[{DeleteCases[proteinAssociations,r_Rule/;r[[2]]===None,\[Infinity]],Union@Flatten[proteinGeneAssociations]}]]
];
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
elementalComposition=(str2mass[("id"/.#[[2]])]->formula2elementalComposition[StringReplace[Cases[#,XMLElement["p",__],\[Infinity]][[1,3,1]],"FORMULA: "->""]]&/@Cases[rawXML,XMLElement["species",__],\[Infinity]])//.s_String:>StringReplace[s,biggCommonStringReplacements];


SetDirectory[NotebookDirectory[]];
rxnID2name=Rule@@@Import["../data/BIGG_reaction_list.txt","TSV"][[2;;,{1,2}]];
tmp=Rule@@@Import["../data/BIGG_metabolite_list.txt","TSV"][[2;;,{1,2}]];
tmp=FilterRules[tmp,Union[getID/@iJO["Species"]]];
metaboliteID2name=#->(getID[#]/.Dispatch[tmp])&/@iJO["Species"];


SetDirectory[NotebookDirectory[]];
model=sbml2model["../data/iJO1366/msb201165-s3.xml.gz",Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements];
setGPR[model,gpr];
updateConstraints[model,referenceBounds//.s_String:>StringReplace[s,biggCommonStringReplacements]];
setObjective[model,Toolbox`v["Ec_biomass_iJO1366_WT_53p95M"]];
setElementalComposition[model,elementalComposition];
setSynonyms[model,Join[FilterRules[rxnID2name,getID/@iJO["Fluxes"]],metaboliteID2name]]
setNotes[model,defaultInitializationNotes[]];


SetDirectory[NotebookDirectory[]];
Export["../models/iJO1366/iJO1366.m.gz",model]


SlideView[Cases[elementalComposition,r_Rule/;MemberQ[r,s_String/;StringMatchQ[s,RegularExpression[".*&.*"]]]],AppearanceElements->All]


(* ::Section:: *)
(*Analyze model*)


SetDirectory[NotebookDirectory[]];
iJO1366=Import["../models/iJO1366/iJO1366.m.gz"];


fluxes=fba[iJO1366,Solver->GurobiSolve];


iJO1366["Objective"]/.fluxes


Length@getSpecies[Select[iJO1366["Reactions"],getID[#]=="Ec_biomass_iJO1366_WT_53p95M"&][[1]]]


elementallyBalancedQ[iJO1366]


iJO1366["ElementalComposition"]


fvaResult=GurobiFVA[iJO1366];


fvaResult//Length


fvaResult[[1]]


SlideView[fvaResult,AppearanceElements->All]
