## Model buiding

##Add source file reading in data
source('Scripts/read_data.R')

## Model with just quantitative predictors

model <- lm(W ~ ADJOE + ADJDE + EFG_O, cbb)
summary(model)

##Coding dummy variables for WAB
#X1: x1 = 1 if -16.48: -9.56, x1 = 0 if not
cbb$x1 <- ifelse(cbb$WAB >= -16.48 & cbb$WAB < -9.56, 1, 0)

#X2: x2 = 1 if -9.56: -2.64 , x2 = 0 if not
cbb$x2 <- ifelse(cbb$WAB >= -9.56 & cbb$WAB < -2.64, 1, 0)

#X3: x3 = 1 if -2.64: 4.28, x3 = 0 if not
cbb$x3 <- ifelse(cbb$WAB >= -2.64 & cbb$WAB < 4.28, 1, 0)

#X4: x4 = 1 if 4.28: 11.2, x4 = 0 if not
cbb$x4 <- ifelse(cbb$WAB >= 4.28 & cbb$WAB < 11.2, 1, 0)


## Model adding our qualitative predictor
model2 <- lm(W ~ ADJOE + ADJDE + EFG_O + x1 + x2 + x3 + x4, cbb)
summary(model2)


## Model adding interaction between WAB & ADJOE
model3 <- lm(W ~ ADJOE + ADJDE + EFG_O + x1 + x2 + x3 + x4 + (ADJOE*x1) + (ADJOE*x2) + (ADJOE*x3) + (ADJOE*x4), cbb)
summary(model3)


### Nested F est to compare complete & reduced model 
anova(model2, model3, test = "F")
