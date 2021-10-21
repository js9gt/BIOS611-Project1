library(ggplot2)
library(tidyverse)
library(gridExtra)

##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest

##Scatterplot between W & ADJOE (adjusted offensive efficiency)
p1 <- ggplot(cbb, aes(x= W, y= ADJOE)) + geom_point()+xlab("Adjusted Offensive Efficiency (ADJOE)") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Adjusted Offensive Efficiency")

          #Save Plot
ggsave("Figures/W_ADJOE.png",plot=p1)

p1

