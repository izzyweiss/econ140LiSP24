#IV and 2SLS



sample_size <- 200

b0 <- 4
b1 <- 2
b2 <- -3
b3 <- -1

c0 <- 3
c1 <- 2
c2 <- 5

x2 <- rnorm(sample_size, 3,2)
x3 <- rnorm(sample_size, 5,7)
z <-  rnorm(sample_size, 8,2)

x1 <- c0 + c1 * x2 + c2 * z + rnorm(sample_size, 0, 5)

error <- rnorm(sample_size, 0 ,10)
y <- b0 + b1 * x2 + b2 * x2 + b3 *x3 + error

summary(lm(y~ x1 + x2 + x3))
summary(lm(y~ x1+ x3))

first_stage <- lm(x1 ~ z + x3)
second_stage <- lm(y ~ first_stage$fitted.values + x3)
summary(second_stage)
