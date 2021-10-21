FROM rocker/verse
MAINTAINER Jane She <jane.she@unc.edu>
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse', 'gridExtra', 'shiny', 'data.table'))"


