dm log 'clear';
dm output 'clear';
dm 'odsresults; clear';

Libname SSd 'C:\Users\kf891141\Desktop\Statistique_Cours\Anova';

Data A;
	Set SSd.seance5-Q4;
run;
	
