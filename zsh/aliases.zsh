export CLICOLOR=xterm
if [[ -o interactive ]]; then
  # alias cd..='cd ..'
  # alias ..='cd ..'
  alias cdb='cd -'
  # Copy-pasting `$ python something.py` works
  alias \$=''

  # Arguments and pipes
  alias -g A='| ack'
  alias -g L='| less'
  alias a='ag --pager "less -R"'
  alias agh='ag --hidden'
  alias als='alias | ack'
  alias f='ag -g'
  alias fa='alias | fzf'
  alias fag='ag --nobreak --nonumbers --noheading . | fzf'
  alias fh='ag --hidden -g'
  alias fls='functions | ack'
  alias fw='{ alias; functions; } | fzf'

  # Directories
  alias casts='cd ~/Documents/screencasts/'
  alias dev='cd ~/Development'
  alias dot='cd ~/.dotfiles'
  alias drop='cd ~/Dropbox'

  # PS
  alias psa='ps aux'
  alias psr='ps aux | grep ruby'

  # Dotfiles
  alias ae='e ~/.dotfiles/zsh/aliases.zsh'
  alias fe='e ~/.dotfiles/zsh/functions.zsh'
  alias ge='e ~/.dotfiles/gitconfig'
  alias ne='e ~/.vim/init.vim'
  alias se='e ~/.slate'
  alias te='e ~/.tmux.conf'
  alias ve='e ~/.vim/init.vim'
  alias ze='e ~/.zshrc'
  alias zs='source ~/.zshrc'

  # Git
  eval "$(hub alias -s)"
  alias amend='git commit --amend'
  alias fixgit='git config branch.master.remote origin && git config branch.master.merge refs/heads/master'
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
  alias gitdbg='git ci -am 'dbg' && git pull origin master && git push origin master'
  alias gitp='git pull origin master && git push origin master'
  alias gitundo='git commit --amend'
  alias gldr='gld --reverse'
  alias gst='git status'

  # App
  alias ack='nocorrect ack'
  alias ctag='ctags -R .'
  alias grep='grep --color=auto -i'
  alias irc='weechat'
  alias jtag='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
  alias ls='ls -F'
  alias n='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
  alias nvimu='brew reinstall --HEAD neovim'
  alias tl='tldr'
  alias tmux='tmux -2'
  alias tre='tree -C | less'
  alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
  alias vim='n'
  alias tidyh='tidy -config ~/.tidy.conf'

  # Bundler
  alias be='bundle exec'
  alias bi='bundle install'
  alias bu='bundle update'

  # Yarn
  alias y='yarn'

  # Common misspellings

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
