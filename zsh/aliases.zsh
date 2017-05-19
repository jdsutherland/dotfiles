export CLICOLOR=xterm
if [[ -o interactive ]]; then
  # alias cd..='cd ..'
  # alias ..='cd ..'
  alias cdb='cd -'
  # Copy-pasting `$ python something.py` works
  alias \$=''

  # Arguments and pipes
  alias -g A='| ack --context'
  alias -g R='| rg'
  alias -g V='| vim -'
  alias -g L='| less -r'
  alias a='ag --workers 8 --pager "less -R"'
  alias agh='ag --hidden'
  alias als='alias | ack'
  alias f='ag -g'
  alias fa='alias | fzf'
  alias fag='ag --nobreak --nonumbers --noheading . | fzf'
  alias fh='ag --unrestricted -g'
  alias fls='functions | ack'
  alias fw='{ alias; functions; } | fzf'
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  alias tmuxks='tmux kill-session -t'
  alias dif='git diff --no-index'
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias wifi='airport -s'

  # Directories
  alias s8='cd /Volumes/seag8'
  alias s8p='cd /Volumes/seag8/pluralsight'
  alias casts='cd /Volumes/seag8/screencasts'
  alias talks='cd /Volumes/seag8/screencasts/talks'
  alias desk='cd ~/Desktop'
  alias prg='cd ~/Documents/Programming'
  alias cdl='cd ~/Downloads'
  alias cdoc='cd ~/Documents'
  alias dev='cd ~/Development'
  alias oss='cd ~/Development/OSS'
  alias tutorials='cd ~/Development/Tutorials'
  alias med='cd ~/Media'
  alias dot='cd ~/.dotfiles'
  alias drop='cd ~/Dropbox'
  alias dockerdir='~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/'

  # PS
  alias psa='ps aux'
  alias psr='ps aux | grep ruby'

  # Dotfiles
  alias ae='e ~/.dotfiles/zsh/aliases.zsh'
  alias fe='e ~/.dotfiles/zsh/functions.zsh'
  alias zkey='e ~/.dotfiles/zsh/key-bindings.zsh'
  alias ge='e ~/.dotfiles/gitconfig'
  alias mpvi='e ~/.dotfiles/config/mpv/input.conf'
  alias mpve='e ~/.dotfiles/config/mpv/mpv.conf'
  alias se='e ~/.dotfiles/slate'
  alias te='e ~/.dotfiles/tmux.conf'
  alias ve='e ~/.dotfiles/vim/init.vim'
  alias ze='e ~/.dotfiles/zshrc'
  alias zenv='e ~/.dotfiles/zshenv'
  alias zs='source ~/.zshrc'

  # # Git
  eval "$(hub alias -s)"
  alias amend='git commit --amend'
  alias fixgit='git config branch.master.remote origin && git config branch.master.merge refs/heads/master'
  alias gitdbg='git ci -am 'dbg' && git pull origin master && git push origin master'
  alias ga='git add'
  alias gad='git add .'
  alias gadu='git add -u .'
  alias gb='git branch'
  alias gbc='gdc'
  alias gca='git commit -a'
  alias gcaa='git commit -a --amend -C HEAD'
  alias gcl='git clone'
  alias gcm='git commit -m'
  alias gco='git checkout'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gdm='git diff master'
  alias gitp='git pull origin master && git push origin master'
  alias gitundo='git commit --amend'
  alias gst='git status -s .'
  alias glf='g pb'
  alias glfr='g pba'
  alias gldd='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} -- . ":(exclude)*.lock"'
  alias glddr='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} --reverse -- . ":(exclude)*.lock"'
  alias gld='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format}'
  alias gldr='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} --reverse'
  alias gsum='git-summary'
  alias gstats='git-bstats'
  alias gignore='git-ignore-io -a'
  alias gchurn='git-churn | tail -n 30'

  # App
  alias ack='nocorrect ack'
  alias bash='/usr/local/bin/bash'
  alias ctag='ctags -R --exclude=.git --exclude=log *'
  alias grep='grep --color=auto -i'
  alias irc='weechat'
  alias jtag='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
  alias f60='find -mmin -60'
  alias ls='ls -F'
  alias lnew='ls -tl | head 20'
  alias nvimu='brew reinstall --HEAD neovim'
  alias rr='rails'
  alias tidyh='tidy -config ~/.tidy.conf'
  alias tl='tldr'
  alias tmux='tmux -2'
  alias tre='tree -C | less'
  alias vim='nvim'
  alias rsync='rsync'
  alias wh='which'
  alias gap='git add -p'
  alias hot="ansiweather | tr '-' '\n' |tr '\>' '\n'"
  alias fore="ansiweather -l Bangkok -F | tr '-' '\n' |tr '\>' '\n'"
  alias copyloc='locateme -f "{LAT} {LON}" | pbc'
  alias twitter='rainbowstream'
  alias play='mpv **/*.(mp4|webm|mkv|mov) > /dev/null 2>&1 &'
  alias st='speedtest'
  alias ra='ranger'
  alias h='how2'
  alias ydl='youtube-dl -ci'
  alias ydlp='youtube-dl -cio "%(autonumber)s-%(title)s.%(ext)s"'
  alias G='googler -c com -l en'
  alias Gd='googler -c com -l en -n 3 define'
  alias G6='googler -c com -l en -t m6'
  alias Gy='googler -c com -l en -t y1'
  alias Gpdf='googler -c com -l en filetype:pdf'
  alias nosleep=caffeinate
  alias t1='tree -L 1 * | less -F'
  alias dm='docker-machine'
  alias doc='docker'
  alias wale='whalebrew'
  alias brewa='brewu && brewc && caskc'
  alias syt='mpsyt'
  alias npmimport='xargs npm install --global < ~/.dotfiles/Npmfile'
  alias tmuxr='tmux rename-session'
  alias fb='fb-messenger-cli'
  alias tasks='task list'
  alias t='task list'

  # misc

  alias saythai='say -v Kanya -r 155'

  ## Docker
  # Get latest container ID
  alias dl="docker ps -l -q"
  # Get container process
  alias dps="docker ps"
  # Get process included stop container
  alias dpa="docker ps -a"
  # Get images
  alias di="docker images"
  # Get container IP
  alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
  # Run deamonized container, e.g., $dkd base /bin/echo hello
  alias dkd="docker run -d -P"
  # Run interactive container, e.g., $dki base /bin/bash
  alias dki="docker run -i -t -P"
  # Execute interactive container, e.g., $dex base /bin/bash
  alias dex="docker exec -i -t"
  # Stop and Remove all containers
  alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

  # Archives
  alias uz='unarchive *zip'
  alias dz='rm -rf *zip'

  # Bundler
  alias be='bundle exec'
  alias bi='bundle install'
  alias bu='bundle update'

  # Yarn
  alias y='yarn'
  alias yi='yarn install'
  alias ya='yarn add'
  alias yad='yarn add --dev'
  alias ys='yarn start'
  alias yt='yarn test'
  alias yu='curl -o- -L https://yarnpkg.com/install.sh | bash'

  # Common misspellings
  alias wwhich='which'
  alias whic='which'

  # OS Specific
  if [ '$UNAME' = Darwin ]; then
    # Other OSX only aliases
    alias dbg='open /Applications/MacGDBp.app'
    alias imgsize='sips -g pixelWidth -g pixelHeight'

    # DNS
    alias flushdns='dscacheutil -flushcache'

    # Stuff That's Available on Mac and Linux, but with different commands
    alias sshkey='cat $HOME/.ssh/id_rsa.pub | pbcopy'
    alias updatedb='sudo /usr/libexec/locate.updatedb'
  fi

  if [ '$UNAME' = Linux ]; then
    alias ls='ls --color=auto'
    alias ack='ack-grep'
    alias free='free -m'
    alias update='sudo aptitude update'
    alias install='sudo aptitude install'
    alias upgrade='sudo aptitude safe-upgrade'
    alias fullupgrade='sudo aptitude full-upgrade'
    alias remove='sudo aptitude remove'
    alias search='aptitude search'
    alias show='aptitude show'
    alias apache2ctl='sudo /etc/init.d/apache2'
    alias a2enmod='sudo a2enmod'
    alias a2dismod='sudo a2dismod'
    alias a2ensite='sudo a2ensite'
    alias a2dissite='sudo a2dissite'
    alias nginxrestart='sudo /etc/init.d/nginx restart'

    # Stuff That's Available on Mac and Linux, but with different commands
    alias sshkey='cat $HOME/.ssh/id_rsa.pub'
    alias hosts='e -N /etc/hosts'
    alias zshrc='e -N $HOME/.zshrc && source $HOME/.zshrc'
    alias updatedb='sudo updatedb'
    alias mysqlrestart='sudo /etc/init.d/mysql restart'
    alias apacherestart='sudo /etc/init.d/apache2 restart'
  fi
fi
