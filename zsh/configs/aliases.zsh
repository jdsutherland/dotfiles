if [[ -o interactive ]]; then
  alias cd..='cd ..'
  alias ..='cd ..'
  alias ...="cd ../.."
  alias cdb='cd -'
  # Copy-pasting `$ python something.py` works
  alias \$=''

  # Arguments and pipes
  alias -g L='| less -r'
  alias -g R='| rg -i --context 3'
  alias -g V='| nvim -'
  alias -g H='| head -n 20'
  alias -g C='| wc -l'
  alias a='ag --workers 8 --pager "less -R"'
  alias agh='ag --hidden'
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  alias dif='git diff --no-index'
  alias fa='alias | fzf'
  alias fw='{ alias; functions; } | fzf'
  alias f='ag -g'
  alias fh='ag --unrestricted -g'

  # Directories
  alias vids='cd /Volumes/seag8silver/vids'
  alias photobooth="cd $HOME/Pictures/Photo Booth Library/Pictures"
  alias books='cd ~/Books'
  alias cdl='cd ~/Downloads'
  alias ctil='cd ~/Notes/til'
  alias cdoc='cd ~/Documents'
  alias cgo='cd $GOPATH/src/github.com'
  alias notes='cd ~/Notes'
  alias desk='cd ~/Desktop'
  alias dev='cd ~/Development'
  alias cdot='cd ~/.dotfiles'
  alias drop='cd ~/Dropbox'
  alias interview='cd ~/Development/Interview'
  alias med='cd ~/Media'
  alias oss='cd ~/Development/OSS'
  alias s8='cd /Volumes/seag8silver'
  alias r8='ranger-cd /Volumes/seag8silver/Media'
  alias cnv='cd ~/.config/nvim'

  # PS
  alias psa='ps aux'
  alias psr='ps aux | grep ruby'

  # Dotfiles
  alias cbin='cd ~/.dotfiles/bin'
  alias ae='e ~/.dotfiles/zsh/configs/aliases.zsh'
  alias fe='e ~/.dotfiles/zsh/configs/functions.zsh'
  alias ge='e ~/.dotfiles/gitconfig'
  alias mpvg='mpv --player-operation-mode=pseudo-gui'
  alias mpve='e ~/.dotfiles/config/mpv/mpv.conf'
  alias mpvi='e ~/.dotfiles/config/mpv/input.conf'
  alias mpvr="mpv --script-opts=radiostart=true"
  alias se='e ~/.dotfiles/slate'
  alias me='e ~/.dotfiles/config/mpv/mpv.conf'
  alias mi='e ~/.dotfiles/config/mpv/input.conf'
  alias ke='e ~/.dotfiles/karabiner/private.xml'
  alias sshe='e ~/.ssh/config'
  alias te='e ~/.dotfiles/tmux.conf'
  alias ve='e ~/.dotfiles/vim/init.vim'
  alias ze='e ~/.dotfiles/zshrc'
  alias zs='source ~/.zshrc'

  # Git
  alias amend='git commit --amend'
  alias fixgit='git config branch.master.remote origin && git config branch.master.merge refs/heads/master'
  alias gitundo='git commit --amend'
  alias gld='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format}'
  alias gldd='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} -- . ":(exclude)*.lock"'
  alias glddr='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} --reverse -- . ":(exclude)*.lock"'
  alias gldr='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} --reverse'
  alias gstats='git-bstats'
  alias gsum='git-summary | head -n 27'
  alias ginfo='gsum && gch && loc_hack && longcode'
  alias ginit='git init && git add . && git commit -m "Add initial"'
  alias gap='git add -p'

  eval "$(hub alias -s)"

  # App
  alias mongostart='brew services start mongodb'
  alias bash='/usr/local/bin/bash'
  alias pipi='pip install -r requirements.txt'
  alias pipf='pip freeze > requirements.txt'
  alias ctag='ctags -R --exclude=.git --exclude=log *'
  alias gtag='gotags -R --exclude=.git --exclude=log *'
  alias cism='exercism'
  alias hot="ansiweather | tr '-' '\n' |tr '\>' '\n'"
  alias lnew='ls -tl | head -n 20'
  alias ls='ls -F'
  alias nosleep=caffeinate
  alias ngh='npm repo'
  alias playall='mpv **/*.(mp4|webm|mkv|mov|m4v|avi) > /dev/null 2>&1 &'
  alias ra='ranger-cd'
  alias Ra='ranger'
  # alias rcup="command rcup -v | grep -v identical"
  alias rr='rails'
  alias rrdb='rails dbconsole'
  alias st='speedtest'
  alias t1='tree -L 1 * | less -F'
  alias tl='tldr'
  alias tmuxks='tmux kill-session -t'
  alias tmuxr='tmux rename-session'
  alias tre='tree -C | less'
  alias tw='timew'
  alias ptpy='python -m ptpython'
  alias vim='nvim'
  alias vs='vim -S Session.vim'
  alias vsql='e -c "setf sql"'
  alias wh='which'
  alias wha='whatis'
  alias routen='netstat -nr'
  alias whe='whereis'
  alias wifi='airport -s'
  alias ydm='youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -f "(mp4)[height<1280]" -cio "%(title)s.%(ext)s"'
  alias yda='youtube-dl -x --audio-format mp3'
  alias you='mpsyt'
  alias hp='http-prompt'
  alias aria='aria2c --file-allocation=falloc -c -x 10 -s 10'
  alias cplay='cd ~/Media/config/playlists'
  alias cref='cd ~/Development/Reference'
  alias chromext='cd ~/Library/Application\ Support/Google/Chrome/Default'
  alias quicklook='qlmanage -p "$@" >& /dev/null'
  alias top='sudo htop'
  alias N='notify'
  alias brewn='brew info'
  alias brews='brew search'
  alias caskn='brew cask info'
  alias le='exa --long --git --sort=created --group-directories-first'
  alias ll='lsd -la'
  alias x=''

  # Misc
  alias saythai='say -v Kanya -r 155'
  alias topen='today | xargs nvim'
  alias epoch="date -r"
  alias fnptr='rg -p "\(\*\w+\)\(" | less -RFX'

  # Archives
  alias dz='rm -rf *zip'
  alias uz='unarchive *zip'

  # Bundler
  alias be='bundle exec'
  alias bi='bundle install'
  alias bu='bundle update'

  # python
  alias workoff='deactivate'
  alias vew='virtualenvwrapper'

  # Yarn
  alias y='yarn'
  alias ya='yarn add'
  alias yad='yarn add --dev'
  alias yi='yarn install'
  alias ys='yarn start'
  alias yt='yarn test'

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
    alias a2dismod='sudo a2dismod'
    alias a2dissite='sudo a2dissite'
    alias a2enmod='sudo a2enmod'
    alias a2ensite='sudo a2ensite'
    alias ack='ack-grep'
    alias apache2ctl='sudo /etc/init.d/apache2'
    alias free='free -m'
    alias fullupgrade='sudo aptitude full-upgrade'
    alias install='sudo aptitude install'
    alias ls='ls --color=auto'
    alias nginxrestart='sudo /etc/init.d/nginx restart'
    alias remove='sudo aptitude remove'
    alias search='aptitude search'
    alias show='aptitude show'
    alias update='sudo aptitude update'
    alias upgrade='sudo aptitude safe-upgrade'

    # Stuff That's Available on Mac and Linux, but with different commands
    alias apacherestart='sudo /etc/init.d/apache2 restart'
    alias hosts='e -N /etc/hosts'
    alias mysqlrestart='sudo /etc/init.d/mysql restart'
    alias sshkey='cat $HOME/.ssh/id_rsa.pub'
    alias updatedb='sudo updatedb'
    alias zshrc='e -N $HOME/.zshrc && source $HOME/.zshrc'
  fi
fi
