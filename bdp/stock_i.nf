Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(stock_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(stock_i))==(Machine(stock));
  Level(Implementation(stock_i))==(1);
  Upper_Level(Implementation(stock_i))==(Machine(stock))
END
&
THEORY LoadedStructureX IS
  Implementation(stock_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(stock_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(stock_i))==(?);
  Inherited_List_Includes(Implementation(stock_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(stock_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(stock_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(stock_i))==(?);
  Context_List_Variables(Implementation(stock_i))==(?);
  Abstract_List_Variables(Implementation(stock_i))==(RequiredAmounts,Shortages,CurrentStocks);
  Local_List_Variables(Implementation(stock_i))==(?);
  List_Variables(Implementation(stock_i))==(?);
  External_List_Variables(Implementation(stock_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(stock_i))==(?);
  Abstract_List_VisibleVariables(Implementation(stock_i))==(?);
  External_List_VisibleVariables(Implementation(stock_i))==(?);
  Expanded_List_VisibleVariables(Implementation(stock_i))==(?);
  List_VisibleVariables(Implementation(stock_i))==(c_RequiredAmounts,c_Shortages,c_CurrentStocks);
  Internal_List_VisibleVariables(Implementation(stock_i))==(c_RequiredAmounts,c_Shortages,c_CurrentStocks)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(stock_i))==(btrue);
  Expanded_List_Invariant(Implementation(stock_i))==(btrue);
  Abstract_List_Invariant(Implementation(stock_i))==(CurrentStocks: 1..5 --> 0..4000 & dom(CurrentStocks) = dom(MaxStocks) & !ii.(ii: dom(CurrentStocks) => CurrentStocks(ii): 0..MaxStocks(ii)) & Shortages: FIN({1,2,3,4,5}) & !xx.(xx: Shortages => CurrentStocks(xx)<MaxStocks(xx)/2) & !xx.(xx: dom(CurrentStocks) & CurrentStocks(xx)<MaxStocks(xx)/2 => xx: Shortages) & RequiredAmounts: 1..5 --> 0..4000 & !ii.(ii: dom(RequiredAmounts) => RequiredAmounts(ii) = MaxStocks(ii)-CurrentStocks(ii)));
  Context_List_Invariant(Implementation(stock_i))==(btrue);
  List_Invariant(Implementation(stock_i))==(c_CurrentStocks: 1..5 --> 0..4000 & c_CurrentStocks = CurrentStocks & c_RequiredAmounts: 1..5 --> 0..4000 & c_RequiredAmounts = RequiredAmounts & c_Shortages: 1..5 --> BOOL & dom(c_Shortages|>{TRUE}) = Shortages & MaxStocks: 1..5 --> 0..4000)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(stock_i))==(btrue);
  Abstract_List_Assertions(Implementation(stock_i))==(btrue);
  Context_List_Assertions(Implementation(stock_i))==(btrue);
  List_Assertions(Implementation(stock_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(stock_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(stock_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(stock_i))==(c_CurrentStocks:=(1..5)*{0};c_Shortages:=(1..5)*{TRUE};c_RequiredAmounts:=MaxStocks);
  Context_List_Initialisation(Implementation(stock_i))==(skip);
  List_Initialisation(Implementation(stock_i))==(c_CurrentStocks:=(1..5)*{0};c_Shortages:=(1..5)*{TRUE};c_RequiredAmounts:=MaxStocks)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(stock_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(stock_i))==(btrue);
  List_Context_Constraints(Implementation(stock_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(stock_i))==(Put,Pop,GetShortage,GetSum,GetRequiredAmount);
  List_Operations(Implementation(stock_i))==(Put,Pop,GetShortage,GetSum,GetRequiredAmount)
END
&
THEORY ListInputX IS
  List_Input(Implementation(stock_i),Put)==(ii,amt);
  List_Input(Implementation(stock_i),Pop)==(ii,amt);
  List_Input(Implementation(stock_i),GetShortage)==(?);
  List_Input(Implementation(stock_i),GetSum)==(?);
  List_Input(Implementation(stock_i),GetRequiredAmount)==(ii)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(stock_i),Put)==(?);
  List_Output(Implementation(stock_i),Pop)==(?);
  List_Output(Implementation(stock_i),GetShortage)==(res);
  List_Output(Implementation(stock_i),GetSum)==(sum);
  List_Output(Implementation(stock_i),GetRequiredAmount)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(stock_i),Put)==(Put(ii,amt));
  List_Header(Implementation(stock_i),Pop)==(Pop(ii,amt));
  List_Header(Implementation(stock_i),GetShortage)==(res <-- GetShortage);
  List_Header(Implementation(stock_i),GetSum)==(sum <-- GetSum);
  List_Header(Implementation(stock_i),GetRequiredAmount)==(res <-- GetRequiredAmount(ii))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(stock_i),Put)==(btrue);
  List_Precondition(Implementation(stock_i),Put)==(ii: 1..5 & ii: dom(CurrentStocks) & amt: 1..4000 & CurrentStocks(ii)+amt: 0..4000 & CurrentStocks(ii)+amt<=MaxStocks(ii) & MaxStocks(ii)-(CurrentStocks(ii)+amt): 0..4000);
  Own_Precondition(Implementation(stock_i),Pop)==(btrue);
  List_Precondition(Implementation(stock_i),Pop)==(ii: 1..5 & ii: dom(CurrentStocks) & amt: 1..4000 & CurrentStocks(ii)-amt: 0..4000 & CurrentStocks(ii)-amt>=0 & CurrentStocks(ii)-amt<=MaxStocks(ii) & MaxStocks(ii)-(CurrentStocks(ii)-amt): 0..4000);
  Own_Precondition(Implementation(stock_i),GetShortage)==(btrue);
  List_Precondition(Implementation(stock_i),GetShortage)==(btrue);
  Own_Precondition(Implementation(stock_i),GetSum)==(btrue);
  List_Precondition(Implementation(stock_i),GetSum)==(btrue);
  Own_Precondition(Implementation(stock_i),GetRequiredAmount)==(btrue);
  List_Precondition(Implementation(stock_i),GetRequiredAmount)==(ii: 1..5 & ii: dom(RequiredAmounts))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(stock_i),GetRequiredAmount)==(ii: 1..5 & ii: dom(RequiredAmounts) & c_RequiredAmounts(ii): INT & ii: dom(c_RequiredAmounts) | res:=c_RequiredAmounts(ii));
  Expanded_List_Substitution(Implementation(stock_i),GetSum)==(btrue | (0: INT | sum:=0);@ii.(ii:=0;WHILE ii<5 DO (ii+1: INT & ii: INT & 1: INT | ii:=ii+1);(sum+c_CurrentStocks(ii): INT & ii: dom(c_CurrentStocks) & sum: INT & c_CurrentStocks(ii): INT | sum:=sum+c_CurrentStocks(ii)) INVARIANT ii: 0..5 & sum = SIGMA(xx).(xx: 1..ii | c_CurrentStocks(xx)) VARIANT 5-ii END));
  Expanded_List_Substitution(Implementation(stock_i),GetShortage)==(btrue | res:=c_Shortages);
  Expanded_List_Substitution(Implementation(stock_i),Pop)==(ii: 1..5 & ii: dom(CurrentStocks) & amt: 1..4000 & CurrentStocks(ii)-amt: 0..4000 & CurrentStocks(ii)-amt>=0 & CurrentStocks(ii)-amt<=MaxStocks(ii) & MaxStocks(ii)-(CurrentStocks(ii)-amt): 0..4000 | (ii: dom(c_CurrentStocks) & c_CurrentStocks(ii)-amt: INT & c_CurrentStocks(ii): INT & amt: INT | c_CurrentStocks:=c_CurrentStocks<+{ii|->c_CurrentStocks(ii)-amt});(ii: dom(c_RequiredAmounts) & MaxStocks(ii)-c_CurrentStocks(ii): INT & ii: dom(MaxStocks) & ii: dom(c_CurrentStocks) & MaxStocks(ii): INT & c_CurrentStocks(ii): INT | c_RequiredAmounts:=c_RequiredAmounts<+{ii|->MaxStocks(ii)-c_CurrentStocks(ii)});@(curr,max2).((ii: dom(c_CurrentStocks) | curr:=c_CurrentStocks(ii));(ii: dom(MaxStocks) & MaxStocks(ii)/2: INT & MaxStocks(ii): INT & 2: INT & not(2 = 0) | max2:=MaxStocks(ii)/2);(curr<max2 ==> (ii: dom(c_Shortages) | c_Shortages:=c_Shortages<+{ii|->TRUE}) [] not(curr<max2) ==> (ii: dom(c_Shortages) | c_Shortages:=c_Shortages<+{ii|->FALSE}))));
  Expanded_List_Substitution(Implementation(stock_i),Put)==(ii: 1..5 & ii: dom(CurrentStocks) & amt: 1..4000 & CurrentStocks(ii)+amt: 0..4000 & CurrentStocks(ii)+amt<=MaxStocks(ii) & MaxStocks(ii)-(CurrentStocks(ii)+amt): 0..4000 | (ii: dom(c_CurrentStocks) & c_CurrentStocks(ii)+amt: INT & c_CurrentStocks(ii): INT & amt: INT | c_CurrentStocks:=c_CurrentStocks<+{ii|->c_CurrentStocks(ii)+amt});(ii: dom(c_RequiredAmounts) & MaxStocks(ii)-c_CurrentStocks(ii): INT & ii: dom(MaxStocks) & ii: dom(c_CurrentStocks) & MaxStocks(ii): INT & c_CurrentStocks(ii): INT | c_RequiredAmounts:=c_RequiredAmounts<+{ii|->MaxStocks(ii)-c_CurrentStocks(ii)});@(curr,max2).((ii: dom(c_CurrentStocks) | curr:=c_CurrentStocks(ii));(ii: dom(MaxStocks) & MaxStocks(ii)/2: INT & MaxStocks(ii): INT & 2: INT & not(2 = 0) | max2:=MaxStocks(ii)/2);(curr<max2 ==> (ii: dom(c_Shortages) | c_Shortages:=c_Shortages<+{ii|->TRUE}) [] not(curr<max2) ==> (ii: dom(c_Shortages) | c_Shortages:=c_Shortages<+{ii|->FALSE}))));
  List_Substitution(Implementation(stock_i),Put)==(c_CurrentStocks(ii):=c_CurrentStocks(ii)+amt;c_RequiredAmounts(ii):=MaxStocks(ii)-c_CurrentStocks(ii);VAR curr,max2 IN curr:=c_CurrentStocks(ii);max2:=MaxStocks(ii)/2;IF curr<max2 THEN c_Shortages(ii):=TRUE ELSE c_Shortages(ii):=FALSE END END);
  List_Substitution(Implementation(stock_i),Pop)==(c_CurrentStocks(ii):=c_CurrentStocks(ii)-amt;c_RequiredAmounts(ii):=MaxStocks(ii)-c_CurrentStocks(ii);VAR curr,max2 IN curr:=c_CurrentStocks(ii);max2:=MaxStocks(ii)/2;IF curr<max2 THEN c_Shortages(ii):=TRUE ELSE c_Shortages(ii):=FALSE END END);
  List_Substitution(Implementation(stock_i),GetShortage)==(res:=c_Shortages);
  List_Substitution(Implementation(stock_i),GetSum)==(sum:=0;VAR ii IN ii:=0;WHILE ii<5 DO ii:=ii+1;sum:=sum+c_CurrentStocks(ii) INVARIANT ii: 0..5 & sum = SIGMA(xx).(xx: 1..ii | c_CurrentStocks(xx)) VARIANT 5-ii END END);
  List_Substitution(Implementation(stock_i),GetRequiredAmount)==(res:=c_RequiredAmounts(ii))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(stock_i))==(MaxStocks);
  Inherited_List_Constants(Implementation(stock_i))==(MaxStocks);
  List_Constants(Implementation(stock_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(stock_i))==(?);
  Context_List_Defered(Implementation(stock_i))==(?);
  Context_List_Sets(Implementation(stock_i))==(?);
  List_Own_Enumerated(Implementation(stock_i))==(?);
  List_Valuable_Sets(Implementation(stock_i))==(?);
  Inherited_List_Enumerated(Implementation(stock_i))==(?);
  Inherited_List_Defered(Implementation(stock_i))==(?);
  Inherited_List_Sets(Implementation(stock_i))==(?);
  List_Enumerated(Implementation(stock_i))==(?);
  List_Defered(Implementation(stock_i))==(?);
  List_Sets(Implementation(stock_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(stock_i))==(?);
  Expanded_List_HiddenConstants(Implementation(stock_i))==(?);
  List_HiddenConstants(Implementation(stock_i))==(?);
  External_List_HiddenConstants(Implementation(stock_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(stock_i))==(MaxStocks: 1..5 --> 0..4000 & MaxStocks = {1|->1000,2|->2000,3|->500,4|->125,5|->4000});
  Context_List_Properties(Implementation(stock_i))==(btrue);
  Inherited_List_Properties(Implementation(stock_i))==(btrue);
  List_Properties(Implementation(stock_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(stock_i))==(btrue);
  Values_Subs(Implementation(stock_i))==(MaxStocks: {1|->1000,2|->2000,3|->500,4|->125,5|->4000});
  List_Values(Implementation(stock_i))==(MaxStocks = {1|->1000,2|->2000,3|->500,4|->125,5|->4000})
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(stock_i))==(Type(c_CurrentStocks) == Mvv(SetOf(btype(INTEGER,1,5)*btype(INTEGER,0,4000)));Type(c_Shortages) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(c_RequiredAmounts) == Mvv(SetOf(btype(INTEGER,1,5)*btype(INTEGER,0,4000))));
  Operations(Implementation(stock_i))==(Type(GetRequiredAmount) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(GetSum) == Cst(btype(INTEGER,?,?),No_type);Type(GetShortage) == Cst(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)),No_type);Type(Pop) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(Put) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Constants(Implementation(stock_i))==(Type(MaxStocks) == Cst(SetOf(btype(INTEGER,1,5)*btype(INTEGER,0,4000))))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(stock_i)) == (? | ? | ? | ? | Put,Pop,GetShortage,GetSum,GetRequiredAmount | ? | ? | ? | stock_i);
  List_Of_HiddenCst_Ids(Implementation(stock_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(stock_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(stock_i)) == (c_RequiredAmounts,c_Shortages,c_CurrentStocks | ?);
  List_Of_Ids_SeenBNU(Implementation(stock_i)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(stock_i)) == (Type(MaxStocks) == Cst(SetOf(btype(INTEGER,1,5)*btype(INTEGER,0,4000))))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(stock_i)) == (Type(c_RequiredAmounts) == Mvv(SetOf(btype(INTEGER,1,5)*btype(INTEGER,0,4000)));Type(c_Shortages) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(c_CurrentStocks) == Mvv(SetOf(btype(INTEGER,1,5)*btype(INTEGER,0,4000))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(stock_i),Put, 1) == (Type(curr) == Lvl(btype(INTEGER,?,?));Type(max2) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(stock_i),Pop, 1) == (Type(curr) == Lvl(btype(INTEGER,?,?));Type(max2) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(stock_i),GetSum, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(stock_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(stock_i))==(c_CurrentStocks: POW(INTEGER*INTEGER) & c_Shortages: POW(INTEGER*BOOL) & c_RequiredAmounts: POW(INTEGER*INTEGER))
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
