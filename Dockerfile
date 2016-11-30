FROM ubuntu:14.04
MAINTAINER abrahammouse(abrahammouse@gmail.com)

RUN apt-get update \
 && apt-get --force-yes install -y curl vim exuberant-ctags git ack-grep vim-nox tmux openssh-server python-pip\
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install pep8 flake8 pyflakes isort yapf

RUN apt-get update \
 && apt-get --force-yes install -y build-essential cmake python-dev clang-format-3.5 xdg-utils nodejs-legacy wmctrl ack-grep software-properties-common python-software-properties\
 && add-apt-repository ppa:jonathonf/vim \
 && apt-get update \
 && sudo apt-get upgrade -y \
 && apt-get install vim --upgrade -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
RUN mkdir -p /root/.vim/undofiles \
 && curl -o - https://raw.githubusercontent.com/abrahammouse/c_cpp_vim_ide/master/sourcefile/install-vim-plugins | sh

ADD config/. /root/
COPY sourcefile/NERD_tree.vim /root/.vim/plugged/nerdtree/plugin/NERD_tree.vim

EXPOSE 22
ENTRYPOINT service ssh restart && bash
