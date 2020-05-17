## Load set up ----
source("setup.R")

## models ----

test_model <- function(data){
        
        glmer(yall ~ 1 + (1 | cntry), 
              data = data, 
              family = binomial(link="logit"),
              control = glmerControl(optimizer = "bobyqa"),
              nAGQ = 0)
        
}

economic_model <- function(data){
        
        glmer(yall ~ pincome + education + unemployed + inrdstrbtn + ( 1 | cntry), 
              data = data, 
              family = binomial(link="logit"),
              control = glmerControl(optimizer = "bobyqa"),
              nAGQ = 0)
}

cultural_model <- function(data){
        
        glmer(yall ~ ethreat + autsen + ( 1 | cntry), 
              data = data, 
              family = binomial(link="logit"),
              control = glmerControl(optimizer = "bobyqa"),
              nAGQ = 0)
}

political_model <- function(data){
        
        glmer(yall ~ nat_ptrust + glo_ptrust + exefficacy +  ( 1 | cntry), 
              data = data, 
              family = binomial(link="logit"),
              control = glmerControl(optimizer = "bobyqa"),
              nAGQ = 0)
        
        
}

total_model <- function(data){
        
        glmer(yall ~ ethreat + autsen + pincome + education + unemployed + inrdstrbtn + nat_ptrust + glo_ptrust + exefficacy + ( 1 | cntry),
              data = data, 
              family = binomial(link="logit"),
              control = glmerControl(optimizer = "bobyqa"),
              nAGQ = 0)
        
}
