#!/bin/bash
ZSH_CUSTOM=~/.oh-my-zsh/custom
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone git@github.com:jamesob/desk.git /tmp/desk && cp -r /tmp/desk/shell_plugins/zsh ~/.oh-my-zsh/plugins/desk && rm -rf /tmp/desk
