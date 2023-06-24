if [[ -o interactive ]]; then
  alias cd..='cd ..'
  alias ..='cd ..'
  alias ...="cd ../.."
  # Copy-pasting `$ python something.py` works
  alias \$=''

  # Arguments and pipes
  alias -g L='| less -R'
  alias -g R='| rg -i'
  alias -g V='| nvim -'
  alias -g E='| rg --invert-match'
  alias -g H='| head -n 20'
  alias -g C='| wc -l'
  alias -g X='| xargs'
  alias -g XX='| xargs -I{}'
  alias -g DIR="| cut -d '/' -f1 | sort | uniq"
  # pipe to nvim as vsplits
  alias -g XV='| xargs nvim -O -'
  # remove ansi escape colors
  alias -g DECOLOR="| gsed -r 's/\x1B\[(;?[0-9]{1,3})+[mGK]//g'"
  alias -g SILENT="> /dev/null 2>&1"
  alias count='wc -l'
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  # alias diff='colordiff -wu'
  alias fw='{ alias; functions; } | fzf'

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
  alias s2='cd /Volumes/sd256'
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
  alias mpve='e ~/.dotfiles/config/mpv/mpv.conf'
  alias mpvi='e ~/.dotfiles/config/mpv/input.conf'
  alias mpvr="mpv --script-opts=radiostart=true"
  alias se='e ~/.dotfiles/slate'
  alias me='e ~/.dotfiles/config/mpv/mpv.conf'
  alias mi='e ~/.dotfiles/config/mpv/input.conf'
  alias sshe='e ~/.ssh/config'
  alias te='e ~/.dotfiles/tmux.conf'
  alias ve='e ~/.dotfiles/config/nvim/init.vim'
  alias ze='e ~/.dotfiles/zshrc'
  alias zs='source ~/.zshrc'

  # Git {{{
  _git_log_medium_format='%C(bold)Commit:%C(reset) %C(yellow)%H%C(auto)%d%n%C(bold)Author:%C(reset) %C(bold blue)%an <%ae>%n%C(bold)Date:%C(reset)   %C(cyan)%ai (%ar)%C(reset)%n%+B'
  _git_log_oneline_format='%C(yellow)%h%C(reset) %s%C(auto)%d%C(reset)'
  _git_log_oneline_medium_format='%C(yellow)%h%C(reset) %<|(60,trunc)%s %C(bold blue)<%an> %C(reset)%C(cyan)(%ar)%C(auto)%d%C(reset)'
  _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

  alias amend='git commit --amend'
  alias fixgit='git config branch.master.remote origin && git config branch.master.merge refs/heads/master'
  alias gitundo='git commit --amend'
  alias gstats='git-bstats'
  alias gsummary='git-summary | head -n 18 | grep -v "\[bot\]"'
  alias gchurn='git-churn 2> /dev/null | tail -r -n 15'
  alias ginfo='gsummary && echo " churn:" && gchurn && echo " longest files:" && longcode && loc'
  alias ginit='git init && git add . && git commit -m "Add initial"'
  alias gap='git add -p'
  alias gst='git status'
  alias gad='git add .'
  alias gI='forgit::ignore >> .gitignore'
  alias grooter='cd $(git root)'

  # Branch (b)
  alias gb='git branch'
  alias gba='git branch --all --verbose'
  # alias gbc='git checkout -b'
  alias gbd='git branch --delete'
  alias gbD='git branch --delete --force'
  alias gbl='git branch --verbose'
  alias gbL='git branch --all --verbose'
  alias gbm='git branch --move'
  alias gbM='git branch --move --force'
  alias gbr='git branch --move'
  alias gbR='git branch --move --force'
  alias gbs='git show-branch'
  alias gbS='git show-branch --all'
  alias gbv='git branch --verbose'
  alias gbV='git branch --verbose --verbose'
  alias gbx='git branch --delete'
  alias gbX='git branch --delete --force'

  # Commit (c)
  alias gc='git commit --verbose'
  alias gca='git commit --verbose --all'
  alias gcm='git commit --message'
  alias gcS='git commit -S --verbose'
  alias gcSa='git commit -S --verbose --all'
  alias gcSm='git commit -S --message'
  alias gcam='git commit --all --message'
  alias gco='git checkout'
  alias gcO='git checkout --patch'
  # alias gcf='git commit --amend --reuse-message HEAD'
  alias gcSf='git commit -S --amend --reuse-message HEAD'
  alias gcF='git commit --verbose --amend'
  alias gcSF='git commit -S --verbose --amend'
  alias gcp='git cherry-pick --ff'
  alias gcP='git cherry-pick --no-commit'
  alias gcr='git revert'
  alias gcR='git reset "HEAD^"'
  alias gcs='git show --patch-with-stat'
  alias gcsS='git show --pretty=short --show-signature'
  alias gcl='git-commit-lost'
  alias gcy='git cherry -v --abbrev'
  alias gcY='git cherry -v'

  # Conflict (C)
  alias gCl='git --no-pager diff --name-only --diff-filter=U'
  alias gCa='git add $(gCl)'
  alias gCe='git mergetool $(gCl)'
  alias gCo='git checkout --ours --'
  alias gCO='gCo $(gCl)'
  alias gCt='git checkout --theirs --'
  alias gCT='gCt $(gCl)'

  # Data (d)
  # alias gd='git ls-files'
  alias gdc='git ls-files --cached'
  alias gdx='git ls-files --deleted'
  alias gdm='git ls-files --modified'
  alias gdu='git ls-files --other --exclude-standard'
  alias gdk='git ls-files --killed'
  alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

  # Fetch (f)
  alias gf='git fetch'
  alias gfa='git fetch --all'
  alias gfc='git clone'
  alias gfcr='git clone --recurse-submodules'
  alias gfm='git pull'
  alias gfma='git pull --autostash'
  alias gfr='git pull --rebase'
  alias gfra='git pull --rebase --autostash'

  # Flow (F)
  alias gFi='git flow init'
  alias gFf='git flow feature'
  alias gFb='git flow bugfix'
  alias gFl='git flow release'
  alias gFh='git flow hotfix'
  alias gFs='git flow support'

  alias gFfl='git flow feature list'
  alias gFfs='git flow feature start'
  alias gFff='git flow feature finish'
  alias gFfp='git flow feature publish'
  alias gFft='git flow feature track'
  alias gFfd='git flow feature diff'
  alias gFfr='git flow feature rebase'
  alias gFfc='git flow feature checkout'
  alias gFfm='git flow feature pull'
  alias gFfx='git flow feature delete'

  alias gFbl='git flow bugfix list'
  alias gFbs='git flow bugfix start'
  alias gFbf='git flow bugfix finish'
  alias gFbp='git flow bugfix publish'
  alias gFbt='git flow bugfix track'
  alias gFbd='git flow bugfix diff'
  alias gFbr='git flow bugfix rebase'
  alias gFbc='git flow bugfix checkout'
  alias gFbm='git flow bugfix pull'
  alias gFbx='git flow bugfix delete'

  alias gFll='git flow release list'
  alias gFls='git flow release start'
  alias gFlf='git flow release finish'
  alias gFlp='git flow release publish'
  alias gFlt='git flow release track'
  alias gFld='git flow release diff'
  alias gFlr='git flow release rebase'
  alias gFlc='git flow release checkout'
  alias gFlm='git flow release pull'
  alias gFlx='git flow release delete'

  alias gFhl='git flow hotfix list'
  alias gFhs='git flow hotfix start'
  alias gFhf='git flow hotfix finish'
  alias gFhp='git flow hotfix publish'
  alias gFht='git flow hotfix track'
  alias gFhd='git flow hotfix diff'
  alias gFhr='git flow hotfix rebase'
  alias gFhc='git flow hotfix checkout'
  alias gFhm='git flow hotfix pull'
  alias gFhx='git flow hotfix delete'

  alias gFsl='git flow support list'
  alias gFss='git flow support start'
  alias gFsf='git flow support finish'
  alias gFsp='git flow support publish'
  alias gFst='git flow support track'
  alias gFsd='git flow support diff'
  alias gFsr='git flow support rebase'
  alias gFsc='git flow support checkout'
  alias gFsm='git flow support pull'
  alias gFsx='git flow support delete'

  # Grep (g)
  alias gg='git grep'
  alias ggi='git grep --ignore-case'
  alias ggl='git grep --files-with-matches'
  alias ggL='git grep --files-without-matches'
  alias ggv='git grep --invert-match'
  alias ggw='git grep --word-regexp'

  # Index (i)
  alias gia='git add'
  alias giA='git add --patch'
  alias giu='git add --update'
  alias gid='git diff --no-ext-diff --cached'
  alias giD='git diff --no-ext-diff --cached --word-diff'
  alias gii='git update-index --assume-unchanged'
  alias giI='git update-index --no-assume-unchanged'
  alias gir='git reset'
  alias giR='git reset --patch'
  alias gix='git rm -r --cached'
  alias giX='git rm -rf --cached'

  # Log (l)
  alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
  alias gls='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
  alias gld='git log --topo-order --stat --patch --full-diff'
  # alias glo='git log --topo-order --pretty=format:"${_git_log_oneline_format}"'
  alias glg='git log --topo-order --graph --pretty=format:"${_git_log_oneline_format}"'
  alias gla='git log --oneline --decorate --graph --all -30'
  alias glb='git log --topo-order --pretty=format:"${_git_log_brief_format}"'
  alias glc='git shortlog --summary --numbered'
  alias glS='git log --show-signature'

  # Merge (m)
  alias gm='git merge'
  alias gmC='git merge --no-commit'
  alias gmF='git merge --no-ff'
  alias gma='git merge --abort'
  alias gmt='git mergetool'

  # Push (p)
  alias gp='git push'
  # alias gpf='git push --force-with-lease'
  alias gpF='git push --force'
  alias gpa='git push --all'
  alias gpA='git push --all && git push --tags'
  alias gpt='git push --tags'
  alias gpc='git push --set-upstream origin "$(git symbolic-ref --short HEAD)"'
  alias gpj='git push --set-upstream jdsutherland "$(git symbolic-ref --short HEAD)"'
  alias gpf='git push --set-upstream fork "$(git symbolic-ref --short HEAD)"'

  # Rebase (r)
  alias gr='git rebase'
  alias gra='git rebase --abort'
  alias grc='git rebase --continue'
  alias gri='git rebase --interactive'
  alias grs='git rebase --skip'

  # Remote (R)
  alias gR='git remote'
  alias gRl='git remote --verbose'
  alias gRa='git remote add'
  alias gRx='git remote rm'
  alias gRm='git remote rename'
  alias gRu='git remote update'
  alias gRp='git remote prune'
  alias gRs='git remote show'
  alias gRb='git-hub-browse'

  # Stash (s)
  alias gs='git stash --include-untracked'
  alias gsa='git stash apply'
  alias gsx='git stash drop'
  alias gsX='git-stash-clear-interactive'
  alias gsl='git stash list'
  alias gsL='git-stash-dropped'
  alias gsd='git stash show --patch --stat'
  alias gsp='git stash pop'
  alias gsr='git-stash-recover'
  # alias gss='git stash save --include-untracked'
  alias gsS='git stash save --patch --no-keep-index'
  alias gsw='git stash save --include-untracked --keep-index'

  # Tag (t)
  alias gt='git tag'
  alias gtl='git tag -l'
  alias gts='git tag -s'
  alias gtv='git verify-tag'

  # diffs
  alias Gd='git diff --no-ext-diff'
  alias Gdc='git diff --no-ext-diff --cached'

  # Working Copy (w)
  alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
  alias gwS='git status --ignore-submodules=${_git_status_ignore_submodules}'
  alias gwd='git diff --no-ext-diff'
  alias gwD='git diff --no-ext-diff --word-diff'
  alias gwr='git reset --soft'
  alias gwR='git reset --hard'
  alias gwc='git clean -n'
  alias gwC='git clean -f'
  alias gwx='git rm -r'
  alias gwX='git rm -rf'
  # }}}

  eval "$(hub alias -s)"

  # App
  alias surgec='echo -ne '\n' | surge 2>/dev/null | egrep -o "\w+\.surge\.sh" | xargs -I{} echo "https://"{}'
  alias mongostart='brew services start mongodb'
  alias pipi='pip install -r requirements.txt'
  alias pipf='pip freeze > requirements.txt'
  alias ctag='ctags -R --exclude=.git --exclude=log *'
  alias gtag='gotags -R --exclude=.git --exclude=log *'
  alias cism='exercism'
  alias hot="ansiweather | tr '-' '\n' |tr '\>' '\n'"
  alias lnew='ls -tl | head -n 20'
  alias ls='ls -F'
  alias loc='tokei'
  alias o='open'
  alias nosleep=caffeinate
  alias ngh='npm repo'
  alias pvids='mpv **/*.(mp4|webm|mkv|mov|m4v|avi) > /dev/null 2>&1 &'
  alias ra='ranger-cd'
  alias Ra='ranger'
  # alias rcup="command rcup -v | grep -v identical"
  alias st='speedtest'
  alias t1='tree -L 1 * -C | less -F'
  alias th="tree -a -I 'node_modules|.git' -C"
  alias tl='tldr'
  alias tmuxks='tmux kill-session -t'
  alias tmuxr='tmux rename-session'
  alias tw='timew'
  alias pt='ptpython'
  alias py='python3'
  alias vim='nvim'
  alias vs='vim -S Session.vim'
  alias vsql='e -c "setf sql"'
  alias wh='which'
  alias wha='whatis'
  alias routen='netstat -nr'
  alias rga='rga -L'
  alias whe='whereis'
  alias wifi='airport -s'
  alias yda='youtube-dl -x --audio-format mp3'
  alias ysub='youtube-dl --write-auto-sub --convert-subs=srt --skip-download'
  alias you='mpsyt'
  alias hp='http-prompt'
  alias aria='aria2c --file-allocation=falloc -c -x 10 -s 10'
  alias cplay='cd ~/Media/config/playlists'
  alias cref='cd ~/Development/Reference'
  alias chromext='cd ~/Library/Application\ Support/Google/Chrome/Default'
  alias quicklook='qlmanage -p "$@" >& /dev/null'
  alias top='sudo htop'
  alias rr='rg -iL --no-messages'
  alias mre="fd -t f --exec gstat --printf='%Y\t%n\n' | sort -nr | head -10 | cut -f2"
  alias fh='fd -E node_modules -L -p --hidden --no-ignore --prune'
  alias agh='ag --hidden'
  alias rcp='rsync -ahz --progress'
  alias b='bat'
  alias rsum="ruby -e 'puts STDIN.read.split.map(&:to_i).sum'"

  # rails {{{
  alias Rporo="rg -t ruby 'class \w+$' -l"
  alias rrdb='rails dbconsole'
  # }}}

  # brew {{{
  alias brews='brew search'
  alias brewi='brew install'
  alias brewx='brew uninstall'
  alias caski='brew install --cask'
  alias casku='brew reinstall --cask'
  alias caskU='brew outdated --cask | xargs brew reinstall'
  alias caskx='brew uninstall --cask'
  alias brewn='brew info'
  alias caskn='brew info --cask'
  alias brewu='brew update && brew upgrade && brew cleanup'
  alias brewc='brew cleanup'
  # }}}

  alias l='exa --long --sort=modified --group-directories-first'
  alias le='exa --long --git --sort=created --group-directories-first'
  alias ll='lsd -la'
  alias x='xargs'
  alias xx='xargs -I{}'
  alias zf='z -I' # always use fzf select
  alias xee="open -a Xee³"
  alias apr="apropos"

  # Misc
  alias saythai='say -v Kanya -r 155'
  alias topen='today | xargs nvim'
  alias epoch="date -r"
  alias datef='date +"%d-%m-%Y"'
  alias fnptr='rg -p "\(\*\w+\)\(" | less -RFX'
  alias rm-nodemod='find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +'
  alias copysite='wget --mirror --convert-links --adjust-extension --page-requisites --no-parent'

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
