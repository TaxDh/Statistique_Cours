#Exercice 1

q1 = read.table('CH06PR05.txt', header = TRUE)
q1

#a)matrice de nuage de points
pairs(~Y+X1+X2, data = q1, main = "matrice de nuage de points")
#matrice de correlation?
cor(cbind(q1$Y, q1$X1, q1$X2))

#la demonstratrice pour le a)
pairs(q1)
cor(q1)

#je sais pas trop ou je suis rendu
#b
reg_q1 = lm(Y ~., data = q1)#lm(Y ~ X1 + X2, data = q1)
summary(reg_q1)
#interpretation, si la douceur est fixe, on augmente l'humidite de 1 unite, alors les gens vont trouver plus doux de 4

#c
plot(reg_q1$residuals)
plot(q1$X1,rstandard(reg_q1))
abline(h=0)
#les residus ont l'air bien distribuer
plot(q1$X2,rstandard(reg_q1))
abline(h=0)
#ils ont l'air autant distribué en haut en bas, "pas trop mal"
qqnorm(rstandard((reg_q1)))
qqline(rstandard(reg_q1))
#ca l'air de suivre la loi normal, donc on reste sur ce modele

#d

summary((reg_q1))

#e
#la p-valeur est de 2.658e-09 dans le summary

#f
CI = confint(reg_q1, level = 1-0.01/2)#diviser par le nombre de variables, donc 2 ou 6, c'est pas clair
CI
#Aucun des beta il y a 0, donc ils sont different de 0 avec une erreur globale de 1%

#g

summary(reg_q1)$r.squared

#h

(cor(q1$Y,reg_q1$fitted.values))^2  #formule du cours
#identique a g

#i

predict(reg_q1,data.frame(X1=5, X2=4),interval = 'confidence', level = 0.99)
#on peut aussi le faire a la main..

X=model.matrix((reg_q1))
sigma2_yhat=c(1,5,4)%*%solve(t(X)%*%X)%*%c(1,5,4)*(2.693^2)
bi=predict(reg_q1,data.frame(X1=5,X2=4))-qt(0.995,13)*sqrt(sigma2_yhat)
bs=predict(reg_q1,data.frame(X1=5,X2=4))+qt(0.995,13)*sqrt(sigma2_yhat)
bi
bs

#j
#on peut le faire a la main ou juste avec predict, ici on le fait juste avec predict

predict(reg_q1, data.frame(X1=5,X2=4),interval = 'prediction',level=0.99)
