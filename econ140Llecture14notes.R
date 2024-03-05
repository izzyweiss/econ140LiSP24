packlist <- c('wooldridge','ivreg','modelsummary')
install.packages(packlist[!(packlist%in%installed.packages()[1,])])

library(wooldridge)
library(ivreg)
library(modelsummary)

data(bwght)
# cigtax is potentially useful IV since the only way it effects birthweight
# is by how it effects the mother's smoking habits 

lm1 <- lm(bwght ~ cigs + faminc + fatheduc + motheduc + parity + male,
          data = bwght)
ivm1 <- ivreg(bwght ~ faminc + fatheduc + motheduc + parity + male | cigs | 
                cigtax, data = bwght)
modelsummary(list(OLS = lm1, TwoSLS = ivm1)) 
# using this ivreg function we DO we correct se, p-value and t stat
# in 2SLS we have more uncertainty so we will see a rise in the standard error
# making it more likely that we will commit a type two error 

summary(lm(cigs ~ cigtax + faminc + fatheduc + motheduc + parity + male, 
           data = bwght))
ivm2 <- ivreg(bwght ~ faminc + fatheduc + motheduc + parity + male | cigs | 
                cigprice, data = bwght)
modelsummary(list(OLS = lm1, IVcigtax = ivm1, IVcigprice = ivm2)) 


rm(list = ls()) # clears the environment

data("smoke")
lm2 <- lm(cigs ~ cigpric + educ + white + age + income, data = smoke)
ivm3 <- ivreg(cigs ~ educ + white + age + income | cigpric | restaurn, 
             data = smoke)
modelsummary(list(OLS = lm2, TwoSLS = ivm3))

