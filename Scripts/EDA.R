
##Add source file reading in data
source('Scripts/read_data.R')

##Create scatterplots between variables of interest
library(ggplot2)

##Scatterplot between W & ADJOE (adjusted offensive efficiency)
p1 <- ggplot(cbb, aes(x= W, y= ADJOE)) + geom_point()+xlab("Adjusted Offensive Efficiency (ADJOE)") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Adjusted Offensive Efficiency")

          #Save Plot
ggsave("Figures/W_ADJOE.png",plot=p1)

p1

##Scatterplot between W & TOR (turnover rate)
p2 <- ggplot(cbb, aes(x= W, y= TOR)) + geom_point() + xlab("Turnover Rate (TOR)") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Turnover Rate")

#Save Plot
ggsave("Figures/W_TOR.png",plot=p2)

p2

##Scatterplot between W & TORD (steal rate)
p3 <- ggplot(cbb, aes(x= W, y= TORD)) + geom_point() + xlab("Steal Rate (TORD)") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Steal Rate")

#Save Plot
ggsave("Figures/W_TORD.png",plot=p3)

p3

##Scatterplot between W & EFG_O (effective field goal percentage shot)
p4 <- ggplot(cbb, aes(x= W, y= EFG_O)) + geom_point() + xlab("Effective Field Goal Percentage Shot (EFG_O") +
  ylab("Number of Games Won (W)") + ggtitle("Scatterplot of Games Won vs. Effective Field Goal Percentage Shot")

#Save Plot
ggsave("Figures/W_EFGO.png",plot=p4)

p4

##Pairwise plot to view possible interactions
png(filename="Figures/pairwise_interaction.png")
pairs(~W + ADJOE + ADJDE + TOR + TORD + EFG_O, data = cbb)
dev.off()

