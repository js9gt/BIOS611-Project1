.PHONY: clean
.PHONY: shiny_app
SHELL: /bin/bash

#Remove dataset, figures, reports generated
clean:
	#rm -f cbb19.csv
	rm -f Figures/*.png
	#rm -f Figures/*.jpeg
	rm -f report.pdf
	
	
#Final report output ##############
report.pdf:\
 report.tex\
 Figures/correlation_matrix.png\
 Figures/pairwise_interaction.png\
 Figures/W_ADJOE.png\
 Figures/W_EFGO.png\
 Figures/W_TOR.png\
 Figures/W_TORD.png\
 Figures/model_assumptions.png
	pdflatex report.tex
	
#Dataset needed for project & reading it in ############
cbb19.csv:\
 Scripts/read_data.R
	Rscript Scripts/read_data.R
	
#Data needed for the figures
Figures/correlation_matrix.png:\
 Scripts/read_data.R\
 cbb19.csv\
 Scripts/correlation_matrix.R
	Rscript Scripts/correlation_matrix.R
	
Figures/pairwise_interaction.png:\
 Scripts/read_data.R\
 cbb19.csv\
 Scripts/pairwise_interaction.R
	Rscript Scripts/pairwise_interaction.R
	
Figures/W_ADJOE.png:\
 Scripts/read_data.R\
 cbb19.csv\
 Scripts/W_ADJOE.R
	Rscript Scripts/W_ADJOE.R
	
Figures/W_EFGO.png:\
 Scripts/read_data.R\
 cbb19.csv\
 Scripts/W_EFGO.R
	Rscript Scripts/W_EFGO.R
	
Figures/W_TOR.png:\
 Scripts/read_data.R\
 cbb19.csv\
 Scripts/W_TOR.R
	Rscript Scripts/W_TOR.R


Figures/W_TORD.png:\
 Scripts/read_data.R\
 cbb19.csv\
 Scripts/W_TORD.R
	Rscript Scripts/W_TORD.R
	
Figures/model_assumptions.png:\
 Scripts/read_data.R\
 Scripts/model_build.R\
 cbb19.csv\
 Scripts/model_assump.R
	Rscript Scripts/model_assump.R


#Shiny app build
shiny_app:\
 Scripts/read_data.R\
 cbb19.csv\
 shiny_app.R
	Rscript shiny_app.R



