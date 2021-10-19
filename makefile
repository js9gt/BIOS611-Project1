cbb19.csv:
	curl https://www.kaggle.com/andrewsundberg/college-basketball-dataset?select=cbb19.csv -o cbb.csv

Read_file.Rmd: cbb19.csv
	Rscript cbb19.csv Read_file.Rmd