FROM ubuntu:14.04
MAINTAINER abrahammouse(abrahammouse@gmail.com)

RUN apt-get update \
 && apt-get --force-yes install -y curl vim exuberant-ctags git vim-nox openssh-server python-pip build-essential python-dev cmake clang-format-3.5 xdg-utils nodejs-legacy wmctrl ack-grep software-properties-common python-software-properties\
 && add-apt-repository ppa:jonathonf/vim \
 && apt-get update \
 && apt-get upgrade -y \
 && apt-get install vim --upgrade -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install pep8 flake8 pyflakes isort yapf
 
RUN mkdir -p /root/.vim/undofiles \
 && curl -o - https://raw.githubusercontent.com/abrahammouse/c_cpp_vim_ide/master/sourcefile/install-vim-plugins | sh
 
RUN timeout 20m vim +PlugInstall +qall || true

ADD config/. /root/

EXPOSE 22
ENTRYPOINT service ssh restart && bash
