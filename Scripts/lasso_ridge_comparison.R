
#Source data
source('Scripts/model_build.R')

#remove insignificant variables
cbb192 <- cbb[, -c(1, 2, 3, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23)]

#Create new column for dummy variables
cbb192['x1'] <- 0
cbb192['x2'] <- 0
cbb192['x3'] <- 0
cbb192['x4'] <- 0


cbb192$x1 <- ifelse(cbb192$WAB >= -16.48 & cbb192$WAB < -9.56, 1, 0)
cbb192$x2 <- ifelse(cbb192$WAB >= -9.56 & cbb192$WAB < -2.64, 1, 0)
cbb192$x3 <- ifelse(cbb192$WAB >= -2.64 & cbb192$WAB < 4.28, 1, 0)
cbb192$x4 <- ifelse(cbb192$WAB >= 4.28 & cbb192$WAB < 11.2, 1, 0)

#Convert variables into factors
cbb192$x1 <- as.factor(cbb192$x1)
cbb192$x2 <- as.factor(cbb192$x2)
cbb192$x3 <- as.factor(cbb192$x3)
cbb192$x4 <- as.factor(cbb192$x4)

#Remove WAB since we don't need it anymore
cbb193 <- cbb192[, -c(5)]

#Ridge regression
x<-model.matrix(W~. + (ADJOE*x1) + (ADJOE*x2) + (ADJOE*x3) + (ADJOE*x4),cbb193)[,-1]
y<-cbb193$W

library(glmnet)

##threshold value should be very small if multicollinearity is present. see what happens if thresh was set to a larger value
##we know theoretically the coeffs should be the same as lm when lambda is 0
ridge.r<-glmnet(x,y,alpha=0, lambda=0, thresh = 1e-14)
coefficients(ridge.r)

set.seed(12)
sample.data<-sample.int(nrow(cbb193), floor(.50*nrow(cbb193)), replace = F) ##observations to belong to the training data
x.train<-x[sample.data,]
x.test<-x[-sample.data,]
y.train<-y[sample.data]
y.test<-y[-sample.data]

##use CV to find optimal lambda based on training set
set.seed(12)
cv.out<-cv.glmnet(x.train,y.train,alpha=0)
bestlam<-cv.out$lambda.min
bestlam

##fit ridge regression using training data and bestlam
ridge.mod<-glmnet(x.train,y.train,alpha=0,lambda=bestlam, thresh = 1e-14)

##Test MSE with best lambda
ridge.pred<-predict(ridge.mod,s=bestlam,newx=x.test)
out.ridge<-glmnet(x,y,alpha=0,lambda=bestlam,thresh = 1e-14)
mean((ridge.pred-y.test)^2)

#Ridge regression MSE: 9.389267
#Ridge R^2: 0.758
out.ridge$dev.ratio

#Lasso  regression--- FIX MODEL
set.seed(12)
cv.out.lasso<-cv.glmnet(x.train,y.train,alpha=1)
bestlam.lasso<-cv.out.lasso$lambda.min
bestlam.lasso

##fit ridge regression using training data
lasso.mod<-glmnet(x.train,y.train,alpha=1,lambda=bestlam.lasso, thresh = 1e-14)

##Test MSE with best lambda
lasso.pred<-predict(lasso.mod,s=bestlam.lasso,newx=x.test)
out.lasso<-glmnet(x,y,alpha=1,lambda=bestlam.lasso)
mean((lasso.pred-y.test)^2)

#Lasso regression MSE: 10.02748
#Lasso R^2: 0.747
out.lasso$dev.ratio

### Compare to MSE for our linear regression model: 8.720541
mean(summary(model3)$residuals^2)
#MLR R^2: 0.7848
summary(model3)

#Examine coefficients
cbind(coefficients(out.lasso), coefficients(out.ridge))


