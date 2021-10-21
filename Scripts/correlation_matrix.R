library(ggplot2)
library(tidyverse)
library(gridExtra)

##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest


##Create correlation table with only our variables of interest
cor_dat <- cbb %>% select(W, ADJOE, ADJDE, EFG_O, TOR, TORD) %>% as.matrix()

cor_matrix <- data.frame(cor(cor_dat))

png(filename="Figures/correlation_matrix.png", height=200, width=1000)
p<-tableGrob(cor_matrix)
grid.arrange(p)
dev.off()