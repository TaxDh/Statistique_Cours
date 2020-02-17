/*TP #3*/
/*Question 4*/
/*On va utiliser les donnees de demo3_ex4.sas*/

/*Je l'ai copie du fichier SAS*/
Data A;
Input treat $  lifespan @@ ;
Datalines ;
             0                 35
             0                 37
             0                 49
             0                 46
             0                 63
             0                 39
             0                 46
             0                 56
             0                 63
             0                 65
             0                 56
             0                 65
             0                 70
             0                 63
             0                 65
             0                 70
             0                 77
             0                 81
             0                 86
             0                 70
             0                 70
             0                 77
             0                 77
             0                 81
             0                 77
         1preg                 40
         1preg                 37
         1preg                 44
         1preg                 47
         1preg                 47
         1preg                 47
         1preg                 68
         1preg                 47
         1preg                 54
         1preg                 61
         1preg                 71
         1preg                 75
         1preg                 89
         1preg                 58
         1preg                 59
         1preg                 62
         1preg                 79
         1preg                 96
         1preg                 58
         1preg                 62
         1preg                 70
         1preg                 72
         1preg                 75
         1preg                 96
         1preg                 75
       1virgin                 46
       1virgin                 42
       1virgin                 65
       1virgin                 46
       1virgin                 58
       1virgin                 42
       1virgin                 48
       1virgin                 58
       1virgin                 50
       1virgin                 80
       1virgin                 63
       1virgin                 65
       1virgin                 70
       1virgin                 70
       1virgin                 72
       1virgin                 97
       1virgin                 46
       1virgin                 56
       1virgin                 70
       1virgin                 70
       1virgin                 72
       1virgin                 76
       1virgin                 90
       1virgin                 76
       1virgin                 92
         8preg                 21
         8preg                 40
         8preg                 44
         8preg                 54
         8preg                 36
         8preg                 40
         8preg                 56
         8preg                 60
         8preg                 48
         8preg                 53
         8preg                 60
         8preg                 60
         8preg                 65
         8preg                 68
         8preg                 60
         8preg                 81
         8preg                 81
         8preg                 48
         8preg                 48
         8preg                 56
         8preg                 68
         8preg                 75
         8preg                 81
         8preg                 48
         8preg                 68
       8virgin                 16
       8virgin                 19
       8virgin                 19
       8virgin                 32
       8virgin                 33
       8virgin                 33
       8virgin                 30
       8virgin                 42
       8virgin                 42
       8virgin                 33
       8virgin                 26
       8virgin                 30
       8virgin                 40
       8virgin                 54
       8virgin                 34
       8virgin                 34
       8virgin                 47
       8virgin                 47
       8virgin                 42
       8virgin                 47
       8virgin                 54
       8virgin                 54
       8virgin                 56
       8virgin                 60
       8virgin                 44
;
Run;

/*exercice b*/

/*
la demo a fait : (ce sont les contrates qu'elle a choisit), je crois qu'ils sont deja fait dans le data
1	0 vs reste
2	dispo vs non dispo
3	1 vs 8
4 	1 dispo vs 1 non dispo (dispo = virgin je crois)
5 	1 preg vs 8 preg
*/

/*
Ordre:
-male tout seul
-mal avec 1 mouche enceinte
-male avec 1 mouche pas enceinte
-male avec 8 mouches enceintes
-male avec 8 mouches pas enceintes
*/

/*exercice a*/
Proc Anova;
	Class treat;
	Model lifespan=treat;
run;
/*vu que (Pr >f) < 0.05, ca veut dire qu'on peut rejeter l'hypothese nulle et qu'il y a au moins un contraste qui a une longevite (moyenne) differente */

/*exercice b*/
Proc Glm;
	Class treat;
	Model lifespan=treat;
	Estimate '0 vs reste' treat 4 -1 -1 -1 -1;
	Estimate 'dispo vs non dispo' treat 0 -1 1 -1 1;/*0 car on se fout des male pas de femelle*/
	Estimate '1 vs 8' treat 0 1 1 -1 -1;
	Estimate '1 dispo vs 1 non dispo' treat 0  1 -1 0 0;
	Estimate '1 enceinte vs 8 enceintes' treat 0 1 0 -1 0;
run;
	
