(* ::Package:: *)

<<MASStoolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*E. coli Core*)


(* ::Section::Closed:: *)
(*GPRs*)


(* ::Subsection:: *)
(*Read GPRs from Simpheny*)


SetDirectory[NotebookDirectory[]];
gprData=Import["../data/EcoliCore/Ecoli_core_GPRs.csv.gz"];
gpr=simphenyGPRr2gpr[gprData[[2;;]]];
gprGraphs=gpr2graphs[gpr];


SlideView[LayeredGraphPlot[#,VertexRenderingFunction->({Inset[If[Head[#2]===String,Style[Framed[#2],Background->LightPurple,FontColor->Black],StandardForm@#2],#1]}&),DirectedEdges->False,PlotStyle->{Black},ImageSize->{{800}*2,{200*1.5}}]&/@gprGraphs,AppearanceElements->All]


SlideView[LayeredGraphPlot[#,VertexRenderingFunction->({Inset[If[Head[#2]===String,Style[Framed[#2],Background->LightPurple,FontColor->Black],StandardForm@#2],#1]}&),DirectedEdges->False,PlotStyle->{Black},ImageSize->{{800}*2,{200*1.5}}]&/@gprGraphs[[{20,41,39,12,57,19,42,44}]],AppearanceElements->All]


(* ::Subsection:: *)
(*Read GPR from SBML*)


SetDirectory[NotebookDirectory[]];
stuff=Import["../data/EcoliCore/EcoliCore.xml.gz","XML"];
listOfReactions=Cases[stuff,XMLElement["listOfReactions",___],\[Infinity]][[1]][[3]];


gr=DeleteCases[("id"/.Dispatch[#[[2]]])->(xmlReaction2geneAssociation@#)&/@listOfReactions,r_Rule/;r[[2]]==Null]/.(#->gene[ToString[#]]&/@Cases[tmp,_Symbol,\[Infinity]]);


(* ::Section:: *)
(*SBML2MODEL*)


(* ::Subsection:: *)
(*Read GPRs*)


SetDirectory[NotebookDirectory[]];
gprData=Import["../data/EcoliCore/Ecoli_core_GPRs.csv.gz"];
gpr=simphenyGPRr2gpr[gprData[[2;;]]];


(* ::Subsection::Closed:: *)
(*Read boolean regulatory model*)


SetDirectory[NotebookDirectory[]];
booleanRulesTable=Import["../data/EcoliCore/core_regulatory_rules.xls.gz"][[1]];
separators={"metabolic genes","regulatory genes and rules","metabolite inputs","reaction inputs"};
sepRows=(Position[booleanRulesTable,#][[1]]&/@separators)[[All,1]];
booleanRules=booleanRulesTable[[sepRows[[1]];;sepRows[[2]]-1]][[All,1;;3]];
booleanRules2=booleanRulesTable[[sepRows[[2]];;sepRows[[3]]-1]][[All,1;;3]];
metInputs=booleanRulesTable[[sepRows[[3]];;sepRows[[4]]-1]][[All,2]];
rxnInputs=booleanRulesTable[[sepRows[[4]];;-3]][[All,2]];


parseStrLogic[str_String]:=Module[{str2},
(*Parse metabolites*)
str2=StringReplace[str,RegularExpression["([\\w-]+)\\[([\\w-]+)\\]"]:>"metabolite[\"$1\",\"$2\"]"];
ToExpression[StringReplace[str2,{"_"->"UNDERSCORE","NOT"->"!","OR"->"||","AND"->"&&"}]]
]


parseStrLogic[str_String]:=Module[{str2},
(*Parse metabolites*)
str2=StringReplace[str,RegularExpression["([\\w-]+)\\[([\\w-]+)\\]"]:>"metabolite[\"$1\",\"$2\"]"];
ToExpression[StringReplace[str2,{"_"->"UNDERSCORE","NOT"->"!","OR"->"||","AND"->"&&"}]]
]


symbol2rxn=ToExpression@StringReplace[#,"_"->"UNDERSCORE"]->#&/@rxnInputs;


symbol2rxn


symbol2prot=Cases[booleanRules2,l_List/;l[[1]]!="":>Symbol[l[[2]]]->protein[l[[2]]]];


symbol2prot


TableForm[ruleSet1=Replace[(gene[#[[1]]]->parseStrLogic[#[[3]]]&/@booleanRules)/.symbol2prot/.symbol2rxn,s_Symbol:>parameter[StringReplace[ToString[s],"UNDERSCORE"->"_"]],\[Infinity],Heads->False]]


TableForm[ruleSet3=Replace[Cases[booleanRules2,l_List/;l[[1]]=="":>parameter[l[[2]]]->parseStrLogic[l[[3]]]]/.symbol2rxn/.symbol2prot,s_Symbol:>parameter[StringReplace[ToString[s],"UNDERSCORE"->"_"]],\[Infinity],Heads->False]]


TableForm[ruleSet2=Replace[Cases[booleanRules2,l_List/;l[[1]]!="":>protein[l[[2]]]->parseStrLogic[l[[3]]]]/.symbol2rxn/.symbol2prot,s_Symbol:>parameter[StringReplace[ToString[s],"UNDERSCORE"->"_"]],\[Infinity],Heads->False]]


(* ::Subsection:: *)
(*Import model from SBML and translate to MASSmodel*)


SetDirectory[NotebookDirectory[]];
ecolicore=sbml2model["../data/EcoliCore/EcoliCore.xml.gz",Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements];
revExchanges=r[getID@#,getProducts@#,getSubstrates@#,Reverse[getStoich@#],reversibleQ@#]&/@ecolicore["Exchanges"];
ecolicore=deleteReactions[ecolicore,getID/@ecolicore["Exchanges"]];
ecolicore=addReactions[ecolicore,revExchanges];
additionalRxns=reactionFromString/@{"GLYK: M_atp_c + M_glyc_c --> M_adp_c + M_glyc3p_c + M_h_c","G3PD2: M_glyc3p_c + M_nadp_c <=> M_dhap_c + M_h_c + M_nadph_c","EX_glyc(e): 0 <=> M_glyc_c"};
ecolicore=addReactions[ecolicore,additionalRxns];
setModelAttribute[ecolicore,"GPR",gpr];
setModelAttribute[ecolicore,"InitialConditions",{}];
setModelAttribute[ecolicore,"Notes",defaultInitializationNotes[]];


(* ::Subsection:: *)
(*Estimate Keq using GCM estimates from equilibrator*)


SetDirectory[NotebookDirectory[]];
bigg2equilibrator=Import["../Data/bigg2equilibratorViaKEGG.m.gz"];


dGofRxn=calcDeltaG[ecolicore["Reactions"],bigg2equilibrator,is->.25 Mole Liter^-1,pH->7.6]


keq=dG2keq[dGofRxn];


keq//Short


updateModelAttribute[ecolicore,"Parameters",keq]


SetDirectory[NotebookDirectory[]];
Export["../models/EcoliCore/EcoliCore.m.gz",ecolicore]
