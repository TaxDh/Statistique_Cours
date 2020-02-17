dm log 'clear';
dm output 'clear';
dm 'odsresults; clear';

/*TP5#2*/

/*On genere les donnes aleatoirements*/

Data Ex2;
	Do Traitement = 1 to 5;
		Do J = 1 to 30;
			Reponse = exp(10+Traitement+rannor(1));/*le rannor c'est pour les residus qui suivent une loi normal*/
			output;
		end;
	end;
run;

proc glm;
	class Traitement;
	Model Reponse=Traitement;
	output out=C P=VPredites R=Residus student= Sresidus;
run;

/*avec les boxplot, il est clair qu'on va devoir faire une transformation, car les variances sont sensé etre egal, ce qui n'est vraiement pas le cas*/

/**/

proc boxplot;
	Plot Residus*Traitement;
	Plot Sresidus*Traitement;
run;

proc univariate plot normal normaltest data = C;
	Var Residus;
run;

/*les residus sont pas tres beau, va falloire faire une transformation*/

proc sgplot data=C;
	scatter y=residus x=vpredites;
run;

/*ca augmente avec le nombre de vpredites, je parle du range*/

/*pour changer les donnee*/

Data transform;
	Set Ex2;
	Logreponse=Log(Reponse);
run;

/*on verifie que boxcox fait pareil*/

Proc transreg details;
	Model boxcox (Reponse/convenient)= class(Traitement);
	output;/**data5*/
run;

proc glm data=data5;
	Class Traitement;
	Model TReponse = Traitement;
	output out =TC P=VPredites R=Residus student= Sresidus;
run;
/*c'est mieux, les variances ont l'aire bcp plus egale*/

proc univariate plot normal normaltest;
	Var Residus;
run;

proc sgplot data=TC;
	scatter y=residus x=vpredites;
run;
	
