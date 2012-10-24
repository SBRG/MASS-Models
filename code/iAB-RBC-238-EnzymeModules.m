(* ::Package:: *)

<<MASStoolbox`
<<MASStoolbox`Style`
<<XML`
SetDirectory[NotebookDirectory[]];
<<util`


(* ::Title:: *)
(*iAB-RBC-238 enzyme modules*)


SetDirectory[NotebookDirectory[]];
rbc=Import["../models/iAB-RBC-238/iAB-RBC-238.m.gz"];


(* ::Section:: *)
(*Hexokinase*)


Convert[(3.*^4 Second^-1)/(0.3*^8 Mole^-1 Second^-1),"MyUnits"]


mulquineyRateEquation=(2.85714` MASSToolbox`MASS`parameter["VHK"] MASSToolbox`MASS`parameter["Vi"] (-((1.92792` MASSToolbox`MASS`species["Glc6P", "c"][t] MASSToolbox`MASS`species["MgADP", "c"][t])/((1+1.0471285480509`*^7 10^-MASSToolbox`MASS`parameter["pH1"]+2.8183829312644505`*^-10 10^MASSToolbox`MASS`parameter["pH1"]) MASSToolbox`MASS`parameter["Kihkglc6p"] MASSToolbox`MASS`parameter["Kmhkmgadp"]))+(299.16` MASSToolbox`MASS`species["Glc", "c"] MASSToolbox`MASS`species["MgATP", "c"][t])/((1+1.0471285480509`*^7 10^-MASSToolbox`MASS`parameter["pH1"]+2.8183829312644505`*^-10 10^MASSToolbox`MASS`parameter["pH1"]) MASSToolbox`MASS`parameter["Kihkglc"] MASSToolbox`MASS`parameter["Kmhkmgatp"])))/(1+MASSToolbox`MASS`species["Glc", "c"]/MASSToolbox`MASS`parameter["Kihkglc"]+(MASSToolbox`MASS`species["Glc", "c"] MASSToolbox`MASS`species["B23PG", "c"][t])/(MASSToolbox`MASS`parameter["Kdihkbpg"] MASSToolbox`MASS`parameter["Kihkglc"])+(MASSToolbox`MASS`species["Glc", "c"] MASSToolbox`MASS`species["Glc16P2", "c"][t])/(MASSToolbox`MASS`parameter["Kdihkglc16p2"] MASSToolbox`MASS`parameter["Kihkglc"])+MASSToolbox`MASS`species["Glc6P", "c"][t]/MASSToolbox`MASS`parameter["Kihkglc6p"]+(MASSToolbox`MASS`species["Glc", "c"] MASSToolbox`MASS`species["Glc6P", "c"][t])/(MASSToolbox`MASS`parameter["Kdihkglc6p"] MASSToolbox`MASS`parameter["Kihkglc"])+(MASSToolbox`MASS`species["Glc", "c"] MASSToolbox`MASS`species["GSH", "c"][t])/(MASSToolbox`MASS`parameter["Kdihkgsh"] MASSToolbox`MASS`parameter["Kihkglc"])+MASSToolbox`MASS`species["MgADP", "c"][t]/MASSToolbox`MASS`parameter["Kihkmgadp"]+(MASSToolbox`MASS`species["Glc6P", "c"][t] MASSToolbox`MASS`species["MgADP", "c"][t])/(MASSToolbox`MASS`parameter["Kihkglc6p"] MASSToolbox`MASS`parameter["Kmhkmgadp"])+MASSToolbox`MASS`species["MgATP", "c"][t]/MASSToolbox`MASS`parameter["Kihkmgatp"]+(MASSToolbox`MASS`species["Glc", "c"] MASSToolbox`MASS`species["MgATP", "c"][t])/(MASSToolbox`MASS`parameter["Kihkglc"] MASSToolbox`MASS`parameter["Kmhkmgatp"]));


mulquineyRateEquation/.p_parameter/;Length[getID[p]]==0&&StringMatchQ[getID[p],RegularExpression["^Km.*"]]:>Km[m[StringReplace[getID[p],"Kmhk"->""]],"VHK"]


hex1rxn=v["HEX1"]/.Thread[rbc["Fluxes"]->rbc["Reactions"]]


hexParamMulquiney={(k1|k7|k12|k18)->0.3*^8 Mole^-1 Second^-1,k19->7.1,k21->0.075,k23->4.5,
k25->0.1,k2->3.*^4 Second^-1,(k4|k6|k8|k11|k13|k15|k17|k22|k26)->3.*^4 Second^-1,(k20|k24)->1.,k9->1.8*^-2,k10->1.36*^-4};


k2p


constructEnzymeModule//Options


substr=getSubstrates[hex1rxn];
prod=DeleteCases[getProducts[hex1rxn],m["h",_]];
inhibitors={MASSToolbox`MASS`metabolite["pi", "c"],MASSToolbox`MASS`metabolite["23dpg", "c"],MASSToolbox`MASS`metabolite["Glc(1,6)P2", "c"],MASSToolbox`MASS`metabolite["gthrd", "c"]};
(*hex1=constructEnzymeModule["ID"->"HEX1","Compartment"->"c","Substrates"->substr,"Products"->prod,"Mechanism"->"Random","InhibitionSites"->1,"Inhibitors"->inhibitors];*)
mech={"E"->"EA","EA"->"EAB","E"->"EB","EB"->"EAB","EAB"->"EPQ","EPQ"->"EP","EP"->"E","EPQ"->"EQ","EQ"->"E","EB"->"EBX","EB"->"EBY"};
hex1=constructEnzymeModule["ID"->"HEX1","Compartment"->"c","Substrates"->substr,"Products"->prod,"Mechanism"->mech,"InhibitionSites"->1,"CompetitiveInhibitors"->inhibitors];


CharacterRange["A","Z"]


GraphPlot[mech,DirectedEdges->True,VertexLabeling->True]


visualizePathways[Complement[hex1["Reactions"],hex1["Exchanges"]],MetaboliteRenderingFunction->(Text[#2,#1]&),EnzymeRenderingFunction->(Text[#2,#1]&),ImageSize->800,EdgeRenderingFunction->(Arrow[#,.3]&)]


hex1["Reactions"]


(* ::Section:: *)
(*Mulquiney 1999 Pt.3 Appendix*)
