#TP6 numero1

prostate = read.table('CancerProstate.txt', header = TRUE)

#a

reg=lm(Y~.,data=prostate)#on ajuste la droite de regression
summary(reg)

#b voir papier

#c

plot(reg$fitted.values,rstandard(reg))
#c'est pas tres centré, ca a une forme de cone et forme de cone il faut generalement faire une transformation
#logarithmique

#d
library(MASS)
transf=boxcox(reg)
#on va avoir un lambda exacte
logY=log(prostate$Y)
newprostate=data.frame(logY=logY,x1=prostate$X1, X2=prostate$X2)
reg_log=lm(logY~.,data=newprostate)
summary(reg_log)

plot(reg_log$fitted.values,rstandard((reg_log)))
#c'est mieux, pas de cone, plus d'homocédasticité