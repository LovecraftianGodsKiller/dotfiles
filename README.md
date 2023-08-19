# dotfiles
My Linux confugration files

# SETUP

Install Oh-My-ZSH (after copying .zshrc to user directory and running `exec zsh`)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Remove and rename filez modified by Oh-My-Zsh
```
rm ~/.zshrc && mv ~/.zshrc-pre-oh-my-zsh ~/.zshrc

Install antigen (my zsh plugin manager of choice)
```
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
```
