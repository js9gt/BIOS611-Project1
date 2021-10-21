#Remove dataset, figures, reports generated
clean:
	rm -f cbb19.csv
	rm -f Figures/*.png
	rm -f report.pdf


#Final report output
report.pdf:\
 report.tex\
 Figures/correlation_matrix.png\
 Figures/pairwise_interaction.png\
 Figures/W_ADJOE.png\
 Figures/W_EFGO.png\
 Figures/W_TOR.png\
 Figures/W_TORD.png
	pdflatex report.tex


#Dataset needed for project & reading it in
cbb19.csv:\
 read_data.R
	Rscript read_data.R


#Data needed for the figures
Figures/correlation_matrix.png:\
 EDA.R\
 Scripts/read_data.R
 cbb19.csv
	Rscript EDA.R

Figures/pairwise_interaction.png:\
 EDA.R\
 Scripts/read_data.R
 cbb19.csv
	Rscript EDA.R

Figures/W_ADJOE.png:\
 EDA.R\
 Scripts/read_data.R
 cbb19.csv
	Rscript EDA.R


Figures/W_EFGO.png:\
 EDA.R\
 Scripts/read_data.R
 cbb19.csv
	Rscript EDA.R

Figures/W_TOR.png:\
 EDA.R\
 Scripts/read_data.R
 cbb19.csv
	Rscript EDA.R


Figures/W_TORD.png:\
 EDA.R\
 Scripts/read_data.R
 cbb19.csv
	Rscript EDA.R


#Shiny app build
shiny_app:\
 derived_data/s_app.csv\
 Scripts/read_data.R
 cbb19.csv
 shiny_app.R
	Rscript shiny_app.R ${PORT}



