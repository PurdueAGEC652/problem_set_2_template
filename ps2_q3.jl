# The code below creates fake data for our estimation
using Random

Random.seed!(652) # Set a random seed for reproducibility

# Set true parameter values
β0_true = 2.0
β1_true = 3.0

# Data Generation
n = 1000
x = rand(n) * 10.0  # Uniform distribution
ϵ = randn(n)  # Normally distributed errors
y = β0_true .+ β1_true .* x .+ ϵ

#######################################################
# Insert your solution below this line
#######################################################
