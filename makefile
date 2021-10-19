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


