dm log 'clear';
dm output 'clear';
dm 'odsresults; clear';


/*juste un copie colle de demo5.sas*/

Data Ex05_1;
    Input Drug Dosage @@ ; 
	DataLines ;
1 18.2 1 16.4 1 10.0 1 13.5 1 13.5 1 6.7 1 12.2 1 18.2 1 13.5 1 16.4
2 5.5  2 12.2 2 11.0 2 6.7  2 16.4 2 8.2 2 7.4  2 12.2 2 6.7  2 11.0
3 5.5  3 5.0  3 8.2  3 9.0  3 10.0 3 6.0 3 7.4  3 5.5  3 12.2 3 8.2
4 6.0  4 7.4  4 12.2 4 11.0 4 5.0  4 7.4 4 7.4  4 5.5  4 6.7  4 5.5
;
Run;

/*Faire un boxplot*/

Proc BoxPlot;
	Plot Dosage * Drug;
run;

/*faire une anova*/

Proc Anova;
	Class Drug;
	Model Dosage=Drug;
run;

/*verifier la normalite des residu*/


Proc Means MaxDec = 4;
	Var Dosage;
run;



Proc univariate plot NORMALTEST;
	Var residus;
Proc Reg;
	Model Index = / DW;
Run;

/*---------------*/

/*la demonstratrice*/

Proc GLM;
	Class Drug;
	Model Dosage=Drug;
	output out=Ex05_1 P=Vpredites R=Residus student=Sresidus;
run;

Proc Boxplot;
	Plot Dosage*Drug;
	Plot Residus*Drug;
	Plot Sresidus*Drug;
Run;

Proc univariate plot normal NORMALTEST data =Ex05_1;
	Var Residus;
run;
Proc sgplot data= Ex05_1;
	scatter y=residus x=vpredites;
run;

Proc Transreg details;
	Model boxcox (Dosage/convenient)=class(Drug);
	output = Hello;/*transformation de donnees*/
run;
/*on refait toute la meme chose avec de nouvelle donnees*/
Proc means data = Hello;
run;

proc glm;
	class Drug;
	model TDosage=Drug;
	output out= Ex05_1 P=Vpredites R=Residus student=Sresidus;/*j'ai pas trop compris, mais on peut appelé le out comme on veut*/
run;

proc sgplot data= Ex05_1;/*la on a besoin des residu de base, donc on prend ca*/
	scatter y=Residus x= VPredites;
run;

Proc Boxplot;
	Plot Dosage*Drug;
	Plot Residus*Drug;
	Plot Sresidus*Drug;
Run;

Proc univariate plot normal NORMALTEST data =Ex05_1;
	Var Residus;
run;

/*Donc on aurait pas eu besoin de transformation*/
