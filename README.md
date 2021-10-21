# BIOS-611-Project

  The dataset with variable descriptions and more context can be found [here](https://www.kaggle.com/andrewsundberg/college-basketball-dataset) 
  
  Men's college basketball is a widely popular sport, especially at the Division 1 level and is broadcasted nationally for fans to watch. According to Cav's Corner, the UVA men's basketball team is one of the top revenue generators for the school. Since the UVA men's basketball team won the national championships in 2019, I am interested in looking at various game statistics and their influences on the number of games won by a team. 
  
![](Figures/bball_champ.jpeg)
  
  Teams who win more games may be more likely to generate a larger fan base, more revenue for the school, and may be more likely to be projected to win the March Madness tournament.
  
  Being able to analyze specific predictors may also give coaches guidance for focusing practices on important skills and areas that may be lacking. 
  
  The dataset includes D1 college basketball statistics from the 2013-2021 seasons. however, I will just be focusing on the 2019 NCAA D1 basketball season since that is both the year that UVA won the national championships and the last pre-COVID season. 
  
  The dataset was found on kaggle and was scraped from barttorvik.com, a famous college basketball website. 
  
## Usage

To run this project, you will need Docker and the ability to run Docker as your current user. Please begin by building the docker container based on rocker/verse and run the R studio server. Then, connect to the machine using port 8787

  > docker build . -t project1-env
  
   > docker run -v `pwd`:/home/rstudio -p 8787:8787\
      -e PASSWORD=mypassword -t project1-env

The aliases.sh file will be used to work with the Docker file and help set up the git repository.

## Aliases
Before we begin, you will need to create a local secret.sh file to define your password. This file should contain:

`#!/bin/bash` 
`export MYPWD=<yourdesiredpassword>`

Once you have created your secret.sh file, run:

  > source aliases.sh
  
  
#### Add makefile

## Running Shiny App

The shiny app allows exploration of the dataset used by conference, seed, and postseason. Individuals may want to specifically analyze data from certain conferences (ACC, B10, etc.), certain seeds (1-16), or certain postseason rounds (champions, R68, etc.)

After subsetting data to view it in a table, data may be exported in CSV, excel, or PDF form. Additionally, the data may be printed.

Please start the Shiny app through the following code:

  > docker run -v `pwd`:/home/rstudio -e PASSWORD=$MYPWD -p 8787:8787 -p 8788:8788 -t shiny

Then, using the Rstudio terminal, run:

  > PORT=8788 make shiny_app
  
  




