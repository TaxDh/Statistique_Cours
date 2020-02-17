* Numero 4 Tp 1
Data React;
	Input Stim Temps @@;
	Datalines;
1 1.387 1 1.397 1 1.675 1 1.475 1 1.365 1 1.355 1 1.372 1 1.418 1 1.562 1 1.422 2 1.447 2 1.665 2 1.894
2 1.464 2 1.442 2 1.653 2 1.453 2 1.463 2 1.523 2 1.532
;
run;

Proc Boxplot;
	Plot Temps*Stim;
run;

Proc NPAR1WAY Wilcoxon correct=no Data=React;
	Class Stim;
	Var Temps;
	Exact wilcoxon;
run;
