(* ::Package:: *)

<<MASStoolbox`
<<XML`
SetDirectory[NotebookDirectory[]];
SetDirectory[".."];
<<util`


(* ::Title:: *)
(*SB2*)
(*Systems Biology: Simulation of Dynamic Network States*)


(* ::Section:: *)
(*Salvage pathway*)


(* ::Subsection:: *)
(*Construct model*)


(* ::Subsubsection:: *)
(*Build model*)


chemicalFormulas={m["r5p","c"]->"H9C5O8P",m["ade","c"]->"H5C5N5",m["ado","c"]->"H13C10N5O4",m["imp","c"]->"H12C10N4O8P",m["ino","c"]->"H12C10N4O5",m["hyp","c"]->"H4C5N4O",m["r1p","c"]->"H9C5O8P",m["prpp","c"]->"H8C5O14P3",m["amp","c"]->"H13C10N5O7P",m["adp","c"]->"H13C10N5O10P2",m["atp","c"]->"H13C10N5O13P3",m["phos","c"]->"HO4P",m["h","c"]->"H",m["h2o","c"]->"H2O",m["nh3","c"]->"H3N"};
rxns=str2mass/@{"vada: ado_c + h2o_c <=> ino_c + nh3_c","vade: ade_c <=> 0","vado: ado_c <=> 0","vadprt: ade_c + h2o_c + prpp_c <=> amp_c + 2 phos_c",
"vak: ado_c + atp_c <=> adp_c + amp_c","vampase: amp_c + h2o_c <=> ado_c + h_c + phos_c","vampda: amp_c + h2o_c <=> imp_c + nh3_c","vhyp: hyp_c <=> 0",
"vimpase: h2o_c + imp_c <=> h_c + ino_c + phos_c","vino: ino_c <=> 0","vnh3: nh3_c <=> 0","vphos: phos_c <=> 0","vpnpase: ino_c + phos_c <=> hyp_c + r1p_c","vprm: r1p_c <=> r5p_c",
"vprppsyn: 2 atp_c + r5p_c <=> 2 adp_c + h_c + prpp_c","vamp: amp_c <=> 0","vh: h_c <=> 0","vh2o: h2o_c <=> 0","vatpgen: adp_c + phos_c + h_c <=> atp_c + h2o_c"};
eqConstants={MASStoolbox`MASS`Keq["vak"]->1000000,MASStoolbox`MASS`Keq["vampase"]->1000000,MASStoolbox`MASS`Keq["vada"]->1000000,MASStoolbox`MASS`Keq["vampda"]->1000000,MASStoolbox`MASS`Keq["vimpase"]->1000000,MASStoolbox`MASS`Keq["vpnpase"]->0.09`,MASStoolbox`MASS`Keq["vprm"]->13.3`,MASStoolbox`MASS`Keq["vprppsyn"]->1000000,MASStoolbox`MASS`Keq["vadprt"]->1000000,MASStoolbox`MASS`Keq["vade"]->1,MASStoolbox`MASS`Keq["vado"]->1,MASStoolbox`MASS`Keq["vino"]->1,MASStoolbox`MASS`Keq["vhyp"]->1,MASStoolbox`MASS`Keq["vphos"]->1,MASStoolbox`MASS`Keq["vnh3"]->1,MASStoolbox`MASS`Keq["vatpgen"]->1000000,MASStoolbox`MASS`Keq["vh"]->1,MASStoolbox`MASS`Keq["vh2o"]->1,MASStoolbox`MASS`Keq["vamp"]->1};
ststConc=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["r5p", "c"]->0.00494`,MASStoolbox`MASS`metabolite["ade", "c"]->0.001`,MASStoolbox`MASS`metabolite["ado", "c"]->0.0012`,MASStoolbox`MASS`metabolite["imp", "c"]->0.01`,MASStoolbox`MASS`metabolite["ino", "c"]->0.001`,MASStoolbox`MASS`metabolite["hyp", "c"]->0.002`,MASStoolbox`MASS`metabolite["r1p", "c"]->0.06`,MASStoolbox`MASS`metabolite["prpp", "c"]->0.005`,MASStoolbox`MASS`metabolite["amp", "c"]->0.08672812499999999`,MASStoolbox`MASS`metabolite["adp", "c"]->0.29`,MASStoolbox`MASS`metabolite["atp", "c"]->1.6`,MASStoolbox`MASS`metabolite["phos", "c"]->2.5`,MASStoolbox`MASS`metabolite["h", "c"]->0.00006309573444801929`,MASStoolbox`MASS`metabolite["h2o", "c"]->0.99999976`,MASStoolbox`MASS`metabolite["nh3", "c"]->0.091`};
ststFluxes=#[[1]]->#[[2]]Milli Mole Liter^-1 Hour^-1&/@{"vak"->0.12`,"vampase"->0.12`,"vampda"->0.014`,"vimpase"->0.014`,"vada"->0.01`,"vpnpase"->0.014`,"vprm"->0.014`,"vatpgen"->0.148`,"vprppsyn"->0.014`,"vadprt"->0.014`,"vado"->-0.009999999999999995`,"vade"->-0.014`,"vino"->0.01`,"vhyp"->0.014`,"vamp"->0.`,"vh"->0.`,"vh2o"->-0.024000000000000007`,"vphos"->0.`,"vnh3"->0.024`};
xtrnConc=#[[1]]->#[[2]]Milli Mole Liter^-1&/@{MASStoolbox`MASS`metabolite["ado", "Xt"]->0.0012001`,MASStoolbox`MASS`metabolite["ade", "Xt"]->0.00100014`,MASStoolbox`MASS`metabolite["ino", "Xt"]->0.0009999`,MASStoolbox`MASS`metabolite["hyp", "Xt"]->0.00199986`,MASStoolbox`MASS`metabolite["phos", "Xt"]->2.5`,MASStoolbox`MASS`metabolite["nh3", "Xt"]->0.0909999`,MASStoolbox`MASS`metabolite["amp", "Xt"]->0.09540093749999999`,MASStoolbox`MASS`metabolite["h", "Xt"]->0.00006309573444801929`,metabolite[_,"Xt"]->1};
salvage=constructModel[rxns,ElementalComposition->chemicalFormulas,Parameters->Join[eqConstants,xtrnConc],InitialConditions->Join[ststConc,ststFluxes],Ignore->{m["h","c"],m["h2o","c"]},BoundaryConditions->{m["h","c"],m["h2o","c"]}];
(*setIgnore[salvage,{m["h","c"],m["h2o","c"]}]*)
(*setBoundaryConditions[salvage,{m["h","c"],m["h2o","c"]}]*)
salvagePercTuned=updateRules[calcPERC[salvage,"AtEquilibriumDefault"->100000],{rateconst["vh",True]->100000,rateconst["vade",True]->100000,rateconst["vino",True]->100000,rateconst["vhyp",True]->100000,rateconst["vnh3",True]->100000,rateconst["vphos",True]->100000,rateconst["vamp",True]->100000}];
updateParameters[salvage,salvagePercTuned];
updateNotes[salvage,defaultInitializationNotes[]];
SetDirectory[NotebookDirectory[]];
Export["../../models/SB2/salvage.m.gz",salvage]


SortBy[stripUnits@salvagePercTuned,Last]


{concSol,fluxSol}=simulate[salvage,{t,0,10000}];


plotSimulation[concSol]/.m_metabolite:>getID[m]


TableForm[List@@@FilterRules[salvage["Parameters"],_rateconst]]


\!\(\*
TagBox[
RowBox[{"(", 
TagBox[GridBox[{
{
StyleBox["\[Null]",
ShowStringCharacters->False], 
TagBox["\"\<G\>\"",
HoldForm], 
TagBox["\"\<K\>\"",
HoldForm], 
TagBox["\"\<G/K\>\"",
HoldForm], 
TagBox["\"\<k\>\"",
HoldForm]},
{
TagBox["\"\<vak\>\"",
HoldForm], "0", "1.`*^6", "0", "62.50081873325923`"},
{
TagBox["\"\<vampase\>\"",
HoldForm], "0", "1.`*^6", "0", "1.3836345337814195`"},
{
TagBox["\"\<vampda\>\"",
HoldForm], "0", "1.`*^6", "0", "0.16142403063477634`"},
{
TagBox["\"\<vimpase\>\"",
HoldForm], "0", "1.`*^6", "0", "1.4000003580835985`"},
{
TagBox["\"\<vada\>\"",
HoldForm], "0", "1.`*^6", "0", "8.33333609166758`"},
{
TagBox["\"\<vpnpase\>\"",
HoldForm], "0.048`", "0.09`", "0.533`", "12.`"},
{
TagBox["\"\<vprm\>\"",
HoldForm], "0.082`", "13.3`", "0.006`", "0.2347867752755151`"},
{
TagBox["\"\<vatpgen\>\"",
HoldForm], "0", "1.`*^6", "0", "3352.633032780616`"},
{
TagBox["\"\<vprppsyn\>\"",
HoldForm], "0", "1.`*^6", "0", "1.107034412957788`"},
{
TagBox["\"\<vadprt\>\"",
HoldForm], "0", "1.`*^6", "0", "3140.4583322004664`"},
{
TagBox["\"\<vado\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vade\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vino\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vhyp\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vamp\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vh\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vh2o\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vphos\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"},
{
TagBox["\"\<vnh3\>\"",
HoldForm], "1.`", "1.`", "1.`", "100000"}
},
GridBoxAlignment->{"Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
GridBoxDividers->{"Columns" -> {False, True, {False}, False}, "ColumnsIndexed" -> {}, "Rows" -> {False, True, {False}, False}, "RowsIndexed" -> {}},
GridBoxSpacings->{"Columns" -> {Offset[0.27999999999999997`], {Offset[0.7]}, Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {Offset[0.2], {Offset[0.4]}, Offset[0.2]}, "RowsIndexed" -> {}}],
{OutputFormsDump`HeadedRows, OutputFormsDump`HeadedColumns}], ")"}],
Function[BoxForm`e$, MatrixForm[BoxForm`e$, TableHeadings -> {{"vak", "vampase", "vampda", "vimpase", "vada", "vpnpase", "vprm", "vatpgen", "vprppsyn", "vadprt", "vado", "vade", "vino", "vhyp", "vamp", "vh", "vh2o", "vphos", "vnh3"}, {"G", "K", "G/K", "k"}}]]]\)


visualizePathways[reactions2bipartite[salvage["Reactions"]],
DirectedEdges->True,PlotStyle->{GrayLevel[0.5`],Arrowheads[.012]},
"MetaboliteRenderingFunction"->({Style[Text[StandardForm@#2,#1],
Background->Opacity[.6,White]]}&),"ReactionRenderingFunction"->({Style[Text[StandardForm@#2,#1],Larger,Background->Opacity[.6,LightGray]]}&),ImageSize->800,MultiedgeStyle->None]
