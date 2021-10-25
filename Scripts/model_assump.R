##Checking model assumptions

library(ggfortify)

source('Scripts/model_build.R')

## Model adding interaction between WAB & ADJOE (Complete Model)
png(filename="Figures/model_assumptions.png")
autoplot(model3, which = 1:6)
dev.off()

