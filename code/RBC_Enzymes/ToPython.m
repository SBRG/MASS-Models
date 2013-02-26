(* ::Package:: *)

(****** ToPython.mth -- Mathematica expressions into Python form *************)

(* 

ToPython[expr] 

Converts the expression expr into matlab syntax and
returns it as a String.

ToPython[expr, name] 

Returns an assignment of expr into name as a String. name can be also
a more complicated string, e.g.,

	ToPython[If[t,a,b],"function y=iffun(t,a,b)\ny"].

The special symbol Colon can be used to denote the matlab colon
operator :, and Colon[a,b] for a:b, Colon[a,b,c] for a:b:c.


WritePython[expr, file]
WritePython[expr, file, name] 

Writes the expr in matlab form into the given file. The second form
makes this an assignment into the variable name. Example:

	f = OpenWrite["file.m"]; 
	WritePython[Cos[x]-x, f, y]; 
	Close[f];

The file argument can also be a String that gives the name of the
file:

	WritePython[Cos[x]-x, "file.m", y]; 

achieves the same result as the previous example (but this limits one
expression per file).


PrintPython[expr]
PrintPython[expr, name] 

is like ToPython but instead of returning the String, it is printed on
the screen.


RulesToPython[rules] 

Where rules is the result from Solve or NSolve: converts the rules into
individual assignment statements.

*)

(* (C) 1997-1999 Harri Ojanen  
	harri.ojanen@iki.fi
	http://www.iki.fi/~harri.ojanen/ *)

(* Last modified April 2 1999 *)

BeginPackage["PythonUtils`ToPython`"]

ToPython::usage = 
"ToPython[expr]  converts the expression  expr  into matlab syntax and returns it as a String.\nToPython[expr, name]  returns an assignment of  expr  into  name as a String. name can be also a more complicated string, e.g., ToPython[If[t,a,b],\"function y=iffun(t,a,b)\\ny\"].\nThe special symbol Colon can be used to denote the matlab colon operator :, and Colon[a,b] for a:b, Colon[a,b,c] for a:b:c.\nSee also  WritePython  and  PrintPython.\nAll functions accept an optional last argument that is the maximum line width."

WritePython::usage =
"WritePython[expr, file]  or  WritePython[expr, file, name] Writes the  expr  in matlab form into the given file. The second form makes this an assignment into the variable  name.\nExample: f = OpenWrite[\"file.m\"]; WritePython[Cos[x]-x, f, y]; Close[f];\nThe file argument can also be a String that gives the name of the file: WritePython[Cos[x]-x, \"file.m\", y]; achieves the same result as the previous example (but this limits one expression per file).\nSee also  ToPython  and  PrintPython."

PrintPython::usage =
"PrintPython[expr]  or  PrintPython[expr, name]  is like  ToPython but instead of returning the String, it is printed on the screen. See also  ToPython  and  WritePython."

RulesToPython::usage =
"RulesToPython[rules] where rules is from Solve or NSolve converts the rules into individual assignment statements."

(*SetMargin::usage = "SetMargin[margin]"
RestoreMargin::usage = "RestoreMargin[]"*)


Begin["`Private`"]

WritePython[e_, file_OutputStream] :=
    (WriteString[file, ToPython[e,72]];)

WritePython[e_, file_OutputStream, name_] :=
    (WriteString[file, ToPython[e,name,72]];)	    /; (!NumberQ[name])

WritePython[e_, file_String] :=
    (Block[{f = OpenWrite[file]},
	WriteString[f, ToPython[e,72]];
	Close[f];];)

WritePython[e_, file_String, name_] :=
    (Block[{f = OpenWrite[file]},
	WriteString[f, ToPython[e,name,72]];
	Close[f];];)	    /; (!NumberQ[name])

WritePython[e_, file_OutputStream, margin_Integer] :=
    (WriteString[file, ToPython[e,margin]];)

WritePython[e_, file_OutputStream, name_, margin_Integer] :=
    (WriteString[file, ToPython[e,name,margin]];)

WritePython[e_, file_String, margin_Integer] :=
    (Block[{f = OpenWrite[file]},
	WriteString[f, ToPython[e,margin]];
	Close[f];];)

WritePython[e_, file_String, name_, margin_Integer] :=
    (Block[{f = OpenWrite[file]},
	WriteString[f, ToPython[e,name,margin]];
	Close[f];];)


PrintPython[e_] := 
    (Print[ToPython[e, 60]];)

PrintPython[e_, name_] := 
    (Print[ToPython[e, name, 60]];)	    /; (!NumberQ[name])

PrintPython[e_, margin_Integer] := 
    (Print[ToPython[e, margin]];)

PrintPython[e_, name_, margin_Integer] := 
    (Print[ToPython[e, name, margin]];)


ToPython[e_] := foldlines[ToPythonaux[e] <> ""]

ToPython[e_, name_] :=
    ToPythonaux[name] <> "=" <> foldlines[ToPythonaux[e] <> ""]   /; 
		(!NumberQ[name])

ToPython[e_, margin_Integer] :=
    Block[{s},
	SetMargin[margin];
	s = foldlines[ToPythonaux[e] <> ""];
	RestoreMargin[];
	s]

ToPython[e_, name_, margin_Integer] :=
    Block[{s},
	SetMargin[margin];
	s = ToPythonaux[name] <> "=" <> foldlines[ToPythonaux[e] <> ""];
	RestoreMargin[];
	s]


RulesToPython[l_List] :=
    If[Length[l] === 0,
	"",
	Block[{s = RulesToPython[ l[[1]] ]},
	    Do[s = s <> RulesToPython[ l[[i]] ], {i, 2, Length[l]}];
	    s]]

RulesToPython[Rule[x_, a_]]:=
	ToPython[a, ToPython[x] // StringDrop[#, -2]&] 

(*** Numbers and strings *****************************************************)

ToPythonaux[s_String] := s

ToPythonaux[n_Integer] :=
    If[n >= 0, ToString[n], "(" <> ToString[n] <> ")"]

(*ToPythonaux[r_Rational] := 
    "(" <> ToPythonaux[Numerator[r]] <> "/" <>
           ToPythonaux[Denominator[r]] <> ")"*)

ToPythonaux[r_Rational] := 
    "(" <> ToString[Numerator[r]] <> "/" <>
           ToString[Denominator[r]] <> ")"

ToPythonaux[r_Real] := 
    Block[{a = MantissaExponent[r]},
        If[r >= 0,
            ToString[N[a[[1]],18]] <> "*10**" <> ToString[a[[2]]],
            "(" <> ToString[N[a[[1]],18]] <> "*10**" <> ToString[a[[2]]] <> ")"]]

ToPythonaux[I] := "sqrt(-1)";

ToPythonaux[c_Complex] :=
    "(" <>
    If[Re[c] === 0,
        "",
        ToPythonaux[Re[c]] <> "+"] <>
    If[Im[c] === 1,
        "sqrt(-1)",
        "sqrt(-1)*" <> ToPythonaux[Im[c]] ] <> ")"


(*** Lists, vectors and matrices *********************************************)

numberMatrixQ[m_] := MatrixQ[m] && (And @@ Map[numberListQ,m])

numberListQ[l_] := ListQ[l] && (And @@ Map[NumberQ,l])

numbermatrixToPython[m_] :=
    Block[{i, s=""}, 
	For[i=1, i<=Length[m], i++,
	    s = s <> numbermatrixrow[m[[i]]];    
	    If[i < Length[m], s = s <> ";"]];
	s]

numbermatrixrow[l_] :=
    Block[{i, s=""},
	For[i=1, i<=Length[l], i++, 
	    s = s <> ToPythonaux[l[[i]]];
	    If[i < Length[l], s = s <> ","]];
	s]

ToPythonaux[l_List /; MatrixQ[l]] :=
    If[numberMatrixQ[l],
	"[" <> numbermatrixToPython[l] <> "]",
	"[" <> matrixToPython[l] <> "]"]

matrixToPython[m_] :=
    If[Length[m] === 1, 
        ToPythonargs[m[[1]]],
        ToPythonargs[m[[1]]] <> ";" <>
            matrixToPython[ argslistdrop[m] ] ]

ToPythonaux[l_List] := "[" <> ToPythonargs[l] <> "]"


(*** Symbols *****************************************************************)

ToPythonaux[Colon] = ":"
ToPythonaux[Abs] = "abs"
ToPythonaux[Min] = "min"
ToPythonaux[Max] = "max"
ToPythonaux[Sin] = "sin"
ToPythonaux[Cos] = "cos"
ToPythonaux[Tan] = "tan"
ToPythonaux[Cot] = "cot"
ToPythonaux[Csc] = "csc"
ToPythonaux[Sec] = "sec"
ToPythonaux[ArcSin] = "asin"
ToPythonaux[ArcCos] = "acos"
ToPythonaux[ArcTan] = "atan"
ToPythonaux[ArcCot] = "acot"
ToPythonaux[ArcCsc] = "acsc"
ToPythonaux[ArcSec] = "asec"
ToPythonaux[Sinh] := "sinh"
ToPythonaux[Cosh] := "cosh"
ToPythonaux[Tanh] := "tanh"
ToPythonaux[Coth] := "coth"
ToPythonaux[Csch] := "csch"
ToPythonaux[Sech] := "sech"
ToPythonaux[ArcSinh] := "asinh"
ToPythonaux[ArcCosh] := "acosh"
ToPythonaux[ArcTanh] := "atanh"
ToPythonaux[ArcCoth] := "acoth"
ToPythonaux[ArcCsch] := "acsch"
ToPythonaux[ArcSech] := "asech"
ToPythonaux[Log] := "log"
ToPythonaux[Exp] := "exp"
ToPythonaux[MatrixExp] := "expm"
ToPythonaux[Pi] := "pi"
ToPythonaux[E] := "exp(1)"
ToPythonaux[True] := "1"
ToPythonaux[False] := "0"

ToPythonaux[e_Symbol] := ToString[e]


(*** Relational operators ****************************************************)

ToPythonaux[e_ /; Head[e] === Equal] :=
    ToPythonrelop[ argslist[e], "=="]
ToPythonaux[e_ /; Head[e] === Unequal] :=
    ToPythonrelop[ argslist[e], "~="]
ToPythonaux[e_ /; Head[e] === Less] :=
    ToPythonrelop[ argslist[e], "<"]
ToPythonaux[e_ /; Head[e] === Greater] :=
    ToPythonrelop[ argslist[e], ">"]
ToPythonaux[e_ /; Head[e] === LessEqual] :=
    ToPythonrelop[ argslist[e], "<="]
ToPythonaux[e_ /; Head[e] === GreaterEqual] :=
    ToPythonrelop[ argslist[e], ">="]
ToPythonaux[e_ /; Head[e] === And] :=
    ToPythonrelop[ argslist[e], "&"]
ToPythonaux[e_ /; Head[e] === Or] :=
    ToPythonrelop[ argslist[e], "|"]
ToPythonaux[e_ /; Head[e] === Not] :=
    "~(" <> ToPythonaux[e[[1]]] <> ")"

ToPythonrelop[e_, o_] :=
    If[Length[e] === 1, 
        "(" <> ToPythonaux[e[[1]]] <> ")",
        "(" <> ToPythonaux[e[[1]]] <> ")" <> o <>
         ToPythonrelop[ argslistdrop[e], o] ]

relopQ[e_] := MemberQ[{Equal, Unequal, Less, Greater, LessEqual,
    GreaterEqual, And, Or, Not}, Head[e]]


(*** Addition, multiplication and powers *************************************)

ToPythonaux[e_ /; Head[e] === Plus] :=
    If[relopQ[e[[1]]],
        "(" <> ToPythonaux[e[[1]]] <> ")",
        ToPythonaux[e[[1]]] ] <>
    " + " <>
        If[Length[e] === 2,
            If[relopQ[e[[2]]],
                "(" <> ToPythonaux[e[[2]]] <> ")",
                ToPythonaux[e[[2]]] ],
            ToPythonaux[ dropfirst[e] ]]

ToPythonaux[e_ /; Head[e] === Times] :=
    If[Head[e[[1]]] === Plus,
        "(" <> ToPythonaux[e[[1]]] <> ")",
        ToPythonaux[e[[1]]] ] <>
    "*" <>
        If[Length[e] === 2,
            If[Head[e[[2]]] === Plus,
                "(" <> ToPythonaux[e[[2]]] <> ")",
                ToPythonaux[e[[2]]] ],
            ToPythonaux[ dropfirst[e] ]]

ToPythonaux[e_ /; Head[e] === Power] :=
    If[Head[e[[1]]] === Plus || Head[e[[1]]] === Times || Head[e[[1]]] === Power,
        "(" <> ToPythonaux[e[[1]]] <> ")",
        ToPythonaux[e[[1]]] ] <>
    "**" <>
        If[Length[e] === 2,
            If[Head[e[[2]]] === Plus || Head[e[[2]]] === Times || Head[e[[2]]] === Power,
                "(" <> ToPythonaux[e[[2]]] <> ")",
                ToPythonaux[e[[2]]] ],
            ToPythonaux[ dropfirst[e] ]]


(*** Special cases of functions **********************************************)

ToPythonaux[Rule[_,r_]] := ToPythonaux[r]

ToPythonaux[Log[10, z_]] := "log10(" <> ToPythonaux[z] <> ")"
ToPythonaux[Log[b_, z_]] :=
    "log(" <> ToPythonaux[z] <> ")/log(" <> ToPythonaux[b] <> ")"

ToPythonaux[Power[e_, 1/2]] := "sqrt(" <> ToPythonaux[e] <> ")"
ToPythonaux[Power[E, z_]] := "exp(" <> ToPythonaux[z] <> ")"

ToPythonaux[If[test_, t_, f_]] :=
    Block[{teststr = ToPythonaux[test]},
        "((" <> teststr <> ")*(" <> ToPythonaux[t] <> ")+(~("
             <> teststr <> "))*(" <> ToPythonaux[f] <> "))"]

ToPythonaux[e__ /; (Head[e] === Max || Head[e] == Min)] :=
    ToPythonaux[Head[e]] <> "(" <>
        If[ Length[e] === 2,
            ToPythonargs[e] <> ")",
            ToPythonaux[e[[1]]] <> "," <> ToPythonaux[dropfirst[e]] <> ")"]

ToPythonaux[Colon[a_,b_]] :=
    "((" <> ToPythonaux[a] <> "):(" <> ToPythonaux[b] <> "))"
ToPythonaux[Colon[a_,b_,c_]] :=
    "((" <> ToPythonaux[a] <> "):(" <> ToPythonaux[b] <> 
        "):(" <> ToPythonaux[c] <> "))"


(*** General functions *******************************************************)

ToPythonaux[e_] :=
    ToPythonaux[Head[e]] <> "(" <>
        ToPythonargs[ argslist[e] ] <> ")"

ToPythonargs[e_] :=
    If[Length[e] === 1, 
        ToPythonaux[e[[1]]],
        ToPythonaux[e[[1]]] <> "," <>
            ToPythonargs[ argslistdrop[e] ] ]


(*** Argument lists **********************************************************)

(*** argslist returns a List of the arguments ***)
argslist[e_] :=
    Block[{ARGSLISTINDEX}, Table[ e[[ARGSLISTINDEX]],
        {ARGSLISTINDEX, 1, Length[e]}]]

(*** argslistdrop returns a List of all arguments except the first one ***)
argslistdrop[e_] :=
    Block[{ARGSLISTINDEX}, Table[ e[[ARGSLISTINDEX]], 
        {ARGSLISTINDEX, 2, Length[e]}]]

(*** dropfirst is like argslistdrop but retains the original Head ***)
dropfirst[e_] :=
    e[[ Block[{i}, Table[i, {i,2,Length[e]}]] ]]


(*** Folding long lines ******************************************************)

MARGIN = 66
MARGINS = {}

SetMargin[m_] := (MARGINS = Prepend[MARGINS, MARGIN]; MARGIN = m; MARGINS)

RestoreMargin[] := 
    If[Length[MARGINS] > 0,
	MARGIN = MARGINS[[1]];
	MARGINS = Drop[MARGINS, 1]]		

foldlines[s_String] :=
    Block[{cut, sin=s, sout=""},
	While[StringLength[sin] >= MARGIN, 
	    cut = findcut[sin];
	    If[cut > 0,		
		sout = sout <> StringTake[sin,cut] <> "";
		sin = StringDrop[sin,cut],
		(* else *)
		sout = sout <> StringTake[sin,MARGIN];
		sin = StringDrop[sin,MARGIN]]];
	sout <> sin]

findcut[s_String] :=
    Block[{i=MARGIN}, 
        While[i > 0 &&
              !MemberQ[{";", ",", "(", ")", "+", "*", " "}, StringTake[s,{i}]],
            i--];
        i]

End[]

EndPackage[]

