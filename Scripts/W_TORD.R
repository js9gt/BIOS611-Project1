library(ggplot2)
library(tidyverse)
library(gridExtra)

##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest

##Scatterplot between W & TORD (steal rate)
p3 <- ggplot(cbb, aes(x= W, y= TORD)) + geom_point() + xlab("Steal Rate (TORD)") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Steal Rate")

#Save Plot
ggsave("Figures/W_TORD.png",plot=p3)

p3