/* Adapted from 1.3.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORTs read local paths ("/home/u63635623/WEEK 3/
   est1.csv" and ".../wiedat2b.csv"); here a balanced sample of rows from
   this repo's own est1.csv and wiedat2b.csv (de-identified, aggregate
   diagnostic-marker teaching data — d/y1/y2 only, no identifying fields)
   is inlined via DATALINES. All PROC steps and options below are
   unchanged from the source script. */

data lab_3;
	input d y1 y2;
	datalines;
0 1 1
0 0 1
0 1 0
0 0 0
0 1 1
0 1 1
0 1 1
0 1 1
0 1 1
0 1 1
1 1 1
1 0 1
1 1 0
1 0 0
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
;
run;

/*freq*/
proc freq
      data = lab_3 order = data;
      table d y1 y2;
run;
/*senstivity and specficity of y1*/
proc freq
      data = lab_3 order = data;
      table y1*d/senspec;
run;
/*senstivity and specficity of y2*/
proc freq
      data = lab_3 order = data;
      table y2*d/senspec;
run;

/* PRACTICE 2 */

data Pancreatic_cancer;
	input y1 y2 d;
	datalines;
28 13.3 0
15.5 11.1 0
8.2 16.7 0
3.4 12.6 0
17.3 7.4 0
15.2 5.5 0
32.9 32.1 0
11.1 27.2 0
87.5 6.6 0
16.2 9.8 0
2.4 79.1 1
719 31.4 1
2106.667 15 1
24000 77.8 1
1715 25.7 1
3.6 11.7 1
521.5 8.25 1
1600 14.95 1
454 8.7 1
109.7 14.1 1
;
run;

/*descriptive statistics*/
proc means
    data = Pancreatic_cancer maxdec = 2;
    class d;
    var y1 y2;
run;
/*ROC curve*/
proc logistic data = Pancreatic_cancer;
    model d(event="1")= y1 y2/nofit;
    roc 'CA19-9' y1;
    roc 'CA125' y2;
run;

/*mean confidence interval*/
proc means
    data = Pancreatic_cancer clm maxdec = 2;
    var y1 y2;
run;
proc means
    data = Pancreatic_cancer clm maxdec = 2;
    class d;
    var y1 y2;
run;
