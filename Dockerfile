FROM rocker/verse
MAINTAINER Jane She <jane.she@unc.edu>
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse', 'gridExtra', 'shiny', 'data.table', 'DT'))"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
RUN apt update -y && apt install -y\
        ne\
        sqlite3\
	texlive-base\
	texlive-binaries\
        texlive-latex-base\
	texlive-latex-recommended\
	texlive-pictures\
        texlive-latex-extra\
	python3-pip


