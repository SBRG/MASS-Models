(* ::Package:: *)

<<MASStoolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*E. coli Core*)


(* ::Section:: *)
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


SetDirectory[NotebookDirectory[]];
gprData=Import["../data/EcoliCore/Ecoli_core_GPRs.csv.gz"];
gpr=simphenyGPRr2gpr[gprData[[2;;]]];


SetDirectory[NotebookDirectory[]];
ecolicore=sbml2model["../data/EcoliCore/EcoliCore.xml.gz",BIGG->True];
additionalRxns=reactionFromString/@{"GLYK: M_atp_c + M_glyc_c --> M_adp_c + M_glyc3p_c + M_h_c","G3PD2: M_glyc3p_c + M_nadp_c <=> M_dhap_c + M_h_c + M_nadph_c","EX_glyc(e): 0 <=> M_glyc_c"};
ecolicore=addReactions[ecolicore,additionalRxns];
setModelAttribute[ecolicore,"GPR",gpr];
setModelAttribute[ecolicore,"InitialConditions",{}];
setModelAttribute[ecolicore,"Notes",defaultInitializationNotes[]];


ecolicore["Notes"]


SetDirectory[NotebookDirectory[]];
Export["../models/EcoliCore/EcoliCore.m.gz",ecolicore]
