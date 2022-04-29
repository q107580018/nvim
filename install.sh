#!/bin/bash
if  command -v pacman >/dev/null 2>&1; then
    echo "Arch Linux"
    os="arch"
elif command -v apt >/dev/null 2>&1; then
    echo "Ubuntu Linux"
    os="ubuntu"
fi

if os=="arch"; then
    sudo pacman -Syy
    yes | sudo pacman -S git zsh nodejs
    read -p "是否要安装neovim以及迁移其配置? Y/N:" para
    case $para in
    Y | y)
        yes | sudo pacman -S neovim
        if [ -e $HOME/.config/nvim ]; then
            sudo rm -rf $HOME/.config/nvim
        fi
        mkdir -p $HOME/.config/nvim 
        cp -r ./init.lua ./lua $HOME/.config/nvim/ ;;
    N | n)
        echo "不安装neovim...."
    esac
    read -p "是否要安装tmux以及迁移其配置？ Y/N:" para
    case $para in
    Y | y)
        yes | sudo pacman -S tmux
        cp ./otherConfig/tmux.conf $HOME/.tmux.conf ;;
    N | n)
        echo "不安装tmux...." ;;
    esac
    read -p "是否要安装ohmyzsh以及迁移其配置？ Y/N:" para
    case $para in
    Y | y)
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        cp ./otherConfig/zshrc $HOME/.zshrc
        cp ./otherConfig/xxf.zsh-theme $HOME/.oh-my-zsh/custom/themes/
        git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ;;
    N | n)
        echo "不安装ohmyzsh...." ;;
    esac
    read -p "是否要使用zsh作为你的默认shell？ Y/N:" para
    case $para in
    Y | y)
        sudo chsh -s /bin/zsh $USER 
        /bin/zsh  ;;
    N | n)
        echo "不切换到zsh" ;;
    esac
fi
