### RCT 2

set.seed(12345)

n_iterations <- 500
ates <- rep(0,n_iterations)
slopes <- rep(0, n_iterations)
  
for(i in 1:n_iterations){ 
  n <- 1000
  ate <- 5
  original <- rnorm(n, 10, 5)
  error <- rnorm(n, 0, 5)

  treated <- runif(n) >= .7 # greater than .7 means they will be treated, 
# boolean values of TRUE and FALSE

  after <- original + ate * treated + error

  ate_estimated <- mean(after[treated]) - mean(after[!treated])
# we are trying to calculated the treated outcome for those who are treated

  ates[i] <- ate_estimated

  lm1 <- lm(after ~ treated)

  slopes[i] <- lm1$coefficients[2]
  }

hist(ates)
hist(slopes)
# the histogram of ates and slopes are the same! 

summary(lm1)
# t value tells you how far the estimate is from zero, tells you the statistical
#significance of your coefficients 
