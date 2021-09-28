Cirrhosis.csv:
	curl https://www.kaggle.com/fedesoriano/cirrhosis-prediction-dataset -o $@

Read_file.Rmd: cirrhosis.csv
	Rscript cirrhosis.csv Read_file.Rmd