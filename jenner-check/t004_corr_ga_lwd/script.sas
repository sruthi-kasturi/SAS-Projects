/* Adapted from 3.2.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORTs read local paths ("/home/u63635623/Last Week/
   ga.xlsx" and ".../lwd.xlsx"); here rows sampled from this repo's own
   ga.xlsx and lwd.xlsx (de-identified, aggregate hormone-level and
   low-birth-weight teaching data) are inlined via DATALINES. The PROC
   CORR calls and variable lists below are unchanged from the source
   script (the plots=matrix(histogram) option is dropped since it doesn't
   change the printed correlation table this bundle pins on).

   Question 1 */

data ga;
	input Ghrelin Adipnectin;
	datalines;
1190 16.2
1300 19.4
908 15.0
689 15.7
908 15.0
1104 21.6
876 12.1
876 13.9
764 14.2
908 15.0
689 15.7
876 12.1
876 13.9
764 14.2
908 15.0
;
run;

/* Null Hypothesis: The population correlation coefficient (rho) is 0.
There is no correlation between ghrelin level and adiponectin level in women with polycystic ovarian syndrome. */
/* Alternative Hypothesis: Not null */

proc corr data=ga;
var Ghrelin Adipnectin;
run;


/* Question 2 */
data lwd;
	input headcirc gestage birthwt;
	datalines;
27 29 1360
29 31 1490
30 33 1490
28 31 1180
29 30 1200
23 25 680
22 27 620
26 29 1060
27 28 1320
25 29 830
23 26 880
26 30 1130
27 29 1140
27 29 1350
26 29 950
;
run;

/* Null Hypothesis: The population correlation coefficient (rho) is 0 and there is no correlation
between headcirc and child's gestational age (gestage), between headcirc and birth weight
(birthwt), and between gestage and birthwt. */
/* Alternative Hypothesis: Not null hypothesis. */

proc corr data=lwd;
var headcirc gestage birthwt;
run;
