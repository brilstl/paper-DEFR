* Encoding: UTF-8.
*Author: Tobias Brils & Jasper Muis
*Date: June 2018
*Title: Preparing data for multilevel multinomial logistic regression (in STATA/R)

**** ESS 2016 file.*****
--------------------

**Download at: https://www.europeansocialsurvey.org
**or have a look at the R package: {essurvey} - https://ropensci.org/blog/2018/06/14/essurvey/


GET
       FILE='/Users/eigenaar/Desktop/ESS8e02.sav'.
       DATASET NAME $ESS2016 WINDOW=FRONT.

*0 = other partiers 
*1 = far right parties 
*2 = moderate right parties 
*3 = left-wing parties
*4 = abstainers

**1. The Netherlands.
FREQUENCIES prtvtfnl.
recode prtvtfnl 
                       (1=2) /*Peoples Party For Freedom and Democracy
                       (2=3) /*Labour Party
                       (3=1) /* Party for Freedom
                       (4=3) /*Socialist Party
                       (5=2) /*Christian Democratic Appeal
                       (6=2) /*Democrats 66
                       (7=2) /*Christian Union
                       (8=0) /*Green Left
                       (9=2) /*Reformed Political Party
                       (10=0) /*Partyof the Animals
                       (11=2) /*50Plus
                       (66=0) (ELSE=SYSMIS) 
                                                         into yall_NL.
        CROSSTABS prtvtfnl by yall_NL.

**2. Germany.
FREQUENCIES prtvede1.
recode prtvede1
                        (1=2) /*Christian Democratic Union of Germany/ Cristian Social Union of Bavaria 
                        (2=3) /*Social Democratic Party of Germany
                        (3=3) /*The Left
                        (4=0) /*Alliance '90/ The Greens 
                        (5=2) /*Free Democratic Party
                        (6=1) /*Alternative for Germany
                        (7=0) /*The Pirate Party
                        (8=1) /*National Democratic Party of Germany
                        (66=0) (ELSE=SYSMIS) 
                                                         into yall_DE.
        CROSSTABS prtvede1 by yall_DE.

**3. Austria.
FREQUENCIES prtvtbat.
recode prtvtbat
                       (1=3) /*Social Democratic Party of Austria
                       (2=2) /*Austrian People's Party
                       (3=1) /*Freedom Party of Austria
                       (4=1) /*Alliance for the Future of Austria
                       (5=0) /*The Greens - The Green Alternative
                       (6=3) /*Communist Party of Austria
                       (7=2) /*The New Austria
                       (8=0) /*The Pirate Party Austria
                       (9=2) /*Team Frank Stronach
                       (10=0) /*Other
                       (66=0) (ELSE=SYSMIS) 
                                                        into yall_AT.
        CROSSTABS prtvtbat by yall_AT.

**4. Belgium.
FREQUENCIES prtvtcbe.
recode prtvtcbe 
                        (1=0) /*Green
                        (2=2) /*Christian Democractic and Flemish
                        (3=2) /*New Flemish Alliance
                        (5=3) /*Socialist Party Different 
                        (6=3) /*Labour Party (Flanders)
                        (7=1) /*Flemish Interest
                        (8=2) /*Open Flemish Liberals and Democrats
                        (9=2) /*Humanist Democratic Centre
                        (10=0) /*Ecolo
                        (11=1) /*National Front
                        (12=2) /*Refomist Movement 
                        (13=3) /*Socialist Party
                        (14=3) /*Workers' Party
                        (15=2) /*People's Party
                        (16=0) /*Other
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_BE.
        CROSSTABS prtvtcbe by yall_BE.

** 5. Switzerland.
FREQUENCIES prtvtfch.
recode prtvtfch
                        (1=1) /*Swiss People's Party
                        (2=3) /*Socialist Party
                        (3=2) /*Radical Liberals
                        (4=2) /*Christian Democrats
                        (5=0) /*Green Party
                        (6=0) /*Green Liberal Party
                        (7=2) /*Bourgois-Democratic Party
                        (8=2) /*Evangelical People's Party
                        (9=1) /*Federal Democractic Union
                        (10=1) /*Ticino League
                        (11=3) /*Swiss Labour Party
                        (16=0) /*The Pirate Party
                        (18=0) /*Others
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_CH.
        CROSSTABS prtvtfch by yall_CH.

** 6. Czech Republic.
FREQUENCIES prtvtdcz.
recode prtvtdcz
                        (1=3) /*Communist Party of Bohemia and Moravia
                        (2=3) /*Czech Social Democratic Party
                        (3=2) /*Top09
                        (4=2) /*Ano
                        (5=2) /*Civic Democratic Party
                        (6=2) /*Christian and Democratic Party - Czechoslovak People's Party
                        (7=1) /*Dawn of Direct Democracy
                        (8=0) /*Other
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_CZ.
        CROSSTABS prtvtdcz by yall_CZ.

** 7. Denmark > not included at the time when research was conducted.

** 9. Finland
*FREQUENCIES prtvtcfi.
FREQUENCIES prtvtdfi.
recode prtvtdfi 
                      (1=2) /*National Coalition Party
                      (2=2) /*Swedisch People's Party of Finland
                      (3=2) /*Centre Party
                      (4=1) /*Finn's Party / True Finns
                      (5=2) /*Christian Democrats of Finland
                      (7=0) /*The Pirate Party
                      (10=0) /*Green League
                      (11=3) /*Social Democratic Party of Finland
                      (12=3) /*Left Alliance
                      (15=3) /*Workers' Party
                      (16=0) /*Other
                      (66=0) (ELSE=SYSMIS) 
                                                      into yall_FI.
        CROSSTABS prtvtdfi by yall_FI.

**10. France.
FREQUENCIES prtvtcfr.
recode prtvtcfr
                        (1=2) /*New Centre
                        (2=1) /*Front National
                        (3=2) /*The Radical Party
                        (4=3) /*New Anticapitalistic Party
                        (5=3) /*Workers' Struggle
                        (6=3) /*Left Front
                        (7=3) /*Radical Left Party
                        (8=2) /*Movement for France
                        (9=3) /*Socialist Party
                        (10=2) /*Movement for France
                        (11=2) /*Democratic Movement
                        (12=0) /*Europe Ecology - The Greens
                        (13=0) /*Autres Mouvements Ecologistes 
                         (14 thru 16=0) /*other
                      (66=0) (ELSE=SYSMIS) 
                                                      into yall_FR.
        CROSSTABS prtvtcfr by yall_FR.

**11. United Kingdom.
FREQUENCIES prtvtbgb.
recode prtvtbgb
                        (1=2) /*Conservative Party
                        (2=3) /*Labour Party  
                        (3=2) /*Liberal Democrats
                        (4=2) /*Scottish National Party
                        (5=0) /*Plaid Cymru (not included)
                        (6=0) /*Green Party
                        (7=1) /*UK Independence Party
                        (8=0) /*Other
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_UK.
        CROSSTABS prtvtbgb by yall_UK.
                        
**12. Hungary.
FREQUENCIES prtvtehu.
recode prtvtehu 
                        (1=1) /*Hungarian Civic Alliance
                        (2=1) /*Movement for a Better Hungary
                        (3=0) /*Politics Can Be Different
                        (4=3) /*Hungarian Socialist Party
                        (5=3) /*Hungarian Communist Party
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_HU.
        CROSSTABS prtvtehu by yall_HU.

**13. Lithuania.
*FREQUENCIES prtvalt3.
FREQUENCIES prtvblt3.
recode prtvblt3 
                       (1=3) /*Social Democratic Party of Lithuania
                       (2=2) /*Homeland Union - Lithuanian Christian Democrats
                       (3=2) /*Lithuanian Freedom Union
                       (4=2) /*Party ‘Young Lithuania’
                       (5=2) /*Nationalist Union
                       (6=1) /*Order and Justice
                       (7=0) /*Lithuanian Peasants and Greens Union 
                       (8=2) /*Liberal Movement
                       (9=3) /*Labour Party
                       (11=0) /*Lithaunian Peoples Party
                       (12=0) /*Electoral Action of Poles in Lithuania
                       (13=0) /*Lithuanian Green Party
                       (15=2) /*Lithuanian Centre Party
                       (17=0) /*Others
                       (66=0) (ELSE=SYSMIS) 
                                                        into yall_LT.
        CROSSTABS prtvblt3 by yall_LT.

**14. Norway.
FREQUENCIES prtvtbno.
recode prtvtbno 
                        (1=3) /*The Red Party
                        (2=3) /*Socialist Left Party
                        (3=3) /*Labour Party
                        (4=2) /*Liberal Party
                        (5=2) /*Christian Democratic Party
                        (6=2) /*Centre Party
                        (7=2) /*Conservative Party
                        (8=1) /*The Progress Party
                        (9=0) /*Coastal Party (not included)
                        (10=0) /*Green party (not included)
                        (11=0) /*Other
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_NO.
        CROSSTABS prtvtbno by yall_NO.

**15. Poland.
*FREQUENCIES prtvtcpl.
FREQUENCIES prtvtdpl.
recode prtvtdpl 
                        (1=1) /*Coalitions of Republic's
                        (2=1) /*Kukiz'15
                        (3=2) /*Modern Poland
                        (4=2) /*Civic Platform
                        (5=2) /*Polish Peasants Party
                        (6=1) /*Law and Justice Party
                        (7=3) /*Together Party
                        (8=3) /*United Left   
                        (9=0) /*Other
                        (66=0) (ELSE=SYSMIS) 
                                                         into yall_PL.
        CROSSTABS prtvtdpl by yall_PL.


**16. Sweden.
FREQUENCIES prtvtbse.
recode prtvtbse
                        (1=2) /*Centre Party
                        (2=2) /*Liberals
                        (3=2) /*Christian Democrats
                        (4=0) /*Green Party
                        (5=2) /*Moderate Party
                        (6=3) /*Swedish Social Democratic Party
                        (7=3) /*Left Party
                        (8=0) /*Feminist Initiative
                        (9=0) /*The Pirate Party
                        (10=1) /*Sweden Democrats
                        (11=0) /*Other
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_SE.
        CROSSTABS prtvtbse by yall_SE.


*Estonia ESS8 (2016)

FREQUENCIES prtvtfee.
recode prtvtfee 
                        (1=2) /*Eesti Reformierakond
                        (2=2) /*Eesti Keskerakond
                        (3=2) /*Erakond Isamaa ja Res Publica Liit
                        (4=3) /*Sotsiaaldemokraatlik Erakond
                        (5=0) /*Erakond Eestimaa Rohelised
                        (6=1) /*Eesti Konservatiivne Rahvaerakond
                        (9=0) /*Eesti Iseseisvuspartei
                        (10=0) /*Üksikkandidaadid või muud
                        (11=2) /*Eesti Vabaerakond
                        (12=0) /*Rahva Ühtsuse Erakond
                        (66=0) (ELSE=SYSMIS) 
                                                        into yall_EE.

CROSSTABS prtvtfee by yall_EE.



**17. Slovenia.
FREQUENCIES prtvtesi.
recode prtvtesi
                      (1=2) /*Democratic Party of Pensioners of Slovenia
                      (3=2) /*Civic Party
                      (4=3) /*New Slovenia - Christian Democrats
                      (5=3) /*Positive Slovenia
                      (6=1) /*Slovenian Democratic Party
                      (7=2) /*Slovenian People's Party
                      (8=2) /*Modern Centre Party
                      (10=2) /*Alliance of Alenka Bratušek
                      (11=3) /*United Left
                      (12=0) /*Others
                      (66=0) (ELSE=SYSMIS) 
                                                       into yall_si.
        CROSSTABS prtvtesi by yall_si.

**merge all countries, add non-voters.
COMPUTE ypart =SUM (yall_DE, yall_NL, yall_AT, yall_BE, yall_CH, yall_CZ, 
yall_FI, yall_FR, yall_UK, yall_HU, yall_LT, yall_NO, yall_PL, yall_SE, yall_EE, yall_si).

IF (abstainer =4) ypart = 4.
RECODE ypart (1 thru 4 = COPY) (else = SYSMIS) into yall.
VARIABLE LABELS yall "Grouping of far right, moderate right left-wing parties and abstainers in Europe".
VALUE LABELS yall 1"far right" 2"moderate right" 3"left-wing" 4"abstainers".
FORMATS yall (F1.0).
        FREQUENCIES yall.

**Mature and post-communist democracies


IF (cntry = "AT") or (cntry = "BE") or (cntry = "CH") or (cntry = "DE") or (cntry = "FI") 
or (cntry = "FR") or (cntry = "NL") or (cntry = "NO") or (cntry = "SE") or (cntry = "GB") 
cntrytype = 1.
IF (cntry = "CZ") or (cntry = "LT")  or (cntry = "PL") or (cntry= "SI") or (cntry= "HU") or (cntry = "EE") 
cntrytype = 2.
FORMATS cntrytype (F1.0).
VARIABLE LABELS cntrytype "Grouping the countries in mature and post-communist democracies".
VALUE LABELS cntrytype 1 'Mature democracies' 2 'Post-communist democracies'.

**Renaming and inverting perceived income variable.

FREQUENCIES hincfel hinctnta.

CORRELATIONS hincfel hinctnta.

RECODE hincfel 
                        (1=4) (2=3) (3=2) (4=1) 
                        (ELSE=SYSMIS) 
                                                            into pincome.
FORMATS pincome (F1.0).
VARIABLE LABELS pincome "Perceived income (1-4)".
VALUE LABELS pincome 1"Very difficult on present income" 
                                     2"Difficult on present income" 
                                     3"Coping on present income" 
                                     4"Living comfortably on present income".
DESCRIPTIVES pincome.

** Renaming education variable.

FREQUENCIES eisced.
RECODE eisced 
                       (1 thru 7=COPY) 
                       (ELSE=SYSMIS) 
                                                into education.
VARIABLE LABELS education "Education (1-7)".
DESCRIPTIVES education.

** Creating binomial unemployed variable.

FREQUENCIES mnactic.
RECODE mnactic 
                         (1 THRU 2=0) 
                         (3 thru 4=1) 
                         (5 thru 9= 0) 
                         (ELSE=SYSMIS) 
                                                into unemployed.
VARIABLE LABELS unemployed "Unemployment (0-1)".
VALUE LABELS unemployed 0"Employed" 1"Unemployed".
FORMATS unemployed (f1.0).
FREQUENCIES unemployed.

** Renaming and inverting Income redistribution.

FREQUENCIES gincdif.
RECODE gincdif 
                        (1=5) (2=4) (3=3) (4=2) (5=1) 
                        (ELSE=SYSMIS) 
                                                                     into inrdstrbtn.
VARIABLE LABELS inrdstrbtn "Income distribution (1-5)".
FREQUENCIES inrdstrbtn.

**authoritarian sentiments

FREQUENCIES ipfrule ipstrgv ipbhprp imptrad.


recode ipfrule 
                     (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) 
                     (else=SYSMIS) 
                                            into autsen1.
recode ipstrgv 
                     (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) 
                     (else=SYSMIS)
                                            into autsen2.
recode ipbhprp 
                        (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) 
                        (else=SYSMIS) 
                                             into autsen3.
recode imptrad 
                        (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) 
                        (else=SYSMIS) 
                                             into autsen4.

** Cronbachs Alpha

RELIABILITY /VARIABLES= autsen1 autsen2 autsen3 autsen4 /SUMMARY=TOTAL. 

** Factor analysis

FACTOR
  /VARIABLES autsen1 autsen2 autsen3 autsen4 
  /MISSING LISTWISE 
  /ANALYSIS autsen1 autsen2 autsen3 autsen4
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

**Computing authoritarian sentiments.

COMPUTE autsen=mean.2 (autsen1, autsen2, autsen3, autsen4).
VARIABLE LABELS autsen "Authoritarian sentiments (1-6)".
FREQUENCIES autsen.

**Social trust.

FREQUENCIES ppltrst pplfair pplhlp.

recode ppltrst (0 thru 10 = COPY) (else=SYSMIS) into strust1.
recode pplfair (0 thru 10 = COPY) (else=SYSMIS) into strust2.
recode pplhlp (0 thru 10 = COPY) (else=SYSMIS) into strust3.

**Cronbachs Alpha

RELIABILITY /VARIABLES= strust1 strust2 strust3 /SUMMARY=TOTAL. 

**Factor analysis

FACTOR
  /VARIABLES strust1 strust2 strust3
  /MISSING LISTWISE 
  /ANALYSIS strust1 strust2 strust3
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

**Computing social trust.

COMPUTE strust=mean.1 (strust1, strust2, strust3).
VARIABLE LABELS strust "Social trust (0-10)".
DESCRIPTIVES strust.

**Ethnic threat

FREQUENCIES imbgeco imueclt imwbcnt.

recode imbgeco 
                        (0=10) (1=9) (2=8) (3=7) (4=6) (5=5) (6=4) (7=3) (8=2) (9=1) (10=0) 
                        (else=SYSMIS) 
                                            into ethreat1.
recode imueclt 
                       (0=10) (1=9) (2=8) (3=7) (4=6) (5=5) (6=4) (7=3) (8=2) (9=1) (10=0) 
                       (else=SYSMIS) 
                                            into ethreat2.
recode imwbcnt 
                        (0=10) (1=9) (2=8) (3=7) (4=6) (5=5) (6=4) (7=3) (8=2) (9=1) (10=0) 
                        (else=SYSMIS) 
                                            into ethreat3.

**Cronbachs Alpha

RELIABILITY /VARIABLES= ethreat1 ethreat2 ethreat3 /SUMMARY=TOTAL.  

**Factor analysis

FACTOR
  /VARIABLES ethreat1 ethreat2 ethreat3
  /MISSING LISTWISE 
  /ANALYSIS ethreat1 ethreat2 ethreat3
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

** Computing the variable anti-immigration attitudes.

COMPUTE ethreat=mean.1 (ethreat1, ethreat2, ethreat3).
VARIABLE LABELS ethreat "Ethnic Threat (0-10)".
descriptives ethreat.

**Political trust, divided in national and EU.

FREQUENCIES trstprl trstlgl trstplc trstplt trstprt trstep trstun.

recode trstprl (0 thru 10 = COPY)  (else=SYSMIS) into ptrust1.
recode trstlgl (0 thru 10 = COPY)  (else=SYSMIS) into ptrust2.
recode trstplc (0 thru 10 = COPY)  (else=SYSMIS) into ptrust3.
recode trstplt (0 thru 10 = COPY)  (else=SYSMIS) into ptrust4.
recode trstprt (0 thru 10 = COPY)  (else=SYSMIS) into ptrust5.

**Cronbachs Alpha

RELIABILITY /VARIABLES= ptrust1 ptrust2 ptrust3 ptrust4
ptrust5 /SUMMARY=TOTAL.

**Factor analysis

FACTOR
  /VARIABLES ptrust1 ptrust2 ptrust3 ptrust4 ptrust5
  /MISSING LISTWISE 
  /ANALYSIS ptrust1 ptrust2 ptrust3 ptrust4 ptrust5
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

COMPUTE nat_ptrust=mean.2 (ptrust1, ptrust2, ptrust3, ptrust4, ptrust5).
VARIABLE LABELS nat_ptrust "National political trust (0-10)".
DESCRIPTIVES nat_ptrust.

**Europe

recode trstep (0 thru 10 = COPY) (else=SYSMIS) into ptrust6.
recode trstun (0 thru 10 = COPY)  (else=SYSMIS) into ptrust7.

**Cronbachs Alpha 

RELIABILITY /VARIABLES= ptrust6 ptrust7 /SUMMARY=TOTAL. 

**Factor analysis

FACTOR
  /VARIABLES ptrust6 ptrust7
  /MISSING LISTWISE 
  /ANALYSIS ptrust6 ptrust7
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

COMPUTE glo_ptrust=mean.1 (ptrust6, ptrust7).
VARIABLE LABELS glo_ptrust "Supranational political trust (0-10)".
DESCRIPTIVES glo_ptrust.

**Internal political efficacy.

FREQUENCIES actrolga cptppola.

recode actrolga (1 thru 5 = COPY) (else=SYSMIS) into inefficacy1.
recode cptppola (1 thru 5 = COPY)  (else=SYSMIS) into inefficacy2.

**Cronbachs Alpha 

RELIABILITY /VARIABLES= inefficacy1 inefficacy2 /SUMMARY=TOTAL. 

FACTOR
  /VARIABLES inefficacy1 inefficacy2
  /MISSING LISTWISE 
  /ANALYSIS inefficacy1 inefficacy2
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

** computing internal political efficacy

COMPUTE inefficacy=mean.1 (inefficacy1, inefficacy2).
VARIABLE LABELS inefficacy "Internal political efficacy (1-5)".
DESCRIPTIVES inefficacy.

**External political efficacy

FREQUENCIES psppsgva psppipla.

recode psppsgva (1 thru 5 = COPY)  (else=SYSMIS) into exefficacy1.
recode psppipla (1 thru 5 = COPY) (else=SYSMIS) into exefficacy2.

**Cronbachs Alpha 

RELIABILITY /VARIABLES= exefficacy1 exefficacy2 /SUMMARY=TOTAL.

**Factor analysis

FACTOR
  /VARIABLES exefficacy1 exefficacy2
  /MISSING LISTWISE 
  /ANALYSIS exefficacy1 exefficacy2
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.15)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

**Computing external political efficacy

COMPUTE exefficacy=mean.1 (exefficacy1, exefficacy2).
VARIABLE LABELS exefficacy "External political efficacy (1-5)".
FREQUENCIES exefficacy.

** Renaming age variable.

FREQUENCIES agea.
recode agea 
                    (14 thru 17=sysmis) 
                    (18 thru 102=copy) 
                    (999=SYSMIS) 
                                                    into age.
VARIABLE LABELS age "Age (18-102/92)".
FREQUENCIES age.

** binomial variable gender.

frequencies gndr.
recode gndr 
                   (1=0) (2=1) 
                   (else=sysmis) 
                                        into gender.
VARIABLE LABELS gender "Female (0-1)".
FORMATS gndr (F1.0).
Descriptives gender.

**Filter listwise

USE ALL.
COMPUTE filter_$= NOT SYSMIS (yall) and NOT SYSMIS (pincome) and NOT SYSMIS (education)
and NOT SYSMIS (unemployed) and NOT SYSMIS (inrdstrbtn) and NOT SYSMIS (strust) and NOT SYSMIS (ethreat) 
and NOT SYSMIS (nat_ptrust) and NOT SYSMIS (glo_ptrust) and NOT SYSMIS (inefficacy)
and NOT SYSMIS (exefficacy) and NOT SYSMIS (autsen) and NOT SYSMIS (age) and NOT SYSMIS (gender).
FILTER BY filter_$.
EXECUTE.
Filter off.

**Selecting countries

Select IF (cntry = "AT") or (cntry = "BE") or (cntry = "CH") or (cntry = "DE")
or (cntry = "FI") or (cntry = "FR") or (cntry = "EE")
or (cntry = "NL") or (cntry = "NO") or (cntry = "SE") or (cntry = "CZ")
or (cntry = "PL") or (cntry= "SI") or (cntry= "HU") or (cntry="GB") or (cntry="LT").

** Save preproccesed file

SAVE OUTFILE= '/Users/eigenaar/Desktop/ESS MERGE/ESS8M.sav'
    /KEEP = essround cntry cntrytype yall pincome education unemployed inrdstrbtn autsen
                 ethreat nat_ptrust glo_ptrust exefficacy age gender prtvtehu prtvtdpl
    /COMPRESSED.
