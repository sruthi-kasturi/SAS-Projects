/* Adapted from 1.2.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORT reads a local path
   ("/home/u63635623/WEEK 2/lowbwt0.csv"); here the same rows from this
   repo's lowbwt0.csv (a de-identified, aggregate low-birth-weight teaching
   dataset — sbp/sex only, no identifying fields) are inlined via DATALINES
   so the bundle is self-contained. All PROC steps and options below are
   unchanged from the source script. */

data data1;
	input sbp sex;
	datalines;
43 1
51 1
42 0
39 0
48 0
31 1
31 1
40 0
57 0
64 0
46 0
47 0
63 0
56 0
49 1
87 1
46 0
66 0
42 0
52 0
;
run;

/* Univariate  is procedure that produces moments, basic statistical measures, quantiles, tests for locations, and extreme obs. */
PROC UNIVARIATE DATA=data1;
VAR sbp sex;
RUN;

/* Means function gives mean of the dataset, while adding median gives the median.  */
proc means data=data1 n nmiss median mean maxdec=2;
class sex;
var sbp;
run;

/* Frequency function is used to identify the trends in the dataset. To check how many times a value repeats. */
proc freq data=data1;
table sex;
run;

/* Through Format function, we can alter the names of the variables. Here we assign Female to 0 and Male to 1. */
proc format;
value sex 0 ="Female" 1 ="Male";
run;
proc means data=data1;
class sex;
var sbp;
format sex sex.;
run;
proc freq data=data1;
table sex;
format sex sex.;
run;
