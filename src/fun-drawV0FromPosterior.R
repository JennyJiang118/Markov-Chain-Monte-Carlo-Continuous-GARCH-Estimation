drawV0FromPosterior <- function(currentV0, R1, V1, alpha, beta, gamma, eta, dt, alpha_V, beta_V){
  proposition <- rnorm(1,
                       mean = V1,
                       sd = (eta * sqrt(dt) * V1) / beta)
  
  logProbabilityOfAcceptance <- 
    getLogDensityDiffV0(proposition, currentV0, R1, V1, alpha, beta, gamma, eta, dt, alpha_V, beta_V)
  
  if(logProbabilityOfAcceptance > log(runif(1))){
    result <- proposition
  } else {
    result <- currentV0
  }
  
  result
}
