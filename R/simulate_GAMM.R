#' Function to simulate y in GAMM()  model 
#'
#' @description Function to simulate y in GAMM() model 
#' @param seed Seed used for simulation

#' 
#' @return expected difference
#' 
#' @export 
#'
#' @examples
#'simul_modlogist(seed = 1)
#'



simul_modGAMM <- function(seed = 1){
  
  set.seed(seed)
  ## Model to extract value of our dataset
  m <- logistf::logistf(y ~ Genetic_Diversity-1 + Block, 
                        data=data_proba_extinction)
  # #Extract residuals
  # resid <- data_proba_extinction$y -  m$predict
  # sdres <- sqrt(var(resid))
  
  # #Standardized pearson residuals:
  # resid/(sqrt(diag(m$var)))
  # 
  # #Deviance residuals: 
  # -sign(resid)*sqrt(-2*(data_proba_extinction$y*log(m$predict)+(1-data_proba_extinction$y)*log(1-m$predict)))
  # 
  
  #Extract mean and variance effects
  fixef_m <- coef(m)  #Mean with the fixed effects
  
  
  
  ##### SIMULATED DATASET
  ## New dataset for the simulated data
  sim_data <- data_proba_extinction[1:nrow(data_proba_extinction), ]
  
  ## Design matrix for the simulated data
  M1 <- model.matrix(~ Genetic_Diversity-1 + Block,
                     data = sim_data)
  # dim(M1)
  # dim(sim_data)
  # head(M1)
  # head(sim_data)
  
  ##### FIXED EFFECT
  ## Compute the  value of each individual in the new dataset
  M1 <- M1[, colnames(M1)%in%names(fixef_m)] 
  # dim(M1)
  # head(M1)
  
  #Extract fixef(m)
  sim_data$FixEff <- M1%*%fixef_m
  #Check: correspond to do a predict without considered error term: 
  #data.frame(M1%*%fixef_m,predict(m, re.form = NA))
  
  
  # ##### ERROR TERM
  # ## Compute the random error
  # sim_data$ResEff <- rnorm(n=nrow(sim_data), mean = 0, sd = sdres)
  # 
  
  # Add variation sdpop
  data$PopEff <- data$Pop
  levels(data$PopEff) <- rnorm(nlevels(data$PopEff), 0, sd = sdpop)
  data$PopEff <- as.numeric(as.character(data$PopEff))
  
  
  ##### Proba of extinction 
  ## Compute the proba total
  sim_data$simy <- sim_data$FixEff
  
  sim_data$simy_poisson <- rpois(n=nrow(simy_poisson), 
                                 lambda = exp(data$FixEff + data$PopEff))
  simy_poisson$simy <- log(data$simy_poisson)
  
  
  ##### MODEL WITH SIMULATED DATA
  msim <- logistf::logistf(simy ~ Genetic_Diversity-1 + Block, 
                           data=sim_data)
  #Expected difference
  exp_diff <- plogis(coef(msim)[3]) - plogis(coef(msim)[2])
  
  return(c(exp_diff))
  
}

