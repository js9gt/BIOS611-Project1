library(ggplot2)
library(tidyverse)
library(gridExtra)

##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest


##Scatterplot between W & EFG_O (effective field goal percentage shot)
p4 <- ggplot(cbb, aes(x= W, y= EFG_O)) + geom_point() + xlab("Effective Field Goal Percentage Shot (EFG_O") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Effective Field Goal Percentage Shot")

#Save Plot
ggsave("Figures/W_EFGO.png",plot=p4)

p4