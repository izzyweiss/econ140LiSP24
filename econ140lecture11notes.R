# Signing OVB

sample_size <- 500
b0 <- 10
b1 <- 3
b2 <- 4

c0 <- 5
c1 <- 2

x2 <- rnorm(sample_size, 3, 5)
x1 <- c0 + c1 * x2 + rnorm(sample_size, 0, 3) # this is the error term

y <- b0 + b1 * x1 + b2 * x2 + rnorm(sample_size, 0, 6)

lm_long <- lm(y~ x1 + x2)
lm_short <- lm(y ~ x1)
lm_aux <- lm(x2 ~ x1)

lm_short$coefficients[2] - lm_long$coefficients[2] # regression results are lists 