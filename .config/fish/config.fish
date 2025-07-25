## Source from conf.d before our fish config
source $HOME/.config/fish/conf.d/done.fish

## Set values
## Run fastfetch as welcome message
function fish_greeting
   fastfetch 
end

# Format man pages
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"


## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
    set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Enable Wayland support for different applications
if [ "$XDG_SESSION_TYPE" = "wayland" ]
    set -gx WAYLAND 1
    set -gx QT_QPA_PLATFORM 'wayland;xcb'
    set -gx GDK_BACKEND 'wayland,x11'
    set -gx MOZ_DBUS_REMOTE 1
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx BEMENU_BACKEND wayland
    set -gx CLUTTER_BACKEND wayland
    set -gx ECORE_EVAS_ENGINE wayland_egl
    set -gx ELM_ENGINE wayland_egl
end

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# EDITOR & VISUAL
set -gx EDITOR nvim
set -gx VISUAL nvim

#########################
# Plugin configurations #
#########################
# fifc
# set -Ux fifc_editor nvim
# set -U fifc_bat_opts --style=numbers
# set -U fifc_fd_opts --hidden
# set -U fifc_exa_opts --icons --tree

###############
### aliases ###
###############

# misc
alias cp='advcp'
alias mv='advmv'
alias poff='sudo poweroff'
alias reb='sudo reboot'
alias c='clear && fastfetch'
alias ca='claer'
alias dbox='distrobox'
alias dbox-export='distrobox-export'
alias ac='aria2c'
alias ff='fastfetch'
alias ex='$HOME/.config/fish/extract-archive.sh'
alias tmod="__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=Nvidia_only __GLX_VENDOR_LIBRARY_NAME=nvidia /home/kirb/.local/share/Steam/steamapps/common/tModLoader/start-tModLoader.sh"
alias gungeon="/home/kirb/.applications/launch-gungeon.sh"

# kitty terminal
alias icat='kitten icat'

# git
alias clone='git clone'
alias commit='git commit'
alias push='git push'

# pacman and paru
alias pacin='sudo pacman -S'				# install package(s) from repos
alias parin='paru -S --skipreview'			# isntall package(s) from aur
alias pacre='sudo pacman -Rns'				# remove package, all dependencies and its configuration files
alias parre='paru -Rns --skipreview'			# remove package, all dependecnies and its configuration files
alias pacss='pacman -Ss'				# search repos for package
alias parss='paru -Ss --skipreview'			# search aur for package
alias pacsy='sudo pacman -Sy'
alias pacsyu='sudo pacman -Syu'
alias parsua='paru -Sua --skipreview'			# update only aur packages
alias aurup='paru -Sua --skipreview'			# update only aur packages
alias pacscc='sudo pacman -Scc'				# clean standard package cache
alias parscc='paru -Scc'				# clean standard and aur package cache
alias unlock='sudo rm /var/lib/pacman/db.lck'		# remove pacman lock
alias cleanup='sudo pacman -S -Rns $(pacman -Qtdq)'	# remove orphaned packages (orphaned packages a.k.a. unused dependecies)

# remove a directory and all files
alias rmd='rm --recursive --force --verbose'

# Replace ls with exa
alias l='eza -alh --classify=always --color=always --group-directories-first --icons'
alias ls='eza -alh --classify=always --color=always --group-directories-first --icons'
alias lsd='eza -alhD --classify=always --color=always --group-directories-first --icons'
alias lt='eza -alhT --classify=always --color=always --group-directories-first --icons'
alias lst='eza -alhT --classify=always --color=always --group-directories-first --icons'
# alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
# alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
# alias ll='eza -l --color=always --group-directories-first --icons'  # long format
# alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
# alias l.="eza -a | egrep '^\.'"                                     # show only dotfiles

# Android: adb and fastboot
alias fb='fastboot'
alias fb-init='fastboot flash init_boot'
alias fbinit='fastboot flash init_boot'
alias fb-reb='fastboot reboot'
alias fbreb='fastboot reboot'
alias fb-rec='fastboot reboot recovery'
alias fbrec='fastboot reboot recovery'
alias adb-bl='adb reboot bootloader'
alias adbbl='adb reboot bootloader'
alias adb-sl='adb sideload'
alias adbsl='adb sideload'

# Common use
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
#alias ..='cd ..'
#alias ...='cd ../..'
#alias ....='cd ../../..'
#alias .....='cd ../../../..'
#alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages

# archives
alias mktar='tar -cf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias mkxz='$HOME/.config/fish/mkxz.sh'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
alias unxz='tar -xf'

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
# alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
# alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
# alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# yt-dlp
alias yta-aac='yt-dlp --extract-audio --audio-format aac'
alias yta-best='yt-dlp -extract-audio --audio-format best'
alias yta-flac='yt-dlp --extract-audio --audio-format flac'
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3'
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[m4a]/bestvideo+bestaudio' --merge-output-format mp4"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Starship
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

# zoxide
zoxide init fish | source

fish_add_path /home/kirb/.spicetify
