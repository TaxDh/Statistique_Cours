#question 5 du devoir 1

q5 = read.table('Menages.txt', header = TRUE)
q5

#a
pairs(~Y+X1+X2+X3, data = q5, main = "matrice de nuage de points")

reg_q5 = lm(Y ~., data = q5)
summary(reg_q5)

#b
#?


#c
pairs(~Y+X2+X3, data = q5, main = "matrice de nuage de points sans X1")
reg_q5c = lm(Y ~X2+X3,data=q5)
reg_q5c
summary(reg_q5c)
