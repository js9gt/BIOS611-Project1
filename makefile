#Remove dataset, figures, reports generated
clean:
	rm -f cbb19.csv
	rm -f Figures/*.png
	rm -f report.pdf



#File that Reads in data
Read_file.Rmd: cbb19.csv
	Rscript cbb19.csv read_data.R