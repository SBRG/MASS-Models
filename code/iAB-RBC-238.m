(* ::Package:: *)

<<MASStoolbox`
<<MASStoolbox`Style`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`
bigg2equilibrator=Import["../data/bigg2equilibratorViaKEGG.m.gz"];


(* ::Title:: *)
(*iAB-RBC-238*)


(* ::Section:: *)
(*SBML2MODEL*)


(* ::Subsection:: *)
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


SetDirectory[NotebookDirectory[]];
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


<<MASStoolbox`


constructModel[str2mass/@{"1: h[c] + h2o[e] <=> h[e] + h2o[c]"}]["Rates"]
constructModel[str2mass/@{"1: h[c] + h2o[e] <=> h[e] + h2o[c]"},Ignore->{m["h",_]}]["Rates"]


FilterRules[{m["h2o","c"]->2,m["h","c"]->1,m["h","e"]->2},Except[{m["h",_]}]]


ignore={m["go6p",_]};


Alternatives@@ignore


DeleteCases[ppp["Rates"],(((m:$MASS$speciesPattern)^_)|((m:$MASS$speciesPattern[t])))/;MatchQ[m[[0]],Alternatives@@ignore],\[Infinity]]


SetDirectory[NotebookDirectory[]];
rbcReactions=(sbml2model["../data/iAB-RBC-238/1752-0509-5-110-s5.xml.gz", Method->"Light"])["Reactions"]//.s_String:>StringReplace[s,biggCommonStringReplacements];
correctRxnsAndBounds=Table[
	bnds=getID[rxn]/.iABrefBounds;
	If[!reversibleQ[rxn],Switch[bnds,{a_/;a<0,b_/;b<=0},Reverse@rxn->Abs[Reverse[bnds]],_,rxn->(bnds)],rxn->(bnds)]
	,{rxn,rbcReactions}
];
rbc=constructModel[correctRxnsAndBounds[[All,1]],Constraints->(getID[#[[1]]]->#[[2]]&/@correctRxnsAndBounds),Ignore->{m["h",_],m["h2o",_]}];
updateNotes[rbc,defaultInitializationNotes[]<>"\n This model covers the iAB-RBC-238 reconstruction by Aarash Bordbard."];
setGPR[rbc,protAssoc];
setID[rbc,"iAB-RBC-238"];
setElementalComposition[rbc,elementalComposition];
dg=Quiet[calcDeltaG[rbc["Reactions"],bigg2equilibrator,is->0.25 Mole Liter^-1,pH->7.3],{calcDeltaG::missingPseudoisomerData}];
Print["Proportion of reactions without thermodynamic information."];
Count[dg,r_Rule/;r[[2]]===Undefined]/N@Length[rbc\[Transpose]]
keq=dG2keq[DeleteCases[dg,r_Rule/;r[[2]]===Undefined]];
keq=adjustUnits[keq,rbc,DefaultAmountUnit->Mole];
updateParameters[rbc,keq];


Reverse@SortBy[Tally[Cases[Flatten[getSpecies/@rbc["Reactions"]]/.bigg2equilibrator,_metabolite]],Last]


DeleteCases[stripUnits@dg[[All,2]],Undefined]//Length


Histogram[DeleteCases[stripUnits@dg[[All,2]],Undefined],FrameLabel->{"dG","Frequency"}]
Histogram[Log[10,stripUnits@FilterRules[rbc["Parameters"],_Keq][[All,2]]],FrameLabel->{"Keq [log10]","Frequency"}]


stoichiometricallyConsistentQ[rbc]


elementallyBalancedQ@rbc


rbc["Fluxes"]//Length
rbc["Fluxes"]//Union//Length
rbc["Proteins"]//Union//Length


SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238.m.gz",rbc]


(*SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238.xml",model2sbml[rbc]]*)


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


(* ::Subsection:: *)
(*Glycolysis*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


SetDirectory[NotebookDirectory[]];
glycolysis=Import["../models/SB2/glycolysis.m.gz"];


plotSimulation[simulate[glycolysis,{t,0,100}][[1]]]/.m:$MASS$speciesPattern:>ToString[m]


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


getID/@glycolysis["Fluxes"]/.sb2ToiAB


v/@DeleteCases[getID/@glycolysis["Fluxes"]/.sb2ToiAB,_Missing]


glycolysis["Parameters"]


iABglycolysis=subModel[rbc,DeleteCases[getID/@glycolysis["Fluxes"]/.sb2ToiAB,_Missing]];


glycolysis["InitialConditions"]


FilterRules[glycolysis["Parameters"],_rateconst]
FilterRules[glycolysis["Parameters"],_Keq]


MASStoolbox`MASS`v["vh"]->(0.0026880000000000003` Mole)/(Hour Liter)


calcPERC[glycolysis]


glycolysis["Rates"]


glycolysis["CustomRateLaws"]


iABglycolysis["Rates"]


glycolysis["Ignore"]


iABglycolysis=subModel[rbc,DeleteCases[getID/@glycolysis["Fluxes"]/.sb2ToiAB,_Missing]];
setID[iABglycolysis,"iAB-RBC-238-Glycolysis"];
setIgnore[iABglycolysis,{m["h",_],m["h2o",_]}]
iABglycolysis=addSinks[iABglycolysis,{MASStoolbox`MASS`metabolite["pyr", "c"],MASStoolbox`MASS`metabolite["lac-L", "c"],MASStoolbox`MASS`metabolite["glc-D", "c"],MASStoolbox`MASS`metabolite["h", "c"],MASStoolbox`MASS`metabolite["h2o", "c"]}];
iABglycolysis=addReactions[iABglycolysis,{MASStoolbox`MASS`reaction["ATP_hydrolysis", {MASStoolbox`MASS`metabolite["atp", "c"], MASStoolbox`MASS`metabolite["h2o", "c"]}, {MASStoolbox`MASS`metabolite["adp", "c"], MASStoolbox`MASS`metabolite["h", "c"], MASStoolbox`MASS`metabolite["pi", "c"]}, {1, 1, 1, 1, 1}, True],MASStoolbox`MASS`reaction["NADH_oxidation", {MASStoolbox`MASS`metabolite["nadh", "c"]}, {MASStoolbox`MASS`metabolite["h", "c"], MASStoolbox`MASS`metabolite["nad", "c"]}, {1, 1, 1}, True]}];
setInitialConditions[iABglycolysis,Join[
#[[1]]->Convert[#[[2]]Milli Mole Liter^-1,Mole Liter^-1]&/@{MASStoolbox`MASS`metabolite["glc-D", "c"]->1.`,MASStoolbox`MASS`metabolite["g6p", "c"]->0.0486`,MASStoolbox`MASS`metabolite["f6p", "c"]->0.0198`,MASStoolbox`MASS`metabolite["fdp", "c"]->0.0146`,MASStoolbox`MASS`metabolite["dhap", "c"]->0.16`,MASStoolbox`MASS`metabolite["g3p", "c"]->0.00728`,MASStoolbox`MASS`metabolite["13dpg", "c"]->0.000243`,MASStoolbox`MASS`metabolite["3pg", "c"]->0.0773`,MASStoolbox`MASS`metabolite["2pg", "c"]->0.0113`,MASStoolbox`MASS`metabolite["pep", "c"]->0.017`,MASStoolbox`MASS`metabolite["pyr", "c"]->0.060301`,MASStoolbox`MASS`metabolite["lac-L", "c"]->1.36`,MASStoolbox`MASS`metabolite["nad", "c"]->0.0589`,MASStoolbox`MASS`metabolite["nadh", "c"]->0.0301`,MASStoolbox`MASS`metabolite["amp", "c"]->0.08672812499999999`,MASStoolbox`MASS`metabolite["adp", "c"]->0.29`,MASStoolbox`MASS`metabolite["atp", "c"]->1.6`,MASStoolbox`MASS`metabolite["pi", "c"]->2.5`,MASStoolbox`MASS`metabolite["h", "c"]->0.00008997573444801929`,MASStoolbox`MASS`metabolite["h2o", "c"]->1.`},
#[[1]]->Convert[#[[2]]Milli Mole Liter^-1 Hour^-1,Mole Liter^-1 Hour^-1]&/@{"HEX1"->1.12`,"PGI"->1.12`,"PFK"->1.12`,"TPI"->1.12`,"FBA"->1.12`,"GAPD"->2.24`,"PGK"->-2.24`,"PGM"->-2.24`,"ENO"->2.24`,"PYK"->2.24`,"LDH_L"->-2.016`,"ADK1"->0.`,"Sink_pyr_c"->0.22400000000000003`,"Sink_lac-L_c"->2.016`,"ATP_hydrolysis"->2.24`,
"NADH_oxidation"->0.22400000000000003`,"Sink_glc-D_c"->-1.12`,"Sink_h_c"->2.688`,"Sink_h2o_c"->0.`}
]];
xtrnalConc=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["pyr", "Xt"]->0.06`,MASStoolbox`MASS`metabolite["amp", "Xt"]->1,MASStoolbox`MASS`metabolite["h", "Xt"]->0.00006309573444801929`,metabolite[_,"Xt"]->1};
setParameters[iABglycolysis,Join[{MASStoolbox`MASS`parameter["Volume", "c"]->Liter,MASStoolbox`MASS`Keq["HEX1"]->850,MASStoolbox`MASS`Keq["PGI"]->0.41`,MASStoolbox`MASS`Keq["PFK"]->310,MASStoolbox`MASS`Keq["TPI"]->0.05714285714285714`,MASStoolbox`MASS`Keq["FBA"]->0.082`,MASStoolbox`MASS`Keq["GAPD"]->0.0179`,MASStoolbox`MASS`Keq["PGK"]->1/1800,MASStoolbox`MASS`Keq["PGM"]->6.8`,
MASStoolbox`MASS`Keq["ENO"]->1.6949152542372883`,MASStoolbox`MASS`Keq["PYK"]->363000,MASStoolbox`MASS`Keq["LDH_L"]->1/26300,MASStoolbox`MASS`Keq["ADK1"]->0.6060606060606061`,MASStoolbox`MASS`Keq["Sink_pyr_c"]->1.`,MASStoolbox`MASS`Keq["Sink_lac-L_c"]->1.`,MASStoolbox`MASS`Keq["ATP_hydrolysis"]->\[Infinity],MASStoolbox`MASS`Keq["NADH_oxidation"]->\[Infinity],MASStoolbox`MASS`Keq["Sink_glc-D_c"]->0,MASStoolbox`MASS`Keq["Sink_h_c"]->1.,MASStoolbox`MASS`Keq["Sink_h2o_c"]->1.`},xtrnalConc]];

setBoundaryConditions[iABglycolysis,{m["h","c"],m["h2o","c"]}]
perc=calcPERC[iABglycolysis,"AtEquilibriumDefault"->1];
updateParameters[iABglycolysis,perc];
updateNotes[iABglycolysis,defaultInitializationNotes[]<>"\n This model is a translation of the glycolysis model in 'Simulation of dynamic network state' in terms of the iAB-RBC-238 reconstruction by Aarash Bordbard."];

SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238-Glycolysis.m.gz",iABglycolysis]


iABglycolysis["Reactions"]


SortBy[perc,Last]


{concSol,fluxSol}=simulate[iABglycolysis,{t,0,1000}];
plotSimulation[concSol]/.m_metabolite:>getID[m]


{concSol,fluxSol}=simulate[iABglycolysis,{t,0,1000},Parameters->{rateconst["ATP_hydrolysis",True]->2}];
plotSimulation[concSol]/.m_metabolite:>getID[m]


(* ::Subsection:: *)
(*Pentose phosphate pathway*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


SetDirectory[NotebookDirectory[]];
ppp=Import["../models/SB2/ppp.m.gz"];


sb2ToiAB={"vg6pdh"->"G6PDH2r","vpglase"->"PGL","vgl6pdh"->"GND","vr5pe"->"RPE","vr5pi"->"RPI","vtki"->"TKT1","vtkii"->"TKT2","vtala"->"TALA","vgssgr"->"GTHO","vgshr"->"GTHP"}


TableForm[{Cases[ppp["Reactions"],r_reaction/;getID[r]==#[[1]]][[1]],If[MatchQ[#[[2]],_Missing],TraditionalForm@#[[2]],Cases[rbc["Reactions"],r_reaction/;getID[r]==#[[2]]][[1]]]}&/@sb2ToiAB]/.sb2MetsToiAB


reaction["GSHR", {metabolite["gthrd", "c"]}, {metabolite["h", "c"], metabolite["gthox", "c"]}, {2, 2, 1}, True]


iABppp["Reactions"]


iABppp=subModel[rbc,ppp["Fluxes"]/.sb2ToiAB];
setID[iABppp,"iAB-RBC-238-PentosePhosphatePathway"];
(*iABppp=addReaction[iABppp,reaction["GSHR", {metabolite["gthrd", "c"]}, {metabolite["h", "c"], metabolite["gthox", "c"]}, {2, 2, 1}, True]]*)(*not in BIGG; should maybe be replaced by glutathione peroxidase GTHP*)
iABppp=addSinks[iABppp,{m["f6p","c"],m["g6p","c"],m["g3p","c"],m["h2o","c"],m["h","c"],m["co2","c"],m["h2o2","c"]}];
updateBoundaryConditions[iABppp,{m["h","c"],m["h2o","c"]}];

ssFluxes=#[[1]]->#[[2]]Milli Mole Liter^-1 Hour^-1&/@{"G6PDH2r"->0.21`,"PGL"->0.21`,"GND"->0.21`,"RPE"->0.14`,"RPI"->-0.06999999999999999`,"TKT1"->0.06999999999999999`,"TKT2"->0.07`,"TALA"->0.06999999999999999`,"GTHO"->0.42`,"GTHP"->0.42`,"GSHR"->0.42`,"vgshr"->0.42`,"Sink_g6p_c"->-0.21`,"Sink_f6p_c"->0.14`,"Sink_h_c"->0,"Sink_h2o_c"->0.63`,"Sink_h2o2_c"->-0.42`,"Sink_co2_c"->0.21`,"Sink_g3p_c"->0.07`};
ssConc=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["g6p", "c"]->0.0486`,MASStoolbox`MASS`metabolite["f6p", "c"]->0.0198`,MASStoolbox`MASS`metabolite["g3p", "c"]->0.00728`,MASStoolbox`MASS`metabolite["6pgl", "c"]->0.001754242723`,MASStoolbox`MASS`metabolite["6pgc", "c"]->0.037475258`,MASStoolbox`MASS`metabolite["ru5p-D", "c"]->0.0049367903`,MASStoolbox`MASS`metabolite["xu5p-D", "c"]->0.014784196`,MASStoolbox`MASS`metabolite["r5p", "c"]->0.00494`,MASStoolbox`MASS`metabolite["s7p", "c"]->0.023987984`,MASStoolbox`MASS`metabolite["e4p", "c"]->0.0050750696`,MASStoolbox`MASS`metabolite["nadp", "c"]->0.0002`,MASStoolbox`MASS`metabolite["nadph", "c"]->0.0658`,MASStoolbox`MASS`metabolite["gthrd", "c"]->3.2`,MASStoolbox`MASS`metabolite["gthox", "c"]->0.11999999999999966`,MASStoolbox`MASS`metabolite["h", "c"]->0.00009929240111468596`,MASStoolbox`MASS`metabolite["h2o2", "c"]->0.00001`,MASStoolbox`MASS`metabolite["h2o", "c"]->0.99999683`,MASStoolbox`MASS`metabolite["co2", "c"]->1.0000021`};
setInitialConditions[iABppp,Join[ssFluxes,ssConc]];
setParameters[iABppp,{parameter["Volume", "c"] -> 1 Liter, Keq["Sink_h_c"] -> 1, Keq["Sink_h2o_c"] -> 1, Keq["Sink_g6p_c"] -> 1, Keq["Sink_g3p_c"] -> 1,Keq["Sink_h2o2_c"] -> 1,
Keq["Sink_co2_c"] -> 1,Keq["Sink_f6p_c"] -> 1, Keq["G6PDH2r"] -> 1000, Keq["PGL"] -> 1000, Keq["GND"] -> 1000, Keq["RPE"] -> 3, Keq["RPI"] -> 1/2.57, 
  Keq["TKT1"] -> 3, Keq["TKT2"] -> 10.3, Keq["TALA"] -> 1.05, Keq["GTHO"] -> 100,Keq["GTHP"] -> \[Infinity](*, Keq["GSHR"] -> 2*), metabolite[_, "Xt"] -> 1 Milli Mole Liter^-1}];
perc=calcPERC[iABppp,AtEquilibriumDefault->1];
updateParameters[iABppp,perc];
updateNotes[iABppp,defaultInitializationNotes[]<>"\n This model is a translation of the pentose phosphate pathway model in 'Simulation of dynamic network state' in terms of the iAB-RBC-238 reconstruction by Aarash Bordbard."];


Chop[iABppp.(iABppp["Fluxes"]/.iABppp["InitialConditions"])]


X3[iABglycolysis]


{concSol,fluxSol}=simulate[iABppp,{t,0,1000}];


plotSimulation[concSol]


(* ::Subsection:: *)
(*Nucleotide salvage pathway*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


SetDirectory[NotebookDirectory[]];
salvage=Import["../models/SB2/salvage.m.gz"];


sb2ToiAB={"vada"->"ADA","vadprt"->"ADPT","vak"->"ADNK1","vampase"->"NTD7","vampda"->"AMPDA","vimpase"->"NTD11","vpnpase"->"PUNP5","vprm"->"PPM","vprppsyn"->"PRPPS"}


TableForm[{Cases[salvage["Reactions"],r_reaction/;getID[r]==#[[1]]][[1]],If[MatchQ[#[[2]],_Missing],TraditionalForm@#[[2]],Cases[rbc["Reactions"],r_reaction/;getID[r]==#[[2]]][[1]]]}&/@sb2ToiAB]/.sb2MetsToiAB


iABsalvage=subModel[rbc,salvage["Fluxes"]/.sb2ToiAB];
iABsalvage=addReaction[iABsalvage,MASStoolbox`MASS`reaction["vatpgen", {MASStoolbox`MASS`metabolite["adp", "c"], MASStoolbox`MASS`metabolite["h", "c"], MASStoolbox`MASS`metabolite["pi", "c"]}, {MASStoolbox`MASS`metabolite["h2o", "c"], MASStoolbox`MASS`metabolite["atp", "c"]}, {1, 1, 1, 1, 1}, True]](*not in BIGG*);
iABsalvage=addSinks[iABsalvage,{m["ade","c"],m["adn","c"],m["hxan","c"],m["ins","c"],m["pi","c"],m["amp","c"],m["h","c"],m["h2o","c"],(*these are new*)m["ppi","c"],m["nh4","c"],m["adp","c"]}];
ssConc=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["r5p", "c"]->0.00494`,MASStoolbox`MASS`metabolite["ade", "c"]->0.001`,MASStoolbox`MASS`metabolite["adn", "c"]->0.0012`,MASStoolbox`MASS`metabolite["imp", "c"]->0.01`,MASStoolbox`MASS`metabolite["ins", "c"]->0.001`,MASStoolbox`MASS`metabolite["hxan", "c"]->0.002`,MASStoolbox`MASS`metabolite["r1p", "c"]->0.06`,MASStoolbox`MASS`metabolite["prpp", "c"]->0.005`,MASStoolbox`MASS`metabolite["amp", "c"]->0.08672812499999999`,MASStoolbox`MASS`metabolite["adp", "c"]->0.29`,MASStoolbox`MASS`metabolite["atp", "c"]->1.6`,MASStoolbox`MASS`metabolite["pi", "c"]->2.5`,MASStoolbox`MASS`metabolite["ppi", "c"]->0.0015`,MASStoolbox`MASS`metabolite["h", "c"]->0.00006309573444801929`,MASStoolbox`MASS`metabolite["h2o", "c"]->0.99999976`,MASStoolbox`MASS`metabolite["nh4", "c"]->0.091`};
ssFluxes=#[[1]]->#[[2]]Milli Mole Liter^-1 Hour^-1&/@Chop@fba[iABsalvage,"vatpgen",Join[{"ADA"->{0.01,0.01},"ADNK1"->{0.12,0.12},"vatpgen"->{0,0.148`},"NTD11"->{0.014,0.014}},{"Sink_ade_c"->{-0.014,-0.014},"Sink_adn_c"->{-\[Infinity],0},"Sink_hxan_c"->{-\[Infinity],\[Infinity]},"Sink_ins_c"->{-\[Infinity],\[Infinity]},"Sink_pi_c"->{-\[Infinity],\[Infinity]},"Sink_amp_c"->{-\[Infinity],\[Infinity]},"Sink_h_c"->{-\[Infinity],-\[Infinity]},"Sink_h2o_c"->{0,0},"Sink_ppi_c"->{-\[Infinity],\[Infinity]},"Sink_nh4_c"->{-\[Infinity],\[Infinity]},"Sink_adp_c"->{-\[Infinity],\[Infinity]}}]];
setInitialConditions[iABsalvage,Join[ssConc,ssFluxes]];
xtrnlConc=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["ppi", "Xt"]->0.0015`,MASStoolbox`MASS`metabolite["adn", "Xt"]->0.0012001`,MASStoolbox`MASS`metabolite["ade", "Xt"]->0.00100014`,MASStoolbox`MASS`metabolite["hxan", "Xt"]->0.00199986`,MASStoolbox`MASS`metabolite["nh4", "Xt"]->0.0909999`,MASStoolbox`MASS`metabolite["amp", "Xt"]->0.09540093749999999`,MASStoolbox`MASS`metabolite["h", "Xt"]->0.00006309573444801929`,MASStoolbox`MASS`metabolite["pi", "Xt"]->0.25`,MASStoolbox`MASS`metabolite["ins", "Xt"]->0.0009999`,MASStoolbox`MASS`metabolite["adp", "Xt"]->0.3`};
param={MASStoolbox`MASS`parameter["Volume", "c"]->1 Liter,MASStoolbox`MASS`Keq["ADNK1"]->1000000,MASStoolbox`MASS`Keq["NTD7"]->1000000,MASStoolbox`MASS`Keq["ADA"]->1000000,MASStoolbox`MASS`Keq["AMPDA"]->1000000,MASStoolbox`MASS`Keq["NTD11"]->1000000,MASStoolbox`MASS`Keq["PUNP5"]->0.09`,MASStoolbox`MASS`Keq["PPM"]->13.3`,MASStoolbox`MASS`Keq["PRPPS"]->1000000,MASStoolbox`MASS`Keq["ADPT"]->1000000,MASStoolbox`MASS`Keq["Sink_ade_c"]->1,MASStoolbox`MASS`Keq["Sink_pi_c"]->1,MASStoolbox`MASS`Keq["Sink_adp_c"]->1,MASStoolbox`MASS`Keq["Sink_amp_c"]->1,MASStoolbox`MASS`Keq["Sink_ppi_c"]->100000,MASStoolbox`MASS`Keq["Sink_adn_c"]->0.1`,MASStoolbox`MASS`Keq["Sink_ins_c"]->1,MASStoolbox`MASS`Keq["Sink_hxan_c"]->1,MASStoolbox`MASS`Keq["Sink_nh4_c"]->1,MASStoolbox`MASS`Keq["vatpgen"]->1000000,MASStoolbox`MASS`Keq["Sink_h_c"]->1,MASStoolbox`MASS`Keq["Sink_h2o_c"]->1};
setParameters[iABsalvage,Join[xtrnlConc,param]];
setIgnore[iABsalvage,{m["h","c"],m["h2o","c"]}]
setBoundaryConditions[iABsalvage,{m["h","c"],m["h2o","c"]}];
perc=calcPERC[iABsalvage,AtEquilibriumDefault->1];
updateParameters[iABsalvage,perc]


SortBy[perc,Last]


{concSol,fluxSol}=simulate[iABsalvage,{t,0,1000}];
plotSimulation[concSol]


TableForm[{#[[1]],stripUnits@Convert[#[[2]],Milli Mole Liter^-1 Hour^-1]}&/@FilterRules[iABsalvage["InitialConditions"],_v]]


calcPERC[iABsalvage,AtEquilibriumDefault->1]


visualizePathways[reactions2bipartite[iABsalvage["Reactions"]],
DirectedEdges->True,PlotStyle->{GrayLevel[0.5`],Arrowheads[.012]},
"MetaboliteRenderingFunction"->({Style[Text[StandardForm@#2,#1],
Background->Opacity[.6,White]]}&),"ReactionRenderingFunction"->({Style[Text[StandardForm@#2,#1],Larger,Background->Opacity[.6,LightGray]]}&),ImageSize->1600,MultiedgeStyle->None]


elementallyBalancedQ[iABsalvage]
stoichiometricallyConsistentQ[iABsalvage]


updateNotes[iABsalvage,defaultInitializationNotes[]<>"\n This model is a translation of the nucleotide salvage pathway model in 'Simulation of dynamic network state' in terms of the iAB-RBC-238 reconstruction by Aarash Bordbard."];
SetDirectory[NotebookDirectory[]];
Export["../models/iAB-RBC-238/iAB-RBC-238-NucleotideSalvagePathway.m.gz",iABsalvage]
