#!/bin/bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone git@github.com:jamesob/desk.git /tmp/desk && cp -r /tmp/desk/shell_plugins/zsh ~/.oh-my-zsh/plugins/desk && rm -rf /tmp/desk
