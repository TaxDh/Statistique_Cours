dm log 'clear';
dm output 'clear';
dm 'odsresults; clear';

Data Ex05_3;
	Input Traitement Compte @@;
	DataLines;
1	26d2	1	29d2	1	20d2	1	22d2	1 32d2
2	35d3	2	23d3	2	20d3	2	30d3	2 27d3
3	29d5	3	23d5	3	17d5	3	29d5	3 20d5
;
Run;

Proc BoxPlot;
	Plot Compte * Traitement;
run;

Proc Anova;
	Class Traitement;
	Model Compte = traitement;
run;

/*vu comment les boxplot sont ecrasé, on pourrait faire un une transformation log*/


/*Proc Anova Data = Ex05_3;
*/	

	
