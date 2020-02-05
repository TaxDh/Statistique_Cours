#TP4
getwd()
setwd("C:/Users/kf891141/Desktop/Statistique_Cours/Regression/TP4")
#Exo 3
#b)

demo4b = read.table('Demo4_ex3.txt',header = TRUE)
Y=matrix(demo4b[,1],ncol=1)
X=as.matrix(cbind(rep(1,9),demo4b[,-1]))
P=round(X%*%solve(t(X)%*%X)%*%t(X),3)
Jsn=matrix(demo4b = 1/9, nrow=9, ncol=9)

#On peut calculer
t(Y)%*%P%*%Y
#faire le reste a la maison....

#c) 
demo4c = read.table('Demo4_ex3_c.txt', header = TRUE)
predict(lm(Y~., data =demo4b),demo4c,level=0.95, interval = 'confidence')

predict(lm(Y~.,data = demo4b),demo4c, level=1,0.05/7, interval = 'confidence')

#on calcul W, on a p'=6, n=9 et alpha =0.05

W_carre=6*qf(0.95,6,3)
W=sqrt(W_carre)
EC= predict(lm(Y~.,data=demo4b),demo4c,se.fit=TRUE)$se.fit
borne_inf=predict(lm(Y~.,data=demo4b),newdata = demo4c)-W*EC
borne_sup=predict(lm(Y~.,data=demo4b),newdata = demo4c)+W*EC

cbind(borne_inf,borne_sup)
