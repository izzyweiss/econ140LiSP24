# Central Limit Theorem DEMO
#We are creating a graph, and a for loop to see the iteration of the code
# We need to do this in a nested loop, in the outer loop we are adjusting the 
# sample size 

# Vector of a sequence of numbers using base 2

sample_sizes <- 2^(1:15)
n_iters <- 1000

for(sample_size in sample_sizes){
  
  means <- rep(0 , n_iters)
  
  for(i in 1:n_iters){
    x <- ifelse(runif(sample_size) > .4, 6, 3)
    means[i] <- mean(x)
  }
  plot(density(means))
  Sys.sleep(.1)
  
}

# As we increase the sample size, we see more and more of a bell shape

