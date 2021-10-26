# BIOS-611-Project

  The dataset with variable descriptions and more context can be found [here](https://www.kaggle.com/andrewsundberg/college-basketball-dataset) 
  
  Men's college basketball is a widely popular sport, especially at the Division 1 level and is broadcasted nationally for fans to watch. According to Cav's Corner, the UVA men's basketball team is one of the top revenue generators for the school. Since the UVA men's basketball team won the national championships in 2019, I am interested in looking at various game statistics and their influences on the number of games won by a team. 
  
![](Figures/bball_champ.jpeg)
  
  Teams who win more games may be more likely to generate a larger fan base, more revenue for the school, and may be more likely to be projected to win the March Madness tournament.
  
  Being able to analyze specific predictors may also give coaches guidance for focusing practices on important skills and areas that may be lacking. 
  
  The dataset includes D1 college basketball statistics from the 2013-2021 seasons. however, I will just be focusing on the 2019 NCAA D1 basketball season since that is both the year that UVA won the national championships and the last pre-COVID season. 
  
  The dataset was found on kaggle and was scraped from barttorvik.com, a famous college basketball website. 
  

## Aliases
Before we begin, you will need to create a local secret.sh file to define your password. This file should contain: 

  `#!/bin/bash` 

  `export MYPWD=<yourdesiredpassword>`

Please replace <yourdesiredpassword> with your own password.
Once you have created your secret.sh file, run:

  `source aliases.sh`
 
 The aliases.sh file will be used to work with the Docker file and help set up the git repository. 

## Usage

To run this project, you will need Docker and the ability to run Docker as your current user. Please begin by building the docker container based on rocker/verse and run the R studio server. 


  `docker build . -t project1-env` 
 
  `docker run -v $(pwd):/home/rstudio -p 8787:8787 -e PASSWORD=<MYPWD> -t project1-env`


Then, connect to the machine using port 8787 by going to [http://localhost:8787/](http://localhost:8787/). The username and password will be as following:

  `Username: rstudio` 
 
  `Password: MYPWD (the one you set earlier)`


Now, you should be able to access my files in my folder which contains all the files for this project.  


## Makefile

The makefile will help build components of the report. To build figures, run in Rstudio terminal the command

  `make Figures/<figurename>.png`
  
For example, to create the correlation matrix figure, run in Rstudio terminal:
  
  `make Figures/correlation_matrix.png`
  
To build the final report, run in Rstudio terminal:

  `make report.pdf`


## Running Shiny App

The shiny app allows exploration of the dataset used by conference, seed, and postseason. Individuals may want to specifically analyze data from certain conferences (ACC, B10, etc.), certain seeds (1-16), or certain postseason rounds (champions, R68, etc.)

After subsetting data to view it in a table, data may be exported in CSV, excel, or PDF form. Additionally, the data may be printed.

Please start the Shiny app by first launching docker:

  `docker run -v $(pwd):/home/rstudio -e PASSWORD=<MYPWD> -p 8787:8787 -p 8788:8788 -t project1-env`

Then, go to [http://localhost:8787/](http://localhost:8787/). 

Finally, use Rstudio terminal in the server and enter 

 `PORT=8788 make shiny_app`

Rstudio terminal should then output with a website.

To run the app, please click the website link. Or, go to [http://localhost:8788/ ](http://localhost:8788/).  


  




