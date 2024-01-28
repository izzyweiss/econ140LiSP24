\title{Lecture 3 Econ140L}

## The thin grey line on the right hand side is where 80 characters will fit 
## Tradition in coding to make code more human decipherable, not exceed 80 
## characters per each line of code 

# The hastag starts a comment, so anything typed after this is not code
abc <- 123 # control enter to run the code, <- assigns the number 123
abc###to the variable abc

# Define sample size
n <- 1000
# Randomly generate 1000 untreated outcomes with a random number generator
original <- rnorm(n, 10, 5)  # First argument is the population size 
# Defaults to mean = 0 and SD = 1
#hist() is the hisogram function
#mean() will give you the average of the data set 

#Settingt the seed, computer number generator is not completely random actually
#becasuse its based on an algorithm, if you set the seed, you should get exactly 
#the same value, if you comment it out, then you get new numbers every time do 
#this if you want your numbers to be replicate 

set.seed(1234)
mean(original)

assign <- runif(n) #random uniform distribution generator, uniform distribution
#is a continuous dist. where you have an equal probablility to get any
#numbers in between, the probablity is all 10% within the intervals
#first argument in n, second is min, third is maz

treated <- ifelse(assign < .3, 1, 0) #first argument is test, second is yes, 
#third is no
hist(treated)
sum(treated)

ate <- 1
outcome <- original + (treated * ate) + rnorm(n, 0, 3) #if you didn't receive
#treatment, then treated = 0 here so 0 times ate is just 0

treated_avg <- mean(outcome[treated == 1]) #[] takes the outcome vector and 
#then only looks at the positions where treated is equal to 1
untreated_avg <- mean(outcome[treated != 0]) #!= means not equal to 

diff_in_means <- treated_avg - untreated_avg
diff_in_means

#Montecarlo simulation runs this experiment many times, then we will look at 
#the estimated treatment effect, we are going to create a forloop to conduct 
#the experiment many times

n_iterations <- 500
result_rct <- rep(0, n_iterations)
result_bias <- rep(0, n_iterations)

for(i in 1:500) {
  #define sample size
  n <- 1000

  #generate 1000 untreated outcomes
  original < rnorm(n, 10, 5)

  assign <- runif(n)
  treated <- ifelse(assign < .3, 1, 0)

  ate <- 5

  error <- rnorm(n, 0, 3)

  outcome <- original + treated * ate + error
  outcome_biased <- original + (original < 5) * treated + error

  treated_avg <- mean(outcome[treated == 1])
  untreated_avg <- mean(outcome[treated != 1])

  result_rct[i] <- treated_avg - untreated_avg

  treated_bias_avg <- mean(outcome_biased[original < 5])
  untreated_bias_avg <- mean(outcome_biased[original > 5])

  result_bias[i] <- treated_bias_avg - untreated_bias_avg
  }

hist(result_rct)
hist(result_bias)

