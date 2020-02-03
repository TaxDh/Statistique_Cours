/*TP4*/

/*Exercice 2*/
dm log 'clear';
dm output 'clear';
dm 'odsresults; clear';/*Pour clear le viewer*/

Data Productivite;
	Input Amelioration DepenseRD $  @@;
	Datalines;
	7.6 faible 8.2 faible 6.8 faible 5.8 faible 6.9 faible 6.6 faible 6.3 faible 7.7 faible 6.0 faible
	6.7 modere 8.1 modere 9.4 modere 8.6 modere 7.8 modere 7.7 modere 8.9 modere 7.9 modere 8.3 modere
	8.7 modere 7.1 modere 8.4 modere 8.5 eleve 9.7 eleve 10.1 eleve 7.8 eleve 9.6 eleve 9.5 eleve
	;
	Run;
Proc Print;
	Run;


/*	a)	*/

Proc Anova;
	Class DepenseRD;
	Model Amelioration=DepenseRD;
Run;

/*Si la p valeur est plus petite que 5% on rejette H0 et la elle est plus petite que 5 %*/



/*	b)	*/

Proc glm;
	Class DepenseRD;
	Model Amelioration=DepenseRD;
	Means DepenseRD / Tukey CLDIFF  alpha=0.1;
run;

/*La conclusion: on voit que la difference des mu n'appartient pas a 0, donc il y a une difference (interval de confiance*/

/*	c)	*/
	

/*
on a 3 traitements (faible-modere-eleve), 3 comparaisons par paire ((3x2)/2), B = t_(1- 0.1/2x3, 24) a peu pres = 2.257749
Alors que T = (9(1-ksi)(g,N-g))/Sqrt(2) = 9_(0.10,3,24)/Sqrt(2) app = 2.154636
donc T < B, Donc T plus efficace.
*/




/*Exercice 3*/
/*	https://online.stat.psu.edu/stat505/lesson/8/8.7	*/

/*on accede on donnee fournis (demo4.sas...)*/

Libname SSd 'C:\Users\kf891141\Desktop\Statistique_Cours\Anova';
Data A;
	Set SSd.Demo4;
run;
/*	a)	*/
Proc Anova;
	Class Traitement;
	Model Reponse = Traitement;
Run;
/*	b)	*/
Proc glm;
	Class Traitement;
	Model Reponse = Traitement;
	contrast ' stadard vs placebo' Traitement 1 -1 0 0 0 0;
	contrast 'placebo vs nouvelle dose 1' Traitement 0 1 -1 0 0 0;
	contrast 'nouvelle dose 1 vs d2,d3,d4' Traitement 0 0 -3 1 1 1;
Run;
/*	c)	*/
Proc glm;
	Class Traitement;
	Model Reponse = Traitement;
	contrast 't1,t2,t3 vs t4,t5,t6' traitement -1 -1 -1 1 1 1;
	contrast 't4 vs t5,t6' traitement 0 0 0 2 -1 -1;
	contrast 't5 vs t6' traitement 0 0 0 0 1 -1;
	contrast ' t1,t2 vs t3' traitement 1 1 -2 0 0 0 0;
	contrast ' t1 vs t2' traitement 1 -1 0 0 0 0;
Run;
/*	d)	*/
Proc anova;
	Class Traitement;
	Model Reponse = Traitement;
	Means Traitement / LSD Tukey;
Run;

/*	e)	*/

Proc anova;
	Class Traitement;
	Model Reponse = Traitement;
	Means Traitement / LSD Tukey alpha = 0.2;
Run;

Proc anova;
	Class Traitement;
	Model Reponse = Traitement;
	Means Traitement / LSD Tukey alpha = 0.00001;
Run;
