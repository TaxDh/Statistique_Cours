#Devoir1_4

q4 = read.table('NBS.txt', header = TRUE)
q4

#a
plot (Y~X,data=q4, xlab= 'X', ylab = 'Y')

regq4 = lm(Y~X,data = q4)
summary(regq4)

coef(regq4)

abline(regq4)



std_residue = rstandard(regq4)
plot(q4$X,std_residue,xlab="X", ylab="residus standard")

qqnorm(rstandard((regq4)))
qqline(rstandard(regq4))

  
#borne inf
IC_inf=regq4$coefficients[2]+qt(0.025,df=regq4$df.residual)*summary(regq4)$coefficients[2,2]
#borne sup
IC_sup=regq4$coefficients[2]+qt(0.925,df=regq4$df.residual)*summary(regq4)$coefficients[2,2]
#fonction de R
confint(regq4)
