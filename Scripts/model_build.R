## Model buiding

##Add source file reading in data
source('Scripts/read_data.R')

## Model with just quantitative predictors 

model <- lm(W ~ ADJOE + ADJDE + EFG_O, cbb)
summary(model)
