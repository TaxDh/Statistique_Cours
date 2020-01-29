#exercice 2
X1_tilde = matrix(c(1,1,1,1,2,3,0,-1,4,8,6,2), nrow = 4, ncol = 3,byrow = FALSE)#byrow false veut dire on ne lit pas par ligne
X1_tilde #c'etait mon essai, la demo ecrivait directement la matrice

#on trouve le rang de la premiere matrice
qr(matrix(c(1,2,4,1,3,8,1,0,6,1,-1,2), ncol = 3, byrow = TRUE))$rank
#1) la matrice 4x3 est de rang3, donc de rang plein. Ainsi elle a une solution unique aux equations normales

qr(matrix(c(1,1,1,1,1,1,0,0,0,0,0,1), ncol = 3))$rank#ici elle est lu par colonne, donc pas besoin du byrow
#2) meme reponse que pour le 1)

qr(matrix(c(1,1,1,1,2,1,-3,-1,4,2,-6,-2), ncol=3))$rank
#3)Donc la matrice n'est pas de rang plein, donc elle n'a pas de solution unique aux equation normale mais une
#infinite de solutions.

#exercice 3 sur papier

#exercice 4
#b)
Y = c(78.5,74.3,104.3,87.6,95.9,109.2,102.7)
Y
X_tilde = matrix(c(rep(1,7),7,1,11,11,7,11,3,2.6,2.9,5.6,3.1,5.2,5.5,7.1), ncol = 3)
X_tilde
t(X_tilde)%*%X_tilde
t(X_tilde)%*%Y

#c)
#verification de l'inverse
solve(t(X_tilde)%*%X_tilde)

#formule page 34 pour beta chapeau
Beta_chapeau = solve(t(X_tilde)%*%X_tilde)%*%t(X_tilde)%*%Y
Beta_chapeau

#equation de regression
#Y_i = 51.57+1.49X_1 + 6.72X_2+epsilon_chapeau_i
#avec X_1 pourcentage de matiere organique
#X_2 pourcentage d'azote supplementaire dans le sol
#Y_i poid en gramme de la plante
#voir feuille


#d

#formule page 37 pour Y chapeau
Y_chapeau = X_tilde%*%Beta_chapeau
Y_chapeau
epsilon = Y - Y_chapeau
epsilon
