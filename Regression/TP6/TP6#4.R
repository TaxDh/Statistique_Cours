#TP6#4

ex4=read.table('CH06PR09.txt',header = TRUE)
ex4
#a

#1ere facon
reg_ex4=lm(Y~X1+X3+X2,data=ex4)#l'ordre est important, x1 sachant
anova(reg_ex4)
#2e facon
reg2=lm(Y~X1+X3,data=ex4)#modele reduit
anova(reg2,reg_ex4)
#3e facon
pf(summary(reg_ex4)$coefficient[4,3]^2,1,48,lower.tail = FALSE)


#c

reg_c1= lm(Y~X1+X2+X3,data=ex4)
reg_c2 = lm(Y~X2+X1+X3,data=ex4)
sum(anova(reg_c1)$'Sum Sq'[1:2])
sum(anova(reg_c2)$'Sum Sq'[1:2])

anova(reg_c1)

anova(reg_c2)
