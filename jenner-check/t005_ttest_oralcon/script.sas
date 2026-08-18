/* Adapted from 2.1.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORT reads a local path ("/home/u63635623/WEEK 4/
   OralContraceptives.xlsx"); here all 10 rows of this repo's own
   OralContraceptives.xlsx (de-identified, aggregate systolic-blood-pressure
   before/after measurements, no identifying fields) are inlined via
   DATALINES. The PROC TTEST call is unchanged from the source script.

   Population: Women taking contraceptive medication.
   Null Hypothesis: There is no difference between mean Systolic Blood
   Pressure in women who start using oral contraceptives and the mean of
   the general population.
   Alternative hypothesis: There is a difference.
   We use a paired T-test in this case. */

data oralcon;
	input id before after;
	datalines;
1 115 128
2 112 115
3 107 106
4 119 128
5 115 122
6 138 145
7 126 132
8 105 109
9 104 102
10 115 117
;
run;

proc ttest data= oralcon h0=0 sides=2;
paired after*before;
run;
