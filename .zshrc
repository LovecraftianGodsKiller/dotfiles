fastfetch
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

######
# zgen plugin manager
######
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh

  # generate the init script from plugins above
  zgen save
fi

# plugins
zgen load romkatv/powerlevel10k powerlevel10k       # prompt

# put rest of plugins here

# core plugins
zgen load zsh-users/zsh-autosuggestions                             # auto suggestions
zgen load zdharma-continuum/fast-syntax-highlighting      # history search
zgen load zdharma-continuum/fast-syntax-highlighting                # syntax hilighting

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

### Antidote plugin manager
# source $HOME/.antidote/antidote.zsh

### load antidote plugins
# antidote load

# Antigen external plugins
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load Theme
# antigen theme romkatv/powerlevel10k

# Tell Antigen that you are finished
# antigen apply

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
### ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
### plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# changing default editor
export EDITOR=nvim
export VISUAL=nvim
# changing vim to neovim
alias vim='nvim'
# changing default editor if lunarvim is installed
# export EDITOR=lvim
# export VISUAL=lvim
# changing lunarvim to neovim
# alias nvim='lvim'
# alias vim='lvim'

# changing default editor - termux
# export EDITOR=/data/data/com.termux/files/home/.local/bin/lvim
# export VISUAL=/data/data/com.termux/files/home/.local/bin/lvim
# changing lunarvim to neovim
# alias lvim='/data/data/com.termux/files/home/.local/bin/lvim'
# alias nvim='/data/data/com.termux/files/home/.local/bin/lvim'

### Aliases ###
# Uncategorized
alias c='clear && fastfetch'
alias ca='clear'
alias reb='sudo reboot'
alias poff='sudo poweroff'
alias ff='fastfetch'
alias dbox='distrobox'
alias da='+%Y-%m-%d %A %T %Z'
alias a2c='aria2c'
alias ac='aria2c'

# Changing directories
alias cddown='cd /home/kirb/Downloads'
alias cddoc='cd /home/kirb/Documents'
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Changing 'ls' to 'lsd'
alias l='eza -alh --classify=always --color=always --group-directories-first --icons'    # my preferred listing
alias ls='eza -alh --classify=always --color=always --group-directories-first --icons'   # my preferred listing
alias lt='eza -alhT --classify=always --color=always --group-directories-first --icons'  # my preferred tree listing
alias lst='eza -alhT --classify=always --color=always --group-directories-first --icons' # my preferred tree listing

# git
alias clone='git clone'
alias commit='git commit'
alias push='git push'

# Pacman and Yay
alias pacin='sudo pacman -S'                     # install package(s) from repos
alias sps='sudo pacman -S'                       # install package(s) from repos
alias parin='paru -S --skipreview'               # isntall package(s) from aur (paru)
alias paruin='paru -S --skipreview'              # install package(s) from aur (paru)
alias yayin='yay -S'                             # install package(S) from aur (yay)
alias pacre='sudo pacman -Rns'                     # remove package(s) from repos or aur
alias spr='sudo pacman -Rns'                       # remove package(s) from repos or aur
alias parre='paru -Rns --skipreview'               # remove package(s) from repos or aur (paru)
alias parure='paru -Rns --skipreview'              # remove package(s) from repos or aur (paru) 
alias yayre='yay -R'                             # remove package(S) from repos or aur (yay)
alias pacres='sudo pacman -Rs'                   # remove package(s) with all dependencies
alias sprs='sudo pacman -Rs'                     # remove package(s) with all dependencies
alias parrs='paru -Rs'                           # remove package(s) will all dependencies (paru)
alias parurs='paru -Rs'                          # remove package(s) with all dependencies (paru)
alias yayrs='yay -Rs'                            # remove package(s) with all dependencies (yay)
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages/remove unused dependencies
alias pacsy='sudo pacman -Sy'                    # update pkglist
alias pacsyu='sudo pacman -Syu'                  # update only standardp pkgs
alias parsua='paru -Sua --skipreview'            # update only AUR pkgs (paru)
alias parusua='paru -Sua --skipreview'           # update only AUR pkgs (paru)
alias yaysua='paru -Sua --skipreview'            # update only AUR pkgs (paru)
alias pacsearch='pacman -Ss'
alias parsearch='paru -Ss'
alias pacss='pacman -Ss'
alias parss='paru -Ss'
alias pacscc='sudo pacman -Scc'
alias parscc='paru -Scc'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages/remove unused dependencies
alias paccache='sudo pacman -Scc'                # clean standard pkg cache
alias parcache='paru -Scc'                       # clean standard and aur pkg cahce
alias parucache='paru -Scc'                      # clean standard and aur pkg cache
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# dnf (fedora and fedora based package manager)
alias dnfin='sudo dnf install'
alias din='sudo dnf install'
alias dnfre='sudo dnf remove'
alias dre='sudo dnf remove'
alias dnfup='sudo dnf update'
alias dnfupd='sudo dnf update'
alias dup='sudo dnf update'
alias dupd='sudo dnf update'
alias dnfsysup='sudo dnf distro-sync'
alias dsu='sudo dnf distro-sync'
alias dds='sudo dnf distro-sync'
alias dnfclean='sudo dnf clean'
alias dauto='sudo dnf autoremove'
alias dautoremove='sudo dnf autoremove'
alias dsearch='sudo dnf search'

# fix obvious typos
alias cd..='cd ..'

# kitty terminal
alias icat='kitten icat'

# yt-dlp
alias yta-aac='yt-dlp --extract-audio --audio-format aac'
alias yta-best='yt-dlp --extract-audio --audio-format best'
alias yta-flac='yt-dlp --extract-audio --audio-format flac'
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3'
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[m4a]/bestvideo+bestaudio' --merge-output-format mp4"

# edit config files
alias editkitty='nvim $HOME/.config/kitty/kitty.conf'       # edit kitty configuration file
alias edit-kitty='nvim $HOME/.config/kitty/kitty.conf'      # edit kitty configuration file
alias editzshrc='nvim $HOME/.zshrc'                         # edit .zshrc
alias edit-zshrc='nvim $HOME/.zshrc'                        # edit .zshrc
alias edithypr='nvim $HOME/.config/hypr/hyprland.conf'      # edit hyprland configuration file
alias edit-hypr='nvim $HOME/.config/hypr/hyprland.conf'     # edit hyprland configuration file
alias editwaybar='nvim $HOME/.config/waybar/config'         # edit waybar configuration file

# get fastes mirrors
alias mirror='sudo reflector --country US --connection-timeout 60 --download-timeout 60 --fastest 10 --latest 10 --number 10 --verbose --save /etc/pacman.d/mirrorlist '

# Make archive
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'

# Android adb stuff
alias shizuku-start='adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.api'
alias start-shizuku='adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.api'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"



# Termux
alias pkgin='pkg install'
alias pkgre='pkg remove'
alias pkgupd='pkg update'
alias pkgupg='pkg upgrade'
alias nalain='nala install'
alias nalare='nala remove'
alias nalaupd='nala update'
alias nalaupd='nala upgrade'
# alias changerepo='termux-change-repo'
# alias reloadsettings='termux-reload-settings'
# alias storage='termux-setup-storage'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# dnf and rpm
alias dnfin='sudo dnf install'
alias dnfre='sudo dnf remove'
alias dnfup='sudo dnf upgrade'
alias dnfupd='sudo dnf upgrade'
alias dnfupg='sudo dnf upgrade'
alias rpmin='sudo rpm -i'

# Enabling Micro True color for color schemes
export MICRO_TRUECOLOR=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=$PATH:/home/kirb/.spicetify

export PATH=$PATH:/home/kirb/.local/bin

export XDG_CONFIG_HOME="${HOME}/.config"

export $XDG_SESSION_TYPE=wayland

eval "$(zoxide init zsh)"
