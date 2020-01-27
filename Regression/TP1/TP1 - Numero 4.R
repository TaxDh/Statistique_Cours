#TP 1 numero 4:
#On doit tout d'abord trouver le "directory" ou le "path"
getwd()
#mon fichier Height.dat etant sur le desktop et non la ou le get le dit, on fait set("le path")
#on aurait pu aussi faire read.table("C:/Users/kf891141/Desktop/Height.dat", sep = ...)
setwd("C:/Users/kf891141/Desktop")
height = read.table('Height.dat', header = TRUE, sep = ",")
height
#tout marche (je crois) on peut commencer
#remember trouver le "tilde ~ "
#a
plot (dheight~mheight,data=height,xlab= 'taille des meres', ylab = 'taille des filles')

#b
reg_height = lm(dheight~mheight,data = height)
summary(reg_height)

#c
#borne inf
IC_inf=reg_height$coefficients[2]+qt(0.025,df=reg_height$df.residual)*summary(reg_height)$coefficients[2,2]
#borne sup
IC_sup=reg_height$coefficients[2]+qt(0.925,df=reg_height$df.residual)*summary(reg_height)$coefficients[2,2]
#fonction de R
confint(reg_height)


#d
predict(reg_height,data.frame(mheight=c(64)),interval='pred',level=0.95)

#e
#reponse: C'est pour la valeur de x = x barre (moyenne) que la valeur prédit aura la plus petite variance.
#Puisque le seul terme de la variance qui varie en fonction de x a pour numerateur x_1 = x moyenne (barre)



#f
tailleMere = seq(min(height$mheight),max(height$mheight),length = 100)
taille_DF=data.frame(mheight = tailleMere)
Iconf=predict(reg_height,taille_DF,interval = 'confidence',level=0.95)
IPredict = predict(reg_height,taille_DF, interval = 'pred', level =  0.95)
plot(dheight~mheight,data= height)
matlines(tailleMere,cbind(Iconf,IPredict[,-1]),lty=c(1,2,2,3,3), col = c('black', 'blue', 'blue','red','red'))
