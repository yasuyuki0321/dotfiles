#!/bin/bash

dirs=`echo ~/.local/bin ~/.vim/colors`
for dir in `echo ${dirs}`
do
    mkdir -p ${dir}
done

if [ ! `which git` ]; then
    sudo yum install git -y
    cp -p /usr/share/doc/git-*/contrib/completion/git-completion.bash ~/.local/bin/.
    {
        echo ""
        echo "git"
        echo 'source ~/.local/bin/git-completion.bash'
    } >> ./.bash_profile
fi
    
if [ ! `which kubectl` ]; then
    curl -s -L -o ~/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ~/.local/bin/kubectl
    {
        echo ""
        echo "# kubectl"
        echo "source <(kubectl completion bash)"
    } >> ./.bash_profile
fi

if [[ ! `which kubectx` || ! `which kubens` ]]; then
    rm -fr ~/.kubectx
    git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
    COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
    sudo ln -sf ~/.kubectx/kubens ~/.local/bin/kubens
    sudo ln -sf ~/.kubectx/kubectx ~/.local/bin/kubectx
    chmod 755 ~/.local/bin/kubens ~/.local/bin/kubectx
fi

if [ ! `which aws` ]; then
    sudo yum install python3-pip -y
    pip3 install pip --upgrade
    pip3 install awscli 
fi

if [ ! -d ~/.anyenv ] ; then
    git clone https://github.com/riywo/anyenv ~/.anyenv
    {
        echo ""
        echo "# anyenv"
        echo 'export PATH="$HOME/.anyenv/bin:$PATH"'
        echo 'eval "$(anyenv init -)"'
        echo "export VIRTUAL_ENV_DISABLE_PROMPT=1"
    } >> ./.bash_profile
    ~/.anyenv/bin/anyenv install --force-init
    exec $SHELL -l
fi

if [ ! -f  ~/.local/bin/direnv ]; then
    VER=`curl -fsSLI -o /dev/null -w %{url_effective} https://github.com/direnv/direnv/releases/latest | awk -F\/ '{print $NF}'`
    curl -s -L -o ~/.local/bin/direnv https://github.com/direnv/direnv/releases/download/$VER/direnv.linux-amd64
    chmod +x ~/.local/bin/direnv
    {
        echo ""
        echo "# direnv"
        echo "export EDITOR=vim"
        echo 'eval "$(direnv hook bash)"'
    } >> ./.bash_profile
fi


if [ ! -f  ~/.local/bin/volt ]; then
    VER=`curl -fsSLI -o /dev/null -w %{url_effective} https://github.com/vim-volt/volt/releases/latest | awk -F\/ '{print $NF}'`
    curl -s -L -o ~/.local/bin/volt https://github.com/vim-volt/volt/releases/download/$VER/volt-$VER-linux-amd64
    chmod +x ~/.local/bin/volt

    volt get https://github.com/tpope/vim-fugitive
fi

if [ ! -f ~/.vim/colors/hybrid.vim ]; then
    mkdir -p ~/.vim/colors
    curl https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim > ~/.vim/colors/hybrid.vim
fi

cd ${HOME}/dotfiles
for file in .??*
do
    [[ ${file} == '.git' ]] && continue
    [[ ${file} == '.DS_Store' ]] && continue

    \cp -pf ${file} ~/.
done

source ~/.bash_profile

