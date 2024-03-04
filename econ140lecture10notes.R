## OLS
n <- 100
b0 <- 10
b1 <- 5
var_error <- 9

error <- rnorm(n, 0, var_error)
x <- rpois(n, 10) +rnorm(n, 0, 2) # random poison distribution, mean and variance are the same

y <- b0 + b1 * x + error
plot(x,y)

abline(b0, b1) # Just the slope

lm1 <- lm(y ~ x)
abline(lm1, col = 'blue') # Blue line is the OLS line, or the regression line

# Plotting the violation of this assumption, Heteroskedasticity
n <- 100
b0 <- 10
b1 <- 5
var_error <- 9

error <- rnorm(n, 0, var_error)
x <- rpois(n, 10) +rnorm(n, 0, 2) # random poison distribution, mean and
# variance are the same

y <- b0 + b1 * x + error * x # this means the error depends on x
plot(x,y)

abline(b0, b1) # just the slope

lm1 <- lm(y ~ x)
abline(lm1, col = 'red')
abline(b0, b1)

# the fanning of of residuals means heteroskedacity
# it doesn't bias the point estimators, the betas
# but it baises the estimate of its standard error of the parameters
# this causes problems for inference

# when you have a wide range of posibilities, you are more likely
# to have heteroskedacicity??

#OVB

b0 <- 10
b1 <- 5
b2 <- 3
c0 <- 5
c1 <- 2

n_iter <- 1000
vec_1 <- rep(0, n_iter)
vec_2 <- rep(0, n_iter)

for(i in 1:n_iter){
  x1 <- rnorm(n, 0, 5) + 10
  
  
  x2 <- c0 + c1 * x1 + rnorm(n, 0, 3)
  
  y <- b0 + b1 * x1 + b2 * x2 + rnorm(n, 0, 10)
  
  lm3 <- lm(y ~ x1 + x2)
  lm4 <- lm(y ~ x1)
  
  vec_1[i] <- lm3$coefficients[2]
  vec_2[i] <- lm4$coefficients[2]
  
}

hist(vec_1)
hist(vec_2)

x1 <- rnorm(n, 0, 5) + 10


x2 <- c0 + c1 * x1 + rnorm(n, 0, 3)

y <- b0 + b1 * x1 + b2 * x2 + rnorm(n, 0, 10)

lm3 <- lm(y ~ x1 + x2)
lm4 <- lm(y ~ x1)


funky_function <- function(tree, cloud, flower = 5, sun = 2){
  result <- (tree * cloud * sun) - flower
  return <- result 
}




