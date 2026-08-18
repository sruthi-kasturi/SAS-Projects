/* Adapted from 2.2.sas (SAS-Data-Analysis-Toolkit).
   The original PROC IMPORT reads "/home/u63635623/WEEK 5_2.2/fev.xlsx",
   a file that isn't checked into the repo. The script's own comments spell
   out the schema it expects — a `center` classification variable with
   three levels (Johns Hopkins, Rancho Los Amigos, St. Louis) and an `fev`
   (forced expiratory volume, 1 second) response — so a small mock sample
   matching that shape is inlined via DATALINES here. The PROC ANOVA calls,
   options, and hypothesis being tested are unchanged from the source
   script.

   Null Hypothesis: There is no difference between forced expiratory
   volume in 1 second between the 3 centers: Johns Hopkins; Rancho Los
   Amigos; St. Louis.
   Alternative hypothesis: There is a difference between at least one of
   the 3 centers.
   We use ANOVA in this case. */

data fev;
	length center $20;
	input center $ fev;
	datalines;
JohnsHopkins 2.8
JohnsHopkins 3.1
JohnsHopkins 2.6
JohnsHopkins 3.4
JohnsHopkins 2.9
RanchoLosAmigos 3.3
RanchoLosAmigos 3.0
RanchoLosAmigos 3.6
RanchoLosAmigos 2.9
RanchoLosAmigos 3.2
StLouis 2.5
StLouis 2.7
StLouis 2.4
StLouis 2.9
StLouis 2.6
;
run;

proc anova data=fev;
class center;
model fev=center;
means center/hovtest;
run;
