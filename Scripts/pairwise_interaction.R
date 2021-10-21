library(ggplot2)
library(tidyverse)
library(gridExtra)

##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest

##Pairwise plot to view possible interactions
png(filename="Figures/pairwise_interaction.png")
pairs(~W + ADJOE + ADJDE + TOR + TORD + EFG_O, data = cbb)
dev.off()
