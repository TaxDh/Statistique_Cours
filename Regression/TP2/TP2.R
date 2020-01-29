#On definie la matrice X en R
#X = matrix(c(1,1,1,1,1,1,1,1,0.2,0.4,0.6,0.8,0.2,0.4,0.6,0.8,0,0,0,0,0.1,0.1,0.1,0.1))
X= matrix(c(rep(1,8), rep(c(0.2,0.4,0.6,0.8),2),rep(0,4),rep(0.1,4)),nrow=8)
Y=matrix(c(242,240,236,230,239,238,231,226),nrow=8)
X
Y
#Question a
XtX=t(X)%*%X
# %*% est la multiplication matricielle
XtX
XtY=t(X)%*%Y
XtY
#On verifie que l'element (2,2) de X'X est bien la somme des carree de la 2e colonne de X
XtX[2,2] == sum((X[,2])^2)
#L'autre pour l'element (2,3)
XtX[2,3] == sum(X[,2]*X[,3])
#La ca marche, mais la demonstratrice semble etre contre le == dans R...

#pour mieux voir une matrice, on peut creer une image avec View(X), ou X est la matrice
View(X)

#La derniere question du a...Si j'ai bien compris c'est de l'essai erreur
sum(X[,1]*Y) == XtY[1]
#On fait toutes les sommes et multiplication possible, pour trouver toutes les XtY[i]==, i= 1,2,3

#question b
#pour le rang, on peut utiliser la fonction qr(X) ou qr(X)$rank
qr(X)
qr(X)$rank

qr(XtX)$rank

#question c

solve(XtX) #c'est l'inverse d'une matrice dans R

qr(solve(XtX))$rank

XtX %*% solve(XtX)
round(XtX %*% solve(XtX),2)

#question d
P= X%*%solve(XtX)%*%t(X)
round(P%*%P - P)
sum(diag(P))
qr(P)$rank

