(* ::Package:: *)

<<MASStoolbox`
<<MASStoolbox`Style`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*iAB-RBC-238*)


(* ::Section:: *)
(*SBML2MODEL*)


(* ::Subsection::Closed:: *)
(*Import model from SBML and translate to MASSmodel*)


(* ::Subsubsection:: *)
(*Flux Bounds*)


getReferenceFluxesAndBoundsFromXML[path_String]:=Block[{tmp,tmp2,tmp3,tmp4},
tmp=Import[path,"Text"];
tmp2=StringCases[tmp,RegularExpression["(?s)listOfReactions.+"]];
tmp3=Flatten[StringSplit[tmp2,RegularExpression["<reaction id="]][[1]][[2;;]]];
tmp4=StringCases[#,RegularExpression["(?s)^(\"R_.+?\").+\"LOWER_BOUND\"\\s*?value=\"([-e\\d\\.]+)\".+?\"UPPER_BOUND\"\\s*?value=\"([-e\\d\\.]+)\".+?\"FLUX_VALUE\"\\s*?value=\"(.+?)\""]:>N[{"$1"->{ToExpression@StringReplace["$2","e"->"*10^"],ToExpression@StringReplace["$3","e"->"*10^"],ToExpression@StringReplace["$4","e"->"*10^"]}}]]&/@tmp3;
Flatten[tmp4]/.s_String:>StringReplace[s,{"\""->""}]
];


iABrefBounds=#[[1]]->#[[2,1;;2]]&/@(getReferenceFluxesAndBoundsFromXML["../data/iAB-RBC-238/1752-0509-5-110-s5.xml.gz"]//.s_String:>StringReplace[s,biggCommonStringReplacements]);


(* ::Subsubsection:: *)
(*GPR*)


protAssoc=Flatten[Thread[#[[1]]->(If[StringMatchQ[#,RegularExpression[".*\\+.*"]],proteinComplex[Sequence@@(protein/@StringSplit[#,RegularExpression["\\s*\\+\\s*"]])],protein[#]]&/@StringSplit[#[[2]],RegularExpression["\\s*,\\s*"]])]&/@DeleteCases[Import["../data/iAB-RBC-238/1752-0509-5-110-s4.xls.gz"][[1]][[2;;,{1,-5}]],{_,"''"}]];


protAssoc//Length
protAssoc//Union//Length


protAssoc=Union[protAssoc];


(* ::Subsubsection:: *)
(*Elemental composition*)


bigg2inchi=Import["/Users/niko/work/Code/MathematicaRepo/MASStoolbox/Models/Mappings/bigg2inchi.m.gz"];


SetDirectory[NotebookDirectory[]];
elementalComposition=str2mass[#[[1]]]->formula2elementalComposition[#[[4]]]&/@DeleteCases[Import["../data/iAB-RBC-238/1752-0509-5-110-s4.xls.gz"][[2]],{"","","",""}][[2;;]];


(* ::Subsubsection:: *)
(*Build model*)


SetDirectory[NotebookDirectory[]];
rbcReactions=(sbml2model["../data/iAB-RBC-238/1752-0509-5-110-s5.xml.gz", Method->"Light"]//.s_String:>StringReplace[s,biggCommonStringReplacements])["Reactions"];
correctRxnsAndBounds=Table[
	bnds=getID[rxn]/.iABrefBounds;
	If[!reversibleQ[rxn],Switch[bnds,{a_/;a<0,b_/;b<=0},Reverse@rxn->Abs[Reverse[bnds]],_,rxn->(bnds)],rxn->(bnds)]
	,{rxn,rbcReactions}
];
rbc=constructModel[correctRxnsAndBounds[[All,1]],Constraints->(getID[#[[1]]]->#[[2]]&/@correctRxnsAndBounds)];
updateNotes[rbc,defaultInitializationNotes[]];
setGPR[rbc,protAssoc];
setElementalComposition[rbc,elementalComposition];


stoichiometricallyConsistentQ[rbc]


elementallyBalancedQ@rbc


rbc["Fluxes"]//Length
rbc["Fluxes"]//Union//Length
rbc["Proteins"]//Union//Length


SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238.m.gz",rbc]


getNotes@rbc


(* ::Subsection::Closed:: *)
(*Visualize model*)


(*currencyMets=annotateCurrencyMetabolites[getReactions@rbc];
SetDirectory[NotebookDirectory[]];
Export["../Data/iAB-RBC-238/currencyMetsRBC.m.gz",currencyMets];*)


SetDirectory[NotebookDirectory[]];
currencyMets=Import["../Data/iAB-RBC-238/currencyMetsRBC.m.gz"];


net=pathwaytize[DeleteCases[reactions2bipartite[getReactions[rbc],AliasingRules->currencyMets],r_Rule/;MemberQ[r,m_metabolite/;StringMatchQ[getID[m],RegularExpression[".*\\$.*"]],\[Infinity]]],10,Method->"Remove"];
(*net=DeleteCases[reactions2bipartite[getReactions[rbc],AliasingRules->currencyMets],r_Rule/;MemberQ[r,m_metabolite/;StringMatchQ[getID[m],RegularExpression[".*\\$.*"]],\[Infinity]]];*)
connComponents=ConnectedComponents@Graph[Union[(Rule@@Sort[List@@#]&/@net)]/.r_Rule:>UndirectedEdge@@r];
nets=Cases[net,r_Rule/;MemberQ[#,Alternatives@@r]]&/@Sort[connComponents,Length[#1]>Length[#2]&];
transp=Cases[Union@Cases[nets,r_Rule/;MemberQ[r,metabolite[_,"e"],\[Infinity]],\[Infinity]],_String,2];


SlideView[visualizePathways[DeleteCases[#,r_Rule/;MemberQ[transp,r[[1]]]||MemberQ[transp,r[[2]]]||MemberQ[r,s_String/;StringMatchQ[s,RegularExpression[".*DM_.*"]]||StringMatchQ[s,RegularExpression[".*sink_.*"]],\[Infinity]]],
PlotFunction->LayeredGraphPlot,ImageSize->1200,EdgeRenderingFunction->({If[EuclideanDistance[#1[[1]],#1[[-1]]]>5,Unevaluated[Sequence[Gray,Dotted]],Black],Arrow[#1,0.1]}&)]&/@nets[[1;;2]]]


(* ::Subsection::Closed:: *)
(*Visualize GPRs*)


SlideView[visualizeGPR[#]&/@gpr2graphs[rbc["GPR"]],AppearanceElements->All]


(* ::Section:: *)
(*Translate SB2 book models to iAB-RBC-238*)


sb2MetsToiAB={metabolite["glu", comp_] :> metabolite["glc-D", comp], metabolite["gap", comp_] :> metabolite["g3p", comp],metabolite["phos", comp_] :> metabolite["pi", comp],
metabolite["pg13", comp_] :> metabolite["13dpg", comp],metabolite["pg3", comp_] :> metabolite["3pg", comp],metabolite["pg2", comp_] :> metabolite["2pg", comp],metabolite["lac", comp_] :> metabolite["lac-L", comp],
metabolite["gl6p",comp_]:>metabolite["6pgl",comp],metabolite["go6p",comp_]:>metabolite["6pgc",comp],metabolite["ru5p",comp_]:>metabolite["ru5p-D",comp],metabolite["x5p",comp_]:>metabolite["xu5p-D",comp],
metabolite["gssg",comp_]:>metabolite["gthox",comp],metabolite["gsh",comp_]:>metabolite["gthrd",comp],metabolite["ado",comp_]:>metabolite["adn",comp],metabolite["ino",comp_]:>metabolite["ins",comp],metabolite["hyp",comp_]:>metabolite["hxan",comp]};


(* ::Subsection::Closed:: *)
(*Glycolysis*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


SetDirectory[NotebookDirectory[]];
glycolysis=Import["../models/SB2/glycolysis.m.gz"];


sb2ToiAB={"vhk"->"HEX1","vpgi"->"PGI","vpfk"->"PFK","vtpi"->"TPI","vald"->"FBA",
"vgapdh"->"GAPD","vpgk"->"PGK","vpglm"->"PGM","veno"->"ENO","vpk"->"PYK",
"vldh"->"LDH_L","vamp"->Missing["NotAvailable"],"vapk"->"ADK1",
"vpyr"->Missing["NotAvailable"],"vlac"->Missing["NotAvailable"],
"vatp"->Missing["NotAvailable"],"vnadh"->Missing["NotAvailable"],
"vgluin"->Missing["NotAvailable"],"vampin"->Missing["NotAvailable"],"vh"->Missing["NotAvailable"],"vh2o"->Missing["NotAvailable"]
};


TableForm[{Cases[glycolysis["Reactions"],r_reaction/;getID[r]==#[[1]]][[1]],If[MatchQ[#[[2]],_Missing],TraditionalForm@#[[2]],Cases[rbc["Reactions"],r_reaction/;getID[r]==#[[2]]][[1]]]}&/@sb2ToiAB]/.sb2MetsToiAB


sb2ToiABnew={"vhk"->"HEX1","vpgi"->"PGI","vpfk"->"PFK","vtpi"->"TPI","vald"->"FBA","vgapdh"->"GAPD","vpgk"->"PGK","vpglm"->"PGM","veno"->"ENO","vpk"->"PYK",
"vldh"->"LDH_L","vapk"->"ADK1","vpyr"->"Sink_pyr_c","vlac"->"Sink_lac-L_c","vatp"->"ATP_hydrolysis","vnadh"->"NADH_oxidation","vgluin"->"Sink_glc-D_c","vh"->"Sink_h_c","vh2o"->"Sink_h2o_c"};


iABglycolysis=subModel[rbc,DeleteCases[glycolysis["Fluxes"]/.sb2ToiAB,_Missing]];
iABglycolysis=addSinks[iABglycolysis,{MASStoolbox`MASS`metabolite["pyr", "c"],MASStoolbox`MASS`metabolite["lac-L", "c"],MASStoolbox`MASS`metabolite["glc-D", "c"],MASStoolbox`MASS`metabolite["h", "c"],MASStoolbox`MASS`metabolite["h2o", "c"]}];
iABglycolysis=addReactions[iABglycolysis,{MASStoolbox`MASS`reaction["ATP_hydrolysis", {MASStoolbox`MASS`metabolite["atp", "c"], MASStoolbox`MASS`metabolite["h2o", "c"]}, {MASStoolbox`MASS`metabolite["adp", "c"], MASStoolbox`MASS`metabolite["h", "c"], MASStoolbox`MASS`metabolite["pi", "c"]}, {1, 1, 1, 1, 1}, True],MASStoolbox`MASS`reaction["NADH_oxidation", {MASStoolbox`MASS`metabolite["nadh", "c"]}, {MASStoolbox`MASS`metabolite["h", "c"], MASStoolbox`MASS`metabolite["nad", "c"]}, {1, 1, 1}, True]}];
setInitialConditions[iABglycolysis,Join[
{MASStoolbox`MASS`metabolite["glc-D", "c"]->1.`,MASStoolbox`MASS`metabolite["g6p", "c"]->0.0486`,MASStoolbox`MASS`metabolite["f6p", "c"]->0.0198`,MASStoolbox`MASS`metabolite["fdp", "c"]->0.0146`,MASStoolbox`MASS`metabolite["dhap", "c"]->0.16`,MASStoolbox`MASS`metabolite["g3p", "c"]->0.00728`,MASStoolbox`MASS`metabolite["13dpg", "c"]->0.000243`,MASStoolbox`MASS`metabolite["3pg", "c"]->0.0773`,MASStoolbox`MASS`metabolite["2pg", "c"]->0.0113`,MASStoolbox`MASS`metabolite["pep", "c"]->0.017`,MASStoolbox`MASS`metabolite["pyr", "c"]->0.060301`,MASStoolbox`MASS`metabolite["lac-L", "c"]->1.36`,MASStoolbox`MASS`metabolite["nad", "c"]->0.0589`,MASStoolbox`MASS`metabolite["nadh", "c"]->0.0301`,MASStoolbox`MASS`metabolite["amp", "c"]->0.08672812499999999`,MASStoolbox`MASS`metabolite["adp", "c"]->0.29`,MASStoolbox`MASS`metabolite["atp", "c"]->1.6`,MASStoolbox`MASS`metabolite["pi", "c"]->2.5`,MASStoolbox`MASS`metabolite["h", "c"]->0.00008997573444801929`,MASStoolbox`MASS`metabolite["h2o", "c"]->1.`},
{"HEX1"->1.12`,"PGI"->1.12`,"PFK"->1.12`,"TPI"->1.12`,"FBA"->1.12`,"GAPD"->2.24`,"PGK"->-2.24`,"PGM"->-2.24`,"ENO"->2.24`,"PYK"->2.24`,"LDH_L"->-2.016`,"ADK1"->0.`,"Sink_pyr_c"->0.22400000000000003`,"Sink_lac-L_c"->2.016`,"ATP_hydrolysis"->2.24`,
"NADH_oxidation"->0.22400000000000003`,"Sink_glc-D_c"->-1.12`,"Sink_h_c"->2.688`,"Sink_h2o_c"->0.`}
]];
setParameters[iABglycolysis,{MASStoolbox`MASS`parameter["Volume", "c"]->1,MASStoolbox`MASS`Keq["HEX1"]->850,MASStoolbox`MASS`Keq["PGI"]->0.41`,MASStoolbox`MASS`Keq["PFK"]->310,MASStoolbox`MASS`Keq["TPI"]->0.05714285714285714`,MASStoolbox`MASS`Keq["FBA"]->0.082`,MASStoolbox`MASS`Keq["GAPD"]->0.0179`,MASStoolbox`MASS`Keq["PGK"]->1/1800,MASStoolbox`MASS`Keq["PGM"]->6.8`,MASStoolbox`MASS`Keq["ENO"]->1.6949152542372883`,MASStoolbox`MASS`Keq["PYK"]->363000,MASStoolbox`MASS`Keq["LDH_L"]->1/26300,MASStoolbox`MASS`Keq["ADK1"]->0.6060606060606061`,MASStoolbox`MASS`Keq["Sink_pyr_c"]->1.`,MASStoolbox`MASS`Keq["Sink_lac-L_c"]->1.`,MASStoolbox`MASS`Keq["ATP_hydrolysis"]->\[Infinity],MASStoolbox`MASS`Keq["NADH_oxidation"]->\[Infinity],MASStoolbox`MASS`Keq["Sink_glc-D_c"]->0,MASStoolbox`MASS`Keq["Sink_h_c"]->1.`,MASStoolbox`MASS`Keq["Sink_h2o_c"]->1.`,MASStoolbox`MASS`metabolite["pyr", "Xt"]->0.06`,MASStoolbox`MASS`metabolite["amp", "Xt"]->1,MASStoolbox`MASS`metabolite["h", "Xt"]->0.00006309573444801929`,metabolite[_,"Xt"]->1}];
setIgnore[iABglycolysis,{m["h","c"],m["h2o","c"]}]
setBoundaryConditions[iABglycolysis,{m["h","c"],m["h2o","c"]}]
perc=calcPERC[iABglycolysis,"AtEquilibriumDefault"->1];
updateParameters[iABglycolysis,perc];
updateNotes[iABglycolysis,defaultInitializationNotes[]<>"\n This model is a translation of the glycolysis model in 'Simulation of dynamic network state' in terms of the iAB-RBC-238 reconstruction by Aarash Bordbard."];

SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238-Glycolysis.m.gz",iABglycolysis]


getNotes@iABglycolysis


plotSimulation[simulate[iABglycolysis,{t,0,10}][[1]]/.m_metabolite:>ToString[m]]


elementallyBalancedQ[iABglycolysis]


stoichiometricallyConsistentQ[iABglycolysis]


Chop[iABglycolysis.(iABglycolysis["Fluxes"]/.iABglycolysis["InitialConditions"])]


visualizePathways[reactions2bipartite[iABglycolysis["Reactions"]],
DirectedEdges->True,PlotStyle->{GrayLevel[0.5`],Arrowheads[.012]},
"MetaboliteRenderingFunction"->({Style[Text[StandardForm@#2,#1],
Background->Opacity[.6,White]]}&),"ReactionRenderingFunction"->({Style[Text[StandardForm@#2,#1],Larger,Background->Opacity[.6,LightGray]]}&),ImageSize->800,MultiedgeStyle->None]


(* ::Subsection::Closed:: *)
(*Pentose phosphate pathway*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


SetDirectory[NotebookDirectory[]];
ppp=Import["../models/SB2/ppp.m.gz"];


sb2ToiAB={"vg6pdh"->"G6PDH2r","vpglase"->"PGL","vgl6pdh"->"GND","vr5pe"->"RPE","vr5pi"->"RPI","vtki"->"TKT1","vtkii"->"TKT2","vtala"->"TALA","vgssgr"->"GTHO"}


TableForm[{Cases[ppp["Reactions"],r_reaction/;getID[r]==#[[1]]][[1]],If[MatchQ[#[[2]],_Missing],TraditionalForm@#[[2]],Cases[rbc["Reactions"],r_reaction/;getID[r]==#[[2]]][[1]]]}&/@sb2ToiAB]/.sb2MetsToiAB


reaction["GSHR", {metabolite["gthrd", "c"]}, {metabolite["h", "c"], metabolite["gthox", "c"]}, {2, 2, 1}, True]


iABppp=subModel[rbc,ppp["Fluxes"]/.sb2ToiAB];
iABppp=addReaction[iABppp,reaction["GSHR", {metabolite["gthrd", "c"]}, {metabolite["h", "c"], metabolite["gthox", "c"]}, {2, 2, 1}, True]](*not in BIGG; should maybe be replaced by glutathione peroxidase GTHP*);
iABppp=addSinks[iABppp,{m["f6p","c"],m["g6p","c"],m["g3p","c"],m["h2o","c"],m["h","c"],m["co2","c"]}];
setInitialConditions[iABppp,{MASStoolbox`MASS`metabolite["g6p", "c"]->0.0486`,MASStoolbox`MASS`metabolite["f6p", "c"]->0.0198`,MASStoolbox`MASS`metabolite["g3p", "c"]->0.00728`,MASStoolbox`MASS`metabolite["6pgl", "c"]->0.001754242723`,MASStoolbox`MASS`metabolite["6pgc", "c"]->0.037475258`,MASStoolbox`MASS`metabolite["ru5p-D", "c"]->0.0049367903`,MASStoolbox`MASS`metabolite["xu5p-D", "c"]->0.014784196`,MASStoolbox`MASS`metabolite["r5p", "c"]->0.00494`,
MASStoolbox`MASS`metabolite["s7p", "c"]->0.023987984`,MASStoolbox`MASS`metabolite["e4p", "c"]->0.0050750696`,MASStoolbox`MASS`metabolite["nadp", "c"]->0.0002`,MASStoolbox`MASS`metabolite["nadph", "c"]->0.0658`,MASStoolbox`MASS`metabolite["gthrd", "c"]->3.2`,MASStoolbox`MASS`metabolite["gthox", "c"]->0.11999999999999966`,MASStoolbox`MASS`metabolite["h", "c"]->0.00009929240111468596`,MASStoolbox`MASS`metabolite["h2o", "c"]->0.99999683`,MASStoolbox`MASS`metabolite["co2", "c"]->1.0000021`,
"G6PDH2r"->0.21`,"PGL"->0.21`,"GND"->0.21`,"RPE"->0.14`,"RPI"->-0.06999999999999999`,"TKT1"->0.06999999999999999`,
"TKT2"->0.07`,"TALA"->0.06999999999999999`,"GTHO"->0.42`,"GSHR"->0.42`,"vgshr"->0.42`,"Sink_g6p_c"->-0.21`,"Sink_f6p_c"->0.14`,"Sink_h_c"->0.84`,"Sink_h2o_c"->-0.21`,"Sink_co2_c"->0.21,"Sink_g3p_c"->0.07`}];
setParameters[iABppp,{parameter["Volume", "c"] -> 1, Keq["Sink_h_c"] -> 1, Keq["Sink_h2o_c"] -> 1, Keq["Sink_g6p_c"] -> 1, Keq["Sink_g3p_c"] -> 1,
Keq["Sink_co2_c"] -> 1,Keq["Sink_f6p_c"] -> 1, Keq["G6PDH2r"] -> 1000, Keq["PGL"] -> 1000, Keq["GND"] -> 1000, Keq["RPE"] -> 3, Keq["RPI"] -> 1/2.57, 
  Keq["TKT1"] -> 3, Keq["TKT2"] -> 10.3, Keq["TALA"] -> 1.05, Keq["GTHO"] -> 100,Keq["GSHR"] -> 2, Keq["vgshr"] -> 2, metabolite[_, "Xt"] -> 1}];
setIgnore[iABppp,{m["h","c"],m["h2o","c"]}]
setBoundaryConditions[iABppp,{m["h","c"],m["h2o","c"]}]
perc=calcPERC[iABppp];
updateParameters[iABppp,perc];
updateNotes[iABppp,defaultInitializationNotes[]<>"\n This model is a translation of the pentose phosphate pathway model in 'Simulation of dynamic network state' in terms of the iAB-RBC-238 reconstruction by Aarash Bordbard."];
SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238-PenthosePhosphatePathway.m.gz",iABppp]


plotSimulation[simulate[iABppp,{t,0,1000}][[1]]]


iABppp["ElementalComposition"]


elementallyBalancedQ[iABppp]


visualizePathways[reactions2bipartite[iABppp["Reactions"]],
DirectedEdges->True,PlotStyle->{GrayLevel[0.5`],Arrowheads[.012]},
"MetaboliteRenderingFunction"->({Style[Text[StandardForm@#2,#1],
Background->Opacity[.6,White]]}&),"ReactionRenderingFunction"->({Style[Text[StandardForm@#2,#1],Larger,Background->Opacity[.6,LightGray]]}&),ImageSize->800,MultiedgeStyle->None]


(* ::Subsection:: *)
(*Nucleotide salvage pathway*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


SetDirectory[NotebookDirectory[]];
salvage=Import["../models/SB2/salvage.m.gz"];


sb2ToiAB={"vada"->"ADA","vadprt"->"ADPT","vak"->"ADNK1","vampase"->"NTD7","vampda"->"AMPDA","vimpase"->"NTD11","vpnpase"->"PUNP5","vprm"->"PPM","vprppsyn"->"PRPPS"}


TableForm[{Cases[salvage["Reactions"],r_reaction/;getID[r]==#[[1]]][[1]],If[MatchQ[#[[2]],_Missing],TraditionalForm@#[[2]],Cases[rbc["Reactions"],r_reaction/;getID[r]==#[[2]]][[1]]]}&/@sb2ToiAB]/.sb2MetsToiAB


salvage["Parameters"]


iABsalvage=subModel[rbc,salvage["Fluxes"]/.sb2ToiAB];
iABsalvage=addReaction[iABsalvage,MASStoolbox`MASS`reaction["vatpgen", {MASStoolbox`MASS`metabolite["adp", "c"], MASStoolbox`MASS`metabolite["h", "c"], MASStoolbox`MASS`metabolite["pi", "c"]}, {MASStoolbox`MASS`metabolite["h2o", "c"], MASStoolbox`MASS`metabolite["atp", "c"]}, {1, 1, 1, 1, 1}, True]](*not in BIGG*);
iABsalvage=addSinks[iABsalvage,{m["ade","c"],m["adn","c"],m["hxan","c"],m["ins","c"],m["pi","c"],m["amp","c"],m["h","c"],m["h2o","c"],(*these are new*)m["ppi","c"],m["nh4","c"],m["adp","c"]}];
setInitialConditions[iABsalvage,Join[{MASStoolbox`MASS`metabolite["r5p", "c"]->0.00494`,MASStoolbox`MASS`metabolite["ade", "c"]->0.001`,MASStoolbox`MASS`metabolite["adn", "c"]->0.0012`,MASStoolbox`MASS`metabolite["imp", "c"]->0.01`,MASStoolbox`MASS`metabolite["ins", "c"]->0.001`,MASStoolbox`MASS`metabolite["hxan", "c"]->0.002`,MASStoolbox`MASS`metabolite["r1p", "c"]->0.06`,MASStoolbox`MASS`metabolite["prpp", "c"]->0.005`,MASStoolbox`MASS`metabolite["amp", "c"]->0.08672812499999999`,MASStoolbox`MASS`metabolite["adp", "c"]->0.29`,MASStoolbox`MASS`metabolite["atp", "c"]->1.6`,MASStoolbox`MASS`metabolite["pi", "c"]->2.5`,
MASStoolbox`MASS`metabolite["h", "c"]->0.00006309573444801929`,MASStoolbox`MASS`metabolite["h2o", "c"]->0.99999976`},Chop@fba[iABsalvage,"vatpgen",Join[{"ADA"->{0.01,0.01},"ADNK1"->{0.12,0.12},"vatpgen"->{0,0.148`},"NTD11"->{0.014,0.014}},{"Sink_ade_c"->{-0.014,-0.014},"Sink_adn_c"->{-\[Infinity],\[Infinity]},"Sink_hxan_c"->{-\[Infinity],\[Infinity]},"Sink_ins_c"->{-\[Infinity],\[Infinity]},"Sink_pi_c"->{-\[Infinity],\[Infinity]},"Sink_amp_c"->{-\[Infinity],\[Infinity]},"Sink_h_c"->{-\[Infinity],\[Infinity]},"Sink_h2o_c"->{-\[Infinity],\[Infinity]},"Sink_ppi_c"->{-\[Infinity],\[Infinity]},"Sink_nh4_c"->{-\[Infinity],\[Infinity]},"Sink_adp_c"->{-\[Infinity],\[Infinity]}}]]]];
setParameters[iABsalvage,{MASStoolbox`MASS`parameter["Volume", "c"]->1,MASStoolbox`MASS`Keq["ADNK1"]->\[Infinity],MASStoolbox`MASS`Keq["NTD7"]->\[Infinity],MASStoolbox`MASS`Keq["ADA"]->\[Infinity],MASStoolbox`MASS`Keq["AMPDA"]->\[Infinity],MASStoolbox`MASS`Keq["NTD11"]->\[Infinity],MASStoolbox`MASS`Keq["PUNP5"]->0.09`,MASStoolbox`MASS`Keq["PPM"]->13.3`,MASStoolbox`MASS`Keq["PRPPS"]->\[Infinity],MASStoolbox`MASS`Keq["ADPT"]->\[Infinity],MASStoolbox`MASS`Keq["vatpgen"]->\[Infinity],MASStoolbox`MASS`Keq["Sink_ade_c"]->1,MASStoolbox`MASS`Keq["Sink_adn_c"]->1,MASStoolbox`MASS`Keq["Sink_hxan_c"]->1,MASStoolbox`MASS`Keq["Sink_ins_c"]->\[Infinity],MASStoolbox`MASS`Keq["Sink_pi_c"]->1,MASStoolbox`MASS`Keq["Sink_amp_c"]->1,MASStoolbox`MASS`Keq["Sink_h_c"]->1,MASStoolbox`MASS`Keq["Sink_h2o_c"]->1,MASStoolbox`MASS`metabolite["adn", "Xt"]->0.0012001`,MASStoolbox`MASS`metabolite["ade", "Xt"]->0.001`,MASStoolbox`MASS`metabolite["ins", "Xt"]->0.00100087`,MASStoolbox`MASS`metabolite["hxan", "Xt"]->0.00199903`,MASStoolbox`MASS`metabolite["pi", "Xt"]->2.5`,MASStoolbox`MASS`metabolite["nh3", "Xt"]->0.0909999`,metabolite[_,"Xt"]->1}];
setIgnore[iABsalvage,{m["h","c"],m["h2o","c"]}]
setBoundaryConditions[iABsalvage,{m["h","c"],m["h2o","c"]}]


iABsalvage["Fluxes"]/.iABsalvage["InitialConditions"]
Chop[iABsalvage.%]


perc=calcPERC[iABsalvage]


plotFVA@fva[iABsalvage,getID[#]->{-\[Infinity],\[Infinity]}&/@iABsalvage["Exchanges"]]


LinearProgramming[Sequence@@model2LinearProgrammingData[iABsalvage,"PPM",getID[#]->{-\[Infinity],\[Infinity]}&/@iABsalvage["Exchanges"]]]
DualLinearProgramming[Sequence@@model2LinearProgrammingData[iABsalvage,"PPM",getID[#]->{-\[Infinity],\[Infinity]}&/@iABsalvage["Exchanges"]]]
Length/@%


LinearProgramming[Sequence@@model2LinearProgrammingData[stub,"PPM",getID[#]->{-\[Infinity],\[Infinity]}&/@stub["Exchanges"]]]
DualLinearProgramming[Sequence@@model2LinearProgrammingData[stub,"PPM",getID[#]->{-\[Infinity],\[Infinity]}&/@stub["Exchanges"]]]


visualizePathways[reactions2bipartite[iABsalvage["Reactions"]],
DirectedEdges->True,PlotStyle->{GrayLevel[0.5`],Arrowheads[.012]},
"MetaboliteRenderingFunction"->({Style[Text[StandardForm@#2,#1],
Background->Opacity[.6,White]]}&),"ReactionRenderingFunction"->({Style[Text[StandardForm@#2,#1],Larger,Background->Opacity[.6,LightGray]]}&),ImageSize->1600,MultiedgeStyle->None]


elementallyBalancedQ[iABsalvage]
stoichiometricallyConsistentQ[iABsalvage]



updateParameters[iABsalvage,perc];
updateNotes[iABsalvage,defaultInitializationNotes[]<>"\n This model is a translation of the pentose phosphate pathway model in 'Simulation of dynamic network state' in terms of the iAB-RBC-238 reconstruction by Aarash Bordbard."];
SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238-NucleotideSalvagePathway.m.gz",iABsalvage]



