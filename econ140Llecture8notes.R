Sample Mean as OLS

# Generating a vector of random data

mu <- 10
se <- 5
n <- 64

data <- rnorm(n, mu, se)

# Calculating a sample mean

avg <- mean(data)

# Define residuals

n_iter <- 10
sum_squared_resid <- rep(0, n_iter +1)
sum_squared_resid[1] <- (sum(data-avg)^2)
alt_avg <- avg + -5:5
for(i in 1: n_iter){
  
  sum_squared_resid[i] <- sum((data - alt_avg[i]) ^ 2)
  
  #ERRATUM: During lecture the above was presented as
  # sum_squared_resid[i] <- (sum(data - alt_avg[i]) ^ 2)
  # This is a typo. Although it produced similar results, it has the wrong
  # order of operation and gives us squared sum of residuals instead of sum
  # of squared residuals.
  
}

plot(sum_squared_resid)

##########
# BONUS! # 
##########

# The whole loop can be accomplished with the following one line of code

sum_squared_resid <- sapply(-5:5, function(x) sum((data - (avg + x)) ^2))

# The *apply() class of functions can be a powerful and often much more
# efficient alternative for looping in some situations. Type ?apply into the
# console for more info.

# Plot to confirm same result
plot(sum_squared_resid)