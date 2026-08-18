/* Adapted from 3.1.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORT reads "/home/u63635623/WEEK 6_3.1/cat.xlsx",
   a file that isn't checked into the repo. The script's own PROC FREQ
   call spells out the schema it expects — a weighted contingency table
   with `treatment`, `Withdrawal`, and a `number` weight/count column —
   so a small mock table matching that shape is inlined via DATALINES
   here. The PROC FREQ call, WEIGHT statement, and CHISQ option are
   unchanged from the source script.

   Null hypothesis: There is no association between treatment and
   withdrawal.
   Alternative hypothesis: Not null hypothesis. */

data cat;
	length treatment $10 Withdrawal $3;
	input treatment $ Withdrawal $ number;
	datalines;
Drug Yes 18
Drug No 42
Placebo Yes 6
Placebo No 54
;
run;

proc freq data= cat;
weight number;
table treatment*Withdrawal/chisq;
run;
