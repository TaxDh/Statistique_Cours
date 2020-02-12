#exo2

rm(list = ls()) #ou le petit balais

demographic = read.table('APPENC02.txt', header = FALSE)
demographic

nbreDoc= demographic$V7
poptot=demographic$V4
landArea=demographic$V3
revenuTot=demographic$V15

densipop=poptot/landArea
pourcPop65=demographic$V6

#1)a)
pairs(~nbreDoc+ poptot+landArea+revenuTot)
pairs(~nbreDoc+densipop+pourcPop65+revenuTot)
cor(cbind(nbreDoc, poptot,landArea,revenuTot))
cor(cbind(nbreDoc,densipop,pourcPop65,revenuTot))

#1)b)
reg_m1=lm(nbreDoc~poptot+landArea+revenuTot)
reg_m2=lm(nbreDoc~densipop+pourcPop65+revenuTot)

#1)c)

summary(reg_m1)
summary(reg_m2)
#le modele 2 semble meilleure, mais pas a ce point, voir R-squared des 2 summary

#2)

idx_NE = which(demographic$V16 == 1)
idx_NC = which(demographic$V16 == 2)
idx_S = which(demographic$V16 == 3)
idx_W = which(demographic$V16 == 4)

nbreCrime=demographic$V9
revenuPerCap=demographic$V14
pourcDiplomSec= demographic$V10

#2)a)
reg_NE = lm(nbreCrime[idx_NE]~densipop[idx_NE]+revenuPerCap[idx_NE]+pourcDiplomSec[idx_NE])
reg_NC = lm(nbreCrime[idx_NC]~densipop[idx_NC]+revenuPerCap[idx_NC]+pourcDiplomSec[idx_NC])
reg_S = lm(nbreCrime[idx_S]~densipop[idx_S]+revenuPerCap[idx_S]+pourcDiplomSec[idx_S])
reg_W = lm(nbreCrime[idx_W]~densipop[idx_W]+revenuPerCap[idx_W]+pourcDiplomSec[idx_W])
