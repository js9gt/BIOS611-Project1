# handy aliases for working with the docker file
# and doing other stuff

source secret.sh

alias bu='docker build . -t p1-env --build-arg linux_user_pwd=$MYPWD'
alias dr='docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=$MYPWD -t p1-env'
alias hc='docker run -p 8711:8000 -v `pwd`:/host -it p1-env hovercraft /host/slides.rst'
alias hcb='docker run -v `pwd`:/host -it p1-env hovercraft /host/slides.rst /host/html_presentation'
alias py='docker run -p 8765:8765 -v `pwd`:/home/rstudio -it p1-env sudo -H -u rstudio /bin/bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8765"'

alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=$MYPWD -it p1-env sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
alias b='docker run -v `pwd`:/home/rstudio -e PASSWORD=$MYPWD-it p1-env sudo -H -u rstudio /bin/bash -c "cd ~/; /bin/bash"'


start_shiny(){
    docker run -p $2:$2 -v `pwd`:/home/rstudio -e PASSWORD=$MYPWD -it shiny sudo -H -u rstudio /bin/bash -c "cd ~/; PORT=$2 make $1"
}