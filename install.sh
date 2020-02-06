#!/bin/bash

dirs=`echo ~/.local/bin ~/.vim/colors`
for dir in `echo ${dirs}`
do
  mkdir -p ${dir}
done

if [ ! `which git` ]; then
   sudo yum install git -y
   cp -p /usr/share/doc/git-*/contrib/completion/git-completion.bash ~/.local/bin/.
   echo 'source ~/.local/bin/git-completion.bash' >> ~/.bash_profile
fi

if [ ! `which aws` ]; then
   sudo yum install epel-release -y
   sudo yum install python-pip -y
   pip install pip --upgrade
   pip install awscli 
 fi

if [ ! -d ~/.anyenv ] ; then
    git clone https://github.com/riywo/anyenv ~/.anyenv
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
    exec $SHELL -l
fi

if [ ! -f  ~/.local/bin/direnv ]; then
    curl -s -L -o ~/.local/bin/direnv https://github.com/zimbatm/direnv/releases/download/v2.17.0/direnv.linux-amd64
    chmod +x ~/.local/bin/direnv
fi

if [ ! -f ~/.vim/colors/hybrid.vim ]; then
   curl https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim > ~/.vim/colors/hybrid.vim
fi

cd ${HOME}/dotfiles
for file in .??*
do
    [[ ${file} == '.git' ]] && continue
    [[ ${file} == '.DS_Store' ]] && continue

    \cp -pf ${file} ${HOME}/.
done
