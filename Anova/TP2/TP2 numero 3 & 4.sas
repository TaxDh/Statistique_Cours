dm log 'clear';
dm output 'clear';

/*TP numero 2
numero 3*/
Data A;
	Input Regime Poids @@;
	Datalines;

1 3.52 1 3.36 1 3.57 1 4.19 1 3.88 1 3.76 1 3.94
2 3.47 2 3.73 2 3.38 2 3.87 2 3.69 2 3.51 2 3.35 2 3.64
3 3.54 3 3.52 3 3.61 3 3.76 3 3.65 3 3.51
4 3.74 4 3.83 4 3.87 4 4.08 4 4.31 4 3.98 4 3.86 4 3.71
;
run;

/*On realise l'anova*/
Proc ANOVA;
	Class Regime;
	Model Poids=Regime;
run;

/*
H_0 : Toute les moyennes des traitementws sont egales mu1 = mu2 = mu3 = mu4
H_1 : Il existe au moins un regime qui donne un poids different
P_value < 5%, on rejette H_0
*/

/*Exercice 4*/

Data B;
	Do I=1 to 2;
		Traitement = I;
		Do J=1 to 10;
			Reponse = (10+I)+RanNor(1)*0.5;
			Output;
		End;
	End;
run;

/*a)*/

Proc ANOVA;
	Class Traitement;
	Model reponse = Traitement;
run;

/*b)*/

Proc TTest;
	Class Traitement;
	Var reponse;
run;

/*c)*/

/*
Les p-valeurs sont les meme et (pooled/valeur du test t )^2 = F, on rejette H0
*/

/*Exercice 5*/

Data C;
	Do I = 1 to 4;
		Traitement = I;
		Do j=1 To 10;
			Reponse = (9+I) + RanNor(1);
			output;
		End;
	End;
run;

/*a*/
Proc ANOVA;
	Class Traitement;
	Model Reponse=Traitement;
run;

/*b*/

Data D;
	Do I = 1 to 4;
		Traitement = I;
		Do j=1 To 10;
			Reponse = (9+I) + RanNor(1)*I*2;
			output;
		End;
	End;
run;	

Proc ANOVA;
	Class Traitement;
	Model Reponse=Traitement;
run;

/*c*/

Data E;
	Do I = 1 to 4;
		Traitement = I;
		Do j=1 To 10;
			Reponse = (9+I) + RanNor(1)*4;
			output;
		End;
	End;
run;	

Proc ANOVA;
	Class Traitement;
	Model Reponse=Traitement;
run;
/*a partir de fois 4, Pr > F = 0.0565, donc plus grand que 5%, elle n'est plus robuste, elle n'est plus significative*/


/*Lorsque l'erreur aleatoire (sigma^2) devient plus importante que l'effet du traitement, il devient impossible de la differencier.
Le test de difference des moyenne n'est alors plus significatif*/

/*d*/

Data F;
	Do I = 1 to 4;
		Traitement = I;
		Do j=1 To 5; /*On diminue le 10*/
			Reponse = (9+I) + RanNor(1);
			output;
		End;
	End;
run;	

Proc ANOVA;
	Class Traitement;
	Model Reponse=Traitement;
run;
/*En diminuant le nombre de rats de 10 a 5, on augmente la valeur de p*/

