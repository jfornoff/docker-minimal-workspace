FROM debian:jessie

RUN apt-get update && apt-get -y install vim tmux git zsh curl
RUN chsh -s $(which zsh)

RUN git config --global user.email "janfornoff@gmail.com"
RUN git config --global user.name "Jan Fornoff"

# Oh my zsh
ENV TERM xterm-256color
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Dotfiles
WORKDIR /root
RUN git clone --recursive https://github.com/jfornoff/dotfiles
WORKDIR /root/dotfiles
RUN /bin/bash make.sh

CMD tmux -2
