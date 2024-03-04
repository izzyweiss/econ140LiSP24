install.packages("wooldridge", lib="~/R/my_packages")

data(bwght, package = "wooldridge")

lm1 <- lm1(bwght ~ male, data = bwght)
summary(lm1)

lm2 <- lm1(bwght ~ male + faminc + mothedu + parity + white, data = bwght)
lm2
