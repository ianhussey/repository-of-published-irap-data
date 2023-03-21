* Encoding: UTF-8.

********************** Recoding items

* CSE

RECODE CZ2 CZ9 CZ11 CZ13 CZ15 (1=5) (2=4) (3=3) (4=2) (5=1) INTO CZ2r CZ9r CZ11r CZ13r CZ15r.
EXECUTE.

*SE

RECODE ZW2 ZW5 ZW6 ZW8 ZW9 (3=0) (2=1) (1=2) (0=3) INTO ZW2r ZW5r ZW6r ZW8r ZW9r.
EXECUTE.

* Parenting dimensions

RECODE Opv_AO5 Opv_AO6 (1=5) (2=4) (3=3) (4=2) (5=1) INTO Opv_AO5r Opv_AO6r.
EXECUTE.

RECODE Opv_PsC1 Opv_PsC2 Opv_PsC3 Opv_PsC4 Opv_PsC5 Opv_PsC6 Opv_PsC7 Opv_PsC8 (1=5) (2=4) (3=3) (4=2) (5=1) 
INTO Opv_PsC1r Opv_PsC2r Opv_PsC3r Opv_PsC4r Opv_PsC5r Opv_PsC6r Opv_PsC7r Opv_PsC8r.
EXECUTE.

* Need frustration items recoded

RECODE NS_Au_F1 NS_Rel_F1 NS_Comp_F1 NS_Au_F2 NS_Rel_F2 NS_Comp_F2 NS_Au_F3 NS_Rel_F3 NS_Comp_F3 
    NS_Au_F4 NS_Rel_F4 NS_Comp_F4 (1=5) (2=4) (3=3) (4=2) (5=1) INTO NS_Au_F1r NS_Rel_F1r NS_Comp_F1r 
    NS_Au_F2r NS_Rel_F2r NS_Comp_F2r NS_Au_F3r NS_Rel_F3r NS_Comp_F3r NS_Au_F4r NS_Rel_F4r NS_Comp_F4r.
EXECUTE.

****************** Creating subscales

* Perfectionism

RELIABILITY
  /VARIABLES=PS1 PS2 PS3 PS4 PS5 PS6 PS7
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .85

RELIABILITY
  /VARIABLES=CM1 CM2 CM3 CM4 CM5 CM6 CM7 CM8 CM9
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .86

RELIABILITY
  /VARIABLES=DA1 DA2 DA3 DA4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .63

RELIABILITY
  /VARIABLES=CM1 CM2 CM3 CM4 CM5 CM6 CM7 CM8 CM9 DA1 DA2 DA3 DA4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .85

COMPUTE PSTot=MEAN(PS1, PS2, PS3, PS4, PS5, PS6, PS7).
EXECUTE.

COMPUTE CMTot=MEAN(CM1, CM2, CM3, CM4, CM5, CM6, CM7, CM8, CM9).
EXECUTE.

COMPUTE DATot=MEAN(DA1, DA2, DA3, DA4).
EXECUTE.

COMPUTE MalPerf=MEAN(CMTot, DATot).
EXECUTE.

* Contingent self-esteem

RELIABILITY
  /VARIABLES=CZ1 CZ2r CZ3 CZ4 CZ5 CZ6 CZ7 CZ8 CZ9r CZ10 CZ11r CZ12 CZ13r CZ14 CZ15r
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .89

COMPUTE CSE=MEAN(CZ1, CZ2r, CZ3, CZ4, CZ5, CZ6, CZ7, CZ8, CZ9r, CZ10, CZ11r, CZ12, CZ13r, CZ14, CZ15r).
EXECUTE.

* Need satisfaction

RELIABILITY
  /VARIABLES=AS1 AS2 AS3 AS4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .

COMPUTE AS=MEAN(AS1, AS2, AS3, AS4).
EXECUTE.

RELIABILITY
  /VARIABLES= CS1 CS2 CS3 CS4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a =.

COMPUTE CS=MEAN(CS1, CS2, CS3, CS4).
EXECUTE.

RELIABILITY
  /VARIABLES= RS1 RS2 RS3 RS4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .

COMPUTE RS=MEAN(RS1, RS2, RS3, RS4).
EXECUTE.

RELIABILITY
  /VARIABLES=AS1 AS2 AS3 AS4 CS1 CS2 CS3 CS4 RS1 RS2 RS3 RS4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .

COMPUTE NeedSat=MEAN(AS, CS, RS).
EXECUTE.

* Need frustration

RELIABILITY
  /VARIABLES=NS_Au_F1 NS_Au_F2 NS_Au_F3 NS_Au_F4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .74

COMPUTE AuFrus=MEAN(NS_Au_F1,NS_Au_F2,NS_Au_F3, NS_Au_F4).
EXECUTE.

RELIABILITY
  /VARIABLES=NS_Comp_F1 NS_Comp_F2 NS_Comp_F3 NS_Comp_F4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .79

COMPUTE CompFrus=MEAN(NS_Comp_F1,NS_Comp_F2,NS_Comp_F3, NS_Comp_F4).
EXECUTE.

RELIABILITY
  /VARIABLES=NS_Rel_F1 NS_Rel_F2 NS_Rel_F3 NS_Rel_F4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .71; without NS_Rel_F4 a = .78

COMPUTE RelFrus=MEAN(NS_Rel_F1,NS_Rel_F2,NS_Rel_F3, NS_Rel_F4).
EXECUTE.

RELIABILITY
  /VARIABLES=NS_Au_F1 NS_Au_F2 NS_Au_F3 NS_Au_F4 NS_Comp_F1 NS_Comp_F2 NS_Comp_F3 NS_Comp_F4 NS_Rel_F1 NS_Rel_F2 NS_Rel_F3 NS_Rel_F4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .84

COMPUTE NeedFrus=MEAN(AuFrus, CompFrus, RelFrus).
EXECUTE.

* Need satisfaction - Composite score

RELIABILITY
  /VARIABLES=NS_Au_S1 NS_Au_S2 NS_Au_S3 NS_Au_S4 NS_Au_F1r NS_Au_F2r NS_Au_F3r NS_Au_F4r
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

a = .79

COMPUTE AuSatTot=MEAN(NS_Au_S1,NS_Au_S2,NS_Au_S3, NS_Au_S4, NS_Au_F1r,NS_Au_F2r,NS_Au_F3r, NS_Au_F4r).
EXECUTE.

RELIABILITY
  /VARIABLES=NS_Comp_S1 NS_Comp_S2 NS_Comp_S3 NS_Comp_S4 NS_Comp_F1r NS_Comp_F2r
NS_Comp_F3r NS_Comp_F4r
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .84

COMPUTE CompSatTot=MEAN(NS_Comp_S1,NS_Comp_S2,NS_Comp_S3, NS_Comp_S4, NS_Comp_F1r,NS_Comp_F2r,
NS_Comp_F3r, NS_Comp_F4r).
EXECUTE.

RELIABILITY
  /VARIABLES=NS_Rel_S1 NS_Rel_S2 NS_Rel_S3 NS_Rel_S4 NS_Rel_F1r NS_Rel_F2r NS_Rel_F3r NS_Rel_F4r
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .80

COMPUTE RelSatTot=MEAN(NS_Rel_S1,NS_Rel_S2,NS_Rel_S3, NS_Rel_S4, NS_Rel_F1r,NS_Rel_F2r,NS_Rel_F3r, NS_Rel_F4r).
EXECUTE.

RELIABILITY
  /VARIABLES=NS_Au_S1 NS_Au_S2 NS_Au_S3 NS_Au_S4 NS_Au_F1r NS_Au_F2r NS_Au_F3r NS_Au_F4r NS_Comp_S1 NS_Comp_S2 NS_Comp_S3 NS_Comp_S4 NS_Comp_F1r NS_Comp_F2r
NS_Comp_F3r NS_Comp_F4r NS_Rel_S1 NS_Rel_S2 NS_Rel_S3 NS_Rel_S4 NS_Rel_F1r NS_Rel_F2r NS_Rel_F3r NS_Rel_F4r
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .89

COMPUTE Needs=MEAN(AuSatTot, CompSatTot, RelSatTot).
EXECUTE.

* Need desire

RELIABILITY
  /VARIABLES=Verl_Aut1 Verl_Aut2 Verl_Aut3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .66

COMPUTE AuDesire=MEAN(Verl_Aut1, Verl_Aut2, Verl_Aut3).
EXECUTE.

RELIABILITY
  /VARIABLES=Verl_Comp1 Verl_Comp2 Verl_Comp3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .58 without Verl_Comp3 .63

COMPUTE CompDesire=MEAN(Verl_Comp1, Verl_Comp2, Verl_Comp3).
EXECUTE.

RELIABILITY
  /VARIABLES=Verl_Rel1 Verl_Rel2 Verl_Rel3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .71 without Verl_Rel2 .78

COMPUTE RelDesire=MEAN(Verl_Rel1, Verl_Rel2, Verl_Rel3).
EXECUTE.

RELIABILITY
  /VARIABLES=Verl_Aut1 Verl_Aut2 Verl_Aut3 Verl_Comp1 Verl_Comp2 Verl_Comp3 Verl_Rel1 Verl_Rel2 Verl_Rel3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .78

COMPUTE NeedDesire=MEAN(AuDesire, CompDesire, RelDesire).
EXECUTE.

* Self-esteem

RELIABILITY
  /VARIABLES=ZW1 ZW2r ZW3 ZW4 ZW5r ZW6r ZW7 ZW8r ZW9r ZW10
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .81

COMPUTE Selfesteem=MEAN(ZW1, ZW2r, ZW3, ZW4, ZW5r, ZW6r, ZW7, ZW8r, ZW9r, ZW10).
EXECUTE.

* Index of autonomous functioning: Self-congruence

RELIABILITY
  /VARIABLES=SelfCongr1 SelfCongr2 SelfCongr3 SelfCongr4 SelfCongr5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .73

COMPUTE SelfCongr=MEAN(SelfCongr1, SelfCongr2, SelfCongr3, SelfCongr4, SelfCongr5).
EXECUTE.

* Parenting dimensions

RELIABILITY
  /VARIABLES=Opv_PsC1 Opv_PsC2 Opv_PsC3 Opv_PsC4 Opv_PsC5 Opv_PsC6 Opv_PsC7 Opv_PsC8
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .84

COMPUTE PCM=MEAN(Opv_PsC1, Opv_PsC2, Opv_PsC3, Opv_PsC4, Opv_PsC5, Opv_PsC6, Opv_PsC7, Opv_PsC8).
EXECUTE.

RELIABILITY
  /VARIABLES=Opv_AO1 Opv_AO2 Opv_AO3 Opv_AO4 Opv_AO5r Opv_AO6r Opv_AO7
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .81

COMPUTE AuM=MEAN(Opv_AO1, Opv_AO2, Opv_AO3, Opv_AO4, Opv_AO5r, Opv_AO6r, Opv_AO7).
EXECUTE.

RELIABILITY
  /VARIABLES=Opv_AO1 Opv_AO2 Opv_AO3 Opv_AO4 Opv_AO5r Opv_AO6r Opv_AO7
Opv_PsC1r Opv_PsC2r Opv_PsC3r Opv_PsC4r Opv_PsC5r Opv_PsC6r Opv_PsC7r Opv_PsC8r
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL.

* a = .89

COMPUTE ASM=MEAN(Opv_AO1, Opv_AO2, Opv_AO3, Opv_AO4, Opv_AO5r, Opv_AO6r, Opv_AO7,
Opv_PsC1r, Opv_PsC2r, Opv_PsC3r, Opv_PsC4r, Opv_PsC5r, Opv_PsC6r, Opv_PsC7r, Opv_PsC8r).
EXECUTE.

**********IRAP**********

COMPUTE IRAP_sat_Total=MEAN(S_Dscore1, S_Dscore2, S_Dscore3, S_Dscore4).
EXECUTE.

COMPUTE IRAP_des_Total=MEAN(D_Dscore1, D_Dscore2, D_Dscore3, D_Dscore4).
EXECUTE.

* Reliabilities: Correlation even and odd trials

CORRELATIONS
  /VARIABLES=S_DscoreOdd1 S_DscoreOdd2 S_DscoreOdd3 S_DscoreOdd4 S_DscoreEven1 S_DscoreEven2 
    S_DscoreEven3 S_DscoreEven4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=D_DscoreOdd1 D_DscoreOdd2 D_DscoreOdd3 D_DscoreOdd4 D_DscoreEven1 D_DscoreEven2 
    D_DscoreEven3 D_DscoreEven4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* Calculating discrepancies satisfaction and desire IRAPs: total scores and per trial type

COMPUTE IRAP_discr=ZIRAP_sat_Total - ZIRAP_des_Total.
EXECUTE.

COMPUTE IRAP_discr1=ZS_Dscore1 - ZD_Dscore1.
EXECUTE.

COMPUTE IRAP_discr2=ZS_Dscore2 - ZD_Dscore2.
EXECUTE.

COMPUTE IRAP_discr3=ZS_Dscore3 - ZD_Dscore3.
EXECUTE.

COMPUTE IRAP_discr4=ZS_Dscore4 - ZD_Dscore4.
EXECUTE.

* Removing the '-' to make these absolute discrepancies

* Calculating discrepancies IRAP and explicit measure of competence

COMPUTE CompSAT_discr=ZIRAP_sat_Total - ZCompSatTot.
EXECUTE.

COMPUTE CompDES_discr=ZIRAP_des_Total - ZCompDesire.
EXECUTE.

* Removing the '-' to make these absolute discrepancies

* Interactions

COMPUTE IRAP_satXdes=ZIRAP_sat_Total * ZIRAP_des_Total.
EXECUTE.

COMPUTE InteractionSATs=ZIRAP_sat_Total * ZCompSatTot.
EXECUTE.

COMPUTE InteractionDESs=ZIRAP_des_Total * ZCompDesire.
EXECUTE.

** Reliability I-score IPT: .16

***** CORRELATIONS

CORRELATIONS
  /VARIABLES=nltI IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4
CompSAT_discr CompDES_discr
 IRAP Geslacht Leeftijd PSTot CMTot DATot MalPerf CSE AuSat CompSat RelSat NeedSat 
    AuFrus CompFrus RelFrus NeedFrus AuSatTot CompSatTot RelSatTot Needs AuDesire CompDesire RelDesire 
    NeedDesire Selfesteem SelfCongr PCM AuM ASM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

**** Looking at correlation between satisfaction IRAP and other constructs, while controlling for desire IRAP.

PARTIAL CORR
  /VARIABLES=nltI IRAP_sat_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4
CompSAT_discr CompDES_discr
 IRAP Geslacht Leeftijd PSTot CMTot DATot MalPerf CSE AuSat CompSat RelSat NeedSat 
    AuFrus CompFrus RelFrus NeedFrus AuSatTot CompSatTot RelSatTot Needs AuDesire CompDesire RelDesire 
    NeedDesire Selfesteem SelfCongr PCM AuM ASM BY IRAP_des_Total
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

*** And the other way around

PARTIAL CORR
  /VARIABLES=nltI IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4
CompSAT_discr CompDES_discr
 IRAP Geslacht Leeftijd PSTot CMTot DATot MalPerf CSE AuSat CompSat RelSat NeedSat 
    AuFrus CompFrus RelFrus NeedFrus AuSatTot CompSatTot RelSatTot Needs AuDesire CompDesire RelDesire 
    NeedDesire Selfesteem SelfCongr PCM AuM ASM BY IRAP_sat_Total
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.


CORRELATIONS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4
CompSAT_discr CompDES_discr
PSTot CMTot DATot MalPerf CSE AuSat CompSat RelSat NeedSat 
    AuFrus CompFrus RelFrus NeedFrus AuSatTot CompSatTot RelSatTot Needs AuDesire CompDesire RelDesire 
    NeedDesire Selfesteem SelfCongr PCM AuM ASM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=IRAP_satXdes InteractionSATs InteractionDESs
PSTot CMTot DATot MalPerf CSE AuSat CompSat RelSat NeedSat 
    AuFrus CompFrus RelFrus NeedFrus AuSatTot CompSatTot RelSatTot Needs AuDesire CompDesire RelDesire 
    NeedDesire Selfesteem SelfCongr PCM AuM ASM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total IRAP_discr 
CompSAT_discr CompDES_discr InteractionSATs
CompSat CompFrus CompDesire
 PSTot MalPerf CSE Selfesteem SelfCongr ASM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
CompSat CompFrus CompDesire
 PSTot MalPerf CSE Selfesteem SelfCongr ASM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.



* Created a high and low competence satisfaction (explicit) group

T-TEST GROUPS=CompGROUP(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 
    D_Dscore2 D_Dscore3 D_Dscore4 IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4 
    CompSAT_discr CompDES_discr IRAP_satXdes InteractionSATs InteractionDESs PSTot CMTot DATot MalPerf 
    CSE CompSat CompFrus CompSatTot CompDesire Selfesteem SelfCongr ASM
  /CRITERIA=CI(.95).

* Created a high and low maladaptive perfectionistic group

T-TEST GROUPS=MalperfGROUP(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 
    D_Dscore2 D_Dscore3 D_Dscore4 IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4 
    CompSAT_discr CompDES_discr IRAP_satXdes InteractionSATs InteractionDESs PSTot CMTot DATot MalPerf 
    CSE CompSat CompFrus CompSatTot CompDesire Selfesteem SelfCongr ASM
  /CRITERIA=CI(.95).

* Created a high and low self-esteem group

T-TEST GROUPS=SelfesteemGROUP(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 
    D_Dscore2 D_Dscore3 D_Dscore4 IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4 
    CompSAT_discr CompDES_discr IRAP_satXdes InteractionSATs InteractionDESs PSTot CMTot DATot MalPerf 
    CSE CompSat CompFrus CompSatTot CompDesire Selfesteem SelfCongr ASM
  /CRITERIA=CI(.95).

* Created a high and low contingent self-esteem group

T-TEST GROUPS=CSEGROUP(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 
    D_Dscore2 D_Dscore3 D_Dscore4 IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4 
    CompSAT_discr CompDES_discr IRAP_satXdes InteractionSATs InteractionDESs PSTot CMTot DATot MalPerf 
    CSE CompSat CompFrus CompSatTot CompDesire Selfesteem SelfCongr ASM
  /CRITERIA=CI(.95).

* Created a high and low self-congruence group

T-TEST GROUPS=SelfCongrGROUP(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 
    D_Dscore2 D_Dscore3 D_Dscore4 IRAP_discr IRAP_discr1 IRAP_discr2 IRAP_discr3 IRAP_discr4 
    CompSAT_discr CompDES_discr IRAP_satXdes InteractionSATs InteractionDESs PSTot CMTot DATot MalPerf 
    CSE CompSat CompFrus CompSatTot CompDesire Selfesteem SelfCongr ASM
  /CRITERIA=CI(.95).


********Further analyses of IRAP-data

* Bar graphs of the different trial types

GRAPH
  /BAR(SIMPLE)=MEAN(S_Dscore1) MEAN(S_Dscore2) MEAN(S_Dscore3) MEAN(S_Dscore4)
  /MISSING=LISTWISE.

GRAPH
  /BAR(SIMPLE)=MEAN(D_Dscore1) MEAN(D_Dscore2) MEAN(D_Dscore3) MEAN(D_Dscore4)
  /MISSING=LISTWISE.

* Are the Dscores of each trial type different from 0? Only the third one isn't

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4 D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
  /CRITERIA=CI(.95).

* Do the Dscores of the different trial types differ from one another? Yes, they do. 

GLM S_Dscore1 S_Dscore2 S_Dscore3 S_Dscore4
  /WSFACTOR=factor1 4 Polynomial
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(factor1)
  /EMMEANS=TABLES(factor1) COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /WSDESIGN= factor1.

GLM D_Dscore1 D_Dscore2 D_Dscore3 D_Dscore4
  /WSFACTOR=factor1 4 Polynomial
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(factor1)
  /EMMEANS=TABLES(factor1) COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /WSDESIGN= factor1.

* Calculating split half reliability: correlation even and odd sam trial types, applying Spearman-Brown correction

*Satisfaction-IRAP

CORRELATIONS
  /VARIABLES=S_DscoreOdd1 S_DscoreOdd2 S_DscoreOdd3 S_DscoreOdd4 S_DscoreEven1 S_DscoreEven2 
    S_DscoreEven3 S_DscoreEven4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=S_DscoreOdd1 S_DscoreOdd2 S_DscoreOdd3 S_DscoreOdd4 S_DscoreEven1 S_DscoreEven2 
    S_DscoreEven3 S_DscoreEven4
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* Desire IRAP

CORRELATIONS
  /VARIABLES=D_DscoreOdd1 D_DscoreOdd2 D_DscoreOdd3 D_DscoreOdd4 D_DscoreEven1 D_DscoreEven2 
    D_DscoreEven3 D_DscoreEven4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=D_DscoreOdd1 D_DscoreOdd2 D_DscoreOdd3 D_DscoreOdd4 D_DscoreEven1 D_DscoreEven2 
    D_DscoreEven3 D_DscoreEven4
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* Calculating mean odd and even scores

COMPUTE S_DscoreOddM=MEAN(S_DscoreOdd1, S_DscoreOdd2, S_DscoreOdd3, S_DscoreOdd4).
EXECUTE.

COMPUTE S_DscoreEvenM=MEAN(S_DscoreEven1, S_DscoreEven2, S_DscoreEven3, S_DscoreEven4).
EXECUTE.

COMPUTE D_DscoreOddM=MEAN(D_DscoreOdd1, D_DscoreOdd2, D_DscoreOdd3, D_DscoreOdd4).
EXECUTE.

COMPUTE D_DscoreEvenM=MEAN(D_DscoreEven1, D_DscoreEven2, D_DscoreEven3, D_DscoreEven4).
EXECUTE.

*Satisfaction-IRAP

CORRELATIONS
  /VARIABLES=S_DscoreOddM S_DscoreEvenM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=S_DscoreOddM S_DscoreEvenM
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* Desire IRAP

CORRELATIONS
  /VARIABLES=D_DscoreOddM D_DscoreEvenM
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=D_DscoreOddM D_DscoreEvenM
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

**** Criteria IRAP

* Satisfaction IRAP

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75 and SAccTBCON3 >= 75 and SAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Desire IRAP

USE ALL.
COMPUTE filter_$=(DMedLatTBCON1 <= 
    2000 and DMedLatTBINCON1 <= 2000 and DMedLatTBCON2 <= 2000 and DMedLatTBINCON2 <= 2000 and 
    DMedLatTBCON3 <= 2000 and DMedLatTBINCON3 <= 2000 and DAccTBCON1 
    >= 75 and DAccTBINCON1 >= 75 and DAccTBCON2 >= 75 and DAccTBINCON2 >= 75 and DAccTBCON3 >= 75 and 
    DAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Both IRAPS

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and DMedLatTBCON1 <= 
    2000 and DMedLatTBINCON1 <= 2000 and DMedLatTBCON2 <= 2000 and DMedLatTBINCON2 <= 2000 and 
    DMedLatTBCON3 <= 2000 and DMedLatTBINCON3 <= 2000 and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75 and SAccTBCON3 >= 75 and SAccTBINCON3 >= 75 and DAccTBCON1 
    >= 75 and DAccTBINCON1 >= 75 and DAccTBCON2 >= 75 and DAccTBINCON2 >= 75 and DAccTBCON3 >= 75 and 
    DAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 '+
    '<= 2000 and SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and '+
    'DMedLatTBCON1 <= 2000 and DMedLatTBINCON1 <= 2000 and DMedLatTBCON2 <= 2000 an... (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

****************** ANALYSES IMPLICIT MEASURES MANUSCRIPT ******************

**** Criteria IRAP

* Satisfaction IRAP

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75 and SAccTBCON3 >= 75 and SAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Desire IRAP

USE ALL.
COMPUTE filter_$=(DMedLatTBCON1 <= 
    2000 and DMedLatTBINCON1 <= 2000 and DMedLatTBCON2 <= 2000 and DMedLatTBINCON2 <= 2000 and 
    DMedLatTBCON3 <= 2000 and DMedLatTBINCON3 <= 2000 and DAccTBCON1 
    >= 75 and DAccTBINCON1 >= 75 and DAccTBCON2 >= 75 and DAccTBINCON2 >= 75 and DAccTBCON3 >= 75 and 
    DAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Both IRAPS

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and DMedLatTBCON1 <= 
    2000 and DMedLatTBINCON1 <= 2000 and DMedLatTBCON2 <= 2000 and DMedLatTBINCON2 <= 2000 and 
    DMedLatTBCON3 <= 2000 and DMedLatTBINCON3 <= 2000 and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75 and SAccTBCON3 >= 75 and SAccTBINCON3 >= 75 and DAccTBCON1 
    >= 75 and DAccTBINCON1 >= 75 and DAccTBCON2 >= 75 and DAccTBINCON2 >= 75 and DAccTBCON3 >= 75 and 
    DAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 '+
    '<= 2000 and SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and '+
    'DMedLatTBCON1 <= 2000 and DMedLatTBINCON1 <= 2000 and DMedLatTBCON2 <= 2000 an... (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

******* Preliminary analyses

* Effect of background variables (age, gender, and education)

GLM CompSatTot CompDesire IRAP_sat_Total IRAP_des_Total PSTot MalPerf Selfesteem nltI CSE BY 
    Geslacht HAopleiding WITH Leeftijd
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(OVERALL) WITH(Leeftijd=MEAN) 
  /EMMEANS=TABLES(Geslacht) WITH(Leeftijd=MEAN) 
  /EMMEANS=TABLES(HAopleiding) WITH(Leeftijd=MEAN) 
  /EMMEANS=TABLES(Geslacht*HAopleiding) WITH(Leeftijd=MEAN) 
  /PRINT=DESCRIPTIVE ETASQ
  /CRITERIA=ALPHA(.05)
  /DESIGN=Leeftijd Geslacht HAopleiding Geslacht*HAopleiding.

DESCRIPTIVES VARIABLES=IRAP_sat_Total IRAP_des_Total CompSatTot CompDesire PSTot MalPerf Selfesteem nltI CSE
  /STATISTICS=MEAN STDDEV MIN MAX.

******* Primary analyses

* Bivariate correlations

CORRELATIONS
  /VARIABLES=IRAP_sat_Total IRAP_des_Total CompSatTot CompDesire PSTot MalPerf Selfesteem nltI CSE
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* Partial correlations between competence satisfaction IRAP and cosntructs from nomological network, controlling for explicit competence satisfaction 

PARTIAL CORR
  /VARIABLES=IRAP_sat_Total PSTot MalPerf Selfesteem nltI CSE BY CompSatTot
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

* Use data of individuals who meet IRAP criteria for at least 2 out of the 3 sets of test blocks

* All three sets (10 not usable including 2 who did not reach the test blocks)
* Satisfaction IRAP

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75 and SAccTBCON3 >= 75 and SAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Only 2 sets: combi a
* Satisfaction IRAP

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Only 2 sets: combi b
* Satisfaction IRAP

USE ALL.
COMPUTE filter_$=(SMedLatTBCON1  <= 2000 and SMedLatTBINCON1 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 
and SAccTBCON1  >= 75 and SAccTBINCON1 >= 75 and 
    SAccTBCON3 >= 75 and SAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Only 2 sets: combi c
* Satisfaction IRAP

USE ALL.
COMPUTE filter_$=(SMedLatTBCON2 <= 2000 and 
    SMedLatTBINCON2 <= 2000 and SMedLatTBCON3 <= 2000 and SMedLatTBINCON3 <= 2000 and 
    SAccTBCON2 >= 75 and SAccTBINCON2 >= 75 and SAccTBCON3 >= 75 and SAccTBINCON3 >= 75).
VARIABLE LABELS filter_$ 'Criteria(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* So, include if at least 2 sets of test blocks of the satisfaction IRAP were ok:

USE ALL.
COMPUTE filter_$=(IRAP2oktestblocks = 0).
VARIABLE LABELS filter_$ 'IRAP2oktestblocks = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Conclusion: Results are similar and the IRAP still has a low reliability

* Correlations per trial type

CORRELATIONS
  /VARIABLES=IRAP_I_Am_Competent IRAP_I_Am_Incompetent Transformed_IRAP_I_Am_Not_Competent 
    Transformed_IRAP_I_Am_Not_Incompetent
IRAP_sat_Total IRAP_des_Total CompSatTot CompDesire PSTot MalPerf Selfesteem nltI CSE
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

