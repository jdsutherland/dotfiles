export CLICOLOR=xterm
if [[ -o interactive ]]; then
  # alias cd..='cd ..'
  # alias ..='cd ..'
  alias cdb='cd -'
  # Copy-pasting `$ python something.py` works
  alias \$=''

  # Arguments and pipes
  alias -g A='| ack -i --context'
  alias -g L='| less -r'
  alias -g R='| rg -i'
  alias -g V='| nvim -'
  alias a='ag --workers 8 --pager "less -R"'
  alias agh='ag --hidden'
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias als='alias | ack'
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  alias dif='git diff --no-index'
  alias f='ag -g'
  alias fa='alias | fzf'
  alias fag='ag --nobreak --nonumbers --noheading . | fzf'
  alias fh='ag --unrestricted -g'
  alias fls='functions | ack'
  alias fw='{ alias; functions; } | fzf'

  # Directories
  alias vids='cd /Volumes/seag8silver/vids'
  alias books='cd ~/Books'
  alias cdl='cd ~/Downloads'
  alias ctil='cd ~/Notes/til'
  alias cdoc='cd ~/Documents'
  alias cgo='cd $GOPATH/src'
  alias notes='cd ~/Notes'
  alias desk='cd ~/Desktop'
  alias dev='cd ~/Development'
  alias dockerdir='~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/'
  alias dot='cd ~/.dotfiles'
  alias drop='cd ~/Dropbox'
  alias interview='cd ~/Development/Interview'
  alias med='cd ~/Media'
  alias oss='cd ~/Development/OSS'
  alias prg='cd ~/Documents/Programming'
  alias proj='cd ~/Development/Projects'
  alias itunes="cd /Users/jeff/Music/iTunes/iTunes\ Media/Music/Unknown\ Artist/Unknown\ Album"
  alias s8='cd /Volumes/seag8'
  alias s8m='cd /Volumes/seag8/Media'
  alias s8p='cd /Volumes/seag8/Media/dev-learning/pluralsight'
  alias r8='ranger-cd /Volumes/seag8/Media'
  alias tutorials='cd ~/Development/Tutorials'
  alias cnv='cd ~/.config/nvim'

  # PS
  alias psa='ps aux'
  alias psr='ps aux | grep ruby'

  # Dotfiles
  alias cbin='cd ~/.dotfiles/bin'
  alias ae='e ~/.dotfiles/zsh/aliases.zsh'
  alias fe='e ~/.dotfiles/zsh/functions.zsh'
  alias ge='e ~/.dotfiles/gitconfig'
  alias mpve='e ~/.dotfiles/config/mpv/mpv.conf'
  alias mpvi='e ~/.dotfiles/config/mpv/input.conf'
  alias mpvr="mpv --script-opts=radiostart=true"
  alias se='e ~/.dotfiles/slate'
  alias me='e ~/.dotfiles/config/mpv/mpv.conf'
  alias ke='e ~/.dotfiles/karabiner/private.xml'
  alias sshe='e ~/.ssh/config'
  alias te='e ~/.dotfiles/tmux.conf'
  alias ve='e ~/.dotfiles/vim/init.vim'
  alias ze='e ~/.dotfiles/zshrc'
  alias zenv='e ~/.dotfiles/zshenv'
  alias zkey='e ~/.dotfiles/zsh/key-bindings.zsh'
  alias zs='source ~/.zshrc'

  # Git
  alias amend='git commit --amend'
  alias fixgit='git config branch.master.remote origin && git config branch.master.merge refs/heads/master'
  alias ga='git add'
  alias gad='git add .'
  alias gadu='git add -u .'
  alias gb='git branch'
  alias gbc='gdc'
  alias gca='git commit -a'
  alias gcaa='git commit -a --amend -C HEAD'
  alias gch='git-churn | tail -r -n 20'
  alias gcl='git clone'
  alias gcm='git commit -m'
  alias gco='git checkout'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gdm='git diff master'
  alias gignore='git-ignore-io -a'
  alias gitdbg='git ci -am 'dbg' && git pull origin master && git push origin master'
  alias gitp='git pull origin master && git push origin master'
  alias gitundo='git commit --amend'
  alias gld='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format}'
  alias gldd='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} -- . ":(exclude)*.lock"'
  alias glddr='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} --reverse -- . ":(exclude)*.lock"'
  alias gldr='git log --topo-order --stat --patch --pretty=format:${_git_log_medium_format} --reverse'
  alias glf='g pb'
  alias glfr='g pba'
  alias gst='git status -s .'
  alias gstats='git-bstats'
  alias gsum='git-summary | head -n 27'
  alias ginfo='gsum && gch && loc_hack'

  eval "$(hub alias -s)"

  # App
  alias mongostart='brew services start mongodb'
  alias eclim="/Applications/Eclipse\ Java.app/Contents/Eclipse/eclimd &"
  alias G6='googler -c com -l en -t m6'
  alias G='googler -c com -l en'
  alias Gd='googler -c com -l en -n 3 define'
  alias Gpdf='googler -c com -l en filetype:pdf'
  alias Gy='googler -c com -l en -t y1'
  alias ack='nocorrect ack'
  alias bash='/usr/local/bin/bash'
  alias brewa='brewu && brewc && caskc'
  alias brewumpv='brew reinstall --with-vapoursynth --with-libarchive --with-bundle --HEAD mpv'
  alias copyloc='locateme -f "{LAT} {LON}" | pbc'
  alias ctag='ctags -R --exclude=.git --exclude=log *'
  alias gtag='gotags -R --exclude=.git --exclude=log *'
  alias dm='docker-machine'
  alias doc='docker'
  alias f60='find -mmin -60'
  alias fb='fb-messenger-cli'
  alias fore="ansiweather -l Bangkok -F | tr '-' '\n' |tr '\>' '\n'"
  alias gap='git add -p'
  alias grep='grep --color=auto -i'
  alias h='how2'
  alias hot="ansiweather | tr '-' '\n' |tr '\>' '\n'"
  alias irc='weechat'
  alias jtag='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
  alias lnew='ls -tl | head -n 20'
  alias ls='ls -F'
  alias nosleep=caffeinate
  alias npmimport='xargs npm install --global < ~/.dotfiles/Npmfile'
  alias nvimu='brew reinstall --HEAD neovim'
  alias playall='mpv **/*.(mp4|webm|mkv|mov|m4v|avi) > /dev/null 2>&1 &'
  alias ra='ranger-cd'
  alias Ra='ranger'
  alias rcup="command rcup -v | grep -v identical"
  alias rr='rails'
  alias rrdb='rails dbconsole'
  alias rsync='rsync'
  alias st='speedtest'
  alias syt='mpsyt'
  alias t1='tree -L 1 * | less -F'
  alias t='task'
  alias ta='task add'
  alias tasks='task list'
  alias tidyh='tidy -config ~/.tidy.conf'
  alias tl='tldr'
  alias tmux='tmux -2'
  alias tmuxks='tmux kill-session -t'
  alias tmuxr='tmux rename-session'
  alias tre='tree -C | less'
  alias tw='timew'
  alias twitter='rainbowstream'
  alias reddit='BROWSER=rtv_browser rtv'
  alias py2='python2 -m ptpython'
  alias py3='python3 -m ptpython'
  alias vim='nvim'
  alias vs='vim -S Session.vim'
  alias vsql='e -c "setf sql"'
  alias wale='whalebrew'
  alias wh='which'
  alias wifi='airport -s'
  alias diswifi='sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z'
  alias ydm='youtube-dl --embed-subs --no-mtime --no-overwrites --restrict-filenames -f "(mp4)[height<1280]" -cio "%(title)s.%(ext)s"'
  alias you='mpsyt'
  alias hp='http-prompt'
  alias ariachrome='aria2c -c -x 10 -s 10 --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all=true'
  alias aria='aria2c --file-allocation=falloc -c -x 10 -s 10'
  alias cplay='cd ~/Media/config/playlists'
  alias chromext='cd ~/Library/Application\ Support/Google/Chrome/Default'
  alias quicklook='qlmanage -p "$@" >& /dev/null'
  alias top='sudo htop'
  alias N='notify'
  alias bsyncall='browser-sync start --server --files . > /dev/null 2>&1 &'
  alias jn='jupyter notebook'
  alias brewn='brew info'
  alias brews='brew search --desc'
  alias caskn='brew cask info'
  alias le='exa --long --git --sort=created --group-directories-first'
  alias x=''

  # Misc
  alias saythai='say -v Kanya -r 155'
  alias topen='today | xargs nvim'
  alias epoch="date -r"

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

  # feh
  alias feh='feh --quiet --verbose --action8 "nrm %F"'

  # Alias structure:
  # feh[theme][recursive?][slide-delay?]
  # theme = [f]ullscreen | [i]ndex | [j]ust | [t]humbnail
  # recursive: r for recursive, nothing otherwise
  # slide-delay:
  #     none   - no slideshow
  #     x      - slideshow, seconds will be specified on commandline
  #              (like "fehfrx 7 .")
  # The themes are defined in ~/.fehrc
  alias fehe='feh -Texif'
  alias feher='feh -Texif --recursive'
  alias fehf='feh -Tfs'
  alias fehfr='feh -Tfs --recursive'
  alias fehi='feh .fehindex.jpg'
  alias fehj='feh -Trfs'
  alias fehjr='feh -Trfs --recursive'
  alias fehjx='feh -Trfs --slideshow-delay'
  alias fehfx='feh -Tfs --slideshow-delay'
  alias fehjrx='feh -Trfs --recursive --slideshow-delay'
  alias fehfrx='feh -Tfs --recursive --slideshow-delay'
  alias feht='feh -Tthumb_s'
  alias fehtr='feh -Tthumb_s --recursive'
  alias fehtb='feh -Tthumb_b'
  alias fehtbr='feh -Tthumb_b --recursive'
  alias fehtn='feh -Tthumb_s_nt'
  alias fehtnr='feh -Tthumb_s_nt --recursive'
  alias fehtnb='feh -Tthumb_b_nt'
  alias fehtnbr='feh -Tthumb_b_nt --recursive'

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
