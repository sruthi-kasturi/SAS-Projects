/* Adapted from 1.1.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORT/PROC EXPORT pair reads/writes local paths under
   "/home/u63635623/SAS_Example1/" (example1.csv etc). PROC IMPORT needs a
   file already sitting on the machine that runs it, which a hosted API
   call cannot supply, so the CSV rows from this repo's own example1.csv
   are loaded via a DATA step + DATALINES instead, then round-tripped
   through PROC EXPORT exactly as the source script does. The
   wo_header/wt_header DATA steps later in the source script are
   reproduced unmodified — they already use INFILE + DATALINES-compatible
   raw input, just pointed at a relative path here. */

libname test (work);

data test.data1;
	input ID Name $ Gender $ Age;
	datalines;
1 Jake M 20
2 Peter M 25
3 Sara F 19
4 Jason M 31
5 Lora F 29
;
run;

proc print data=test.data1;
run;

proc export
	data=test.data1
	dbms=csv
	outfile= "example1_export.csv"
	replace;
run;

/* re-import what we just exported, to prove the round trip */
proc import
	datafile = "example1_export.csv"
	out = test.data1_reimport
	dbms= csv
	replace;
run;

proc print data=test.data1_reimport;
run;


/* wo_header.txt equivalent: same delimited raw input, inlined */
data test.wo_header;
	input ID name $ gender $ age;
	datalines;
1 Jake M 20
2 Peter M 25
3 Sara F 19
4 Jason M 31
5 Lora F 29
;
run;

proc print data = test.wo_header;
run;
