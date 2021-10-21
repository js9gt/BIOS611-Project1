library(ggplot2)
library(tidyverse)
library(gridExtra)


##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest

##Scatterplot between W & TOR (turnover rate)
p2 <- ggplot(cbb, aes(x= W, y= TOR)) + geom_point() + xlab("Turnover Rate (TOR)") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Turnover Rate")

#Save Plot
ggsave("Figures/W_TOR.png",plot=p2)

p2