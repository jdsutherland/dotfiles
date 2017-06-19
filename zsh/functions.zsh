# `-` by itself will act like `cd -`. Needs to be a function because `alias -`
# breaks.
function -() { cd - }

# If piping something in, copy it.
# If just doing `clip`, paste it.
clip() { [ -t 0 ] && pbpaste || pbcopy;}

fzf-vim-open() {
  local file
  file=$(fzf --height 100% --preview "(coderay {} || cat {}) 2> /dev/null")

  if [[ -n $file ]]; then
     </dev/tty > /dev/tty 2>&1 vim $file
  fi
}

# open vim with preview
vp() {
  files=$(fzf-down-full -m --select-1 --exit-0 --preview "(coderay {} || cat {}) 2> /dev/null")
  [[ -n "$files" ]] && vim "${files[@]}"
}

# agv - use ag and fzf to open result in vim in matching line
agv () {
  CHOICE=$(ag --color $* | fzf -0 -1 --ansi)
  if [ ! -z "$CHOICE" ]; then
    # Open vim at the selected file and line, but also run the Ag scan
    # the ! on Ag! stops Ag jumping to the first match, and the wincmd gives the editor window focus
    nvim $( echo "$CHOICE" | awk 'BEGIN { FS=":" } { printf "+%d %s\n", $2, $1 } ') +"Ag! '$*'" "+wincmd k"
  fi
}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

take() {
  mkdir $1
  cd $1
}


# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# List desc count of filetypes
fcount() {
  print -rl **/?*.*(.:e) | uniq -c |sort -k1nr
}

conflicted() {
  vim +Conflicted
}

# c - browse chrome history
c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# fv [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fv() {
  IFS='
'
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS
}

# fh - repeat history
fzh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# ff - cd into the directory of the selected file
ff() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# T - tree color with paging
T() {
  tree -I 'node_modules' $1 -C | less -F
}

# tree hidden fzf
Th() {
  tree -a -I 'node_modules' $1 -C | fzf
}

# trees - tree with size and depth param (useful for media)
trees() {
  if [ "$1" -gt 0 ]; then
    tree -C -h -L "$1" | less -R
  else
    # defaults to 2
    tree -C -h -L 2 | less -R
  fi
}

z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# jscsa - airbnb
jscsa() {
  jscs $1 --preset=airbnb
}

# jscsf - airbnb fix
jscsf() {
  jscs $1 --preset=airbnb --fix
}

# Repeatedly try to connect to a host which is booting
# ssh's return code is a little unhelpful as it doesn't distinguish the failure
# reason properly so this is a little naive
try_ssh () {
  SUCCESS=0
  while [ $SUCCESS -eq 0 ]; do
    ssh -o "ConnectTimeout 30" $*
    RESULT=$?
    if [ $RESULT -ne 255 ]; then
      SUCCESS=1
    else
      echo "--> SSH return code was $RESULT"
      print "Waiting to retry ssh..."
      sleep 10
      echo "--> Retrying..."
    fi
  done
}

push_ssh_cert() {
    local _host
    test -f ~/.ssh/id_rsa.pub || ssh-keygen -t dsa
    for _host in "$@";
    do
        echo $_host
        ssh $_host 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
    done
}

push_ssh_key() {
  local _host
  test -f ~/.ssh/id_rsa.pub
  for _host in "$@";
  do
    echo $_host
    scp ~/.ssh/id_rsa.pub $_host:~/.ssh/id_rsa.pub
    scp ~/.ssh/id_rsa $_host:~/.ssh/id_rsa
  done
}

# git log diff filetype
gldft() {
  git log --follow --patch -- "*.${1}"
}

# open gh page of an npm package
ngh() {
  b "http://ghub.io/${1}"
}

# sets up airbnb eslint for project
setup_airbnb() {
  yarn add dev eslint
  npm info eslint-config-airbnb@latest peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs yarn add --dev eslint-config-airbnb@latest
  echo '{\n  "extends": "airbnb"\n}' > .eslintrc.json
}

setup_babel() {
  yarn add --dev babel-cli
  yarn add --dev babel-preset-env
  yarn add --dev nodemon
  yarn add babel-polyfill

  scripts=`cat <<EOF
  "scripts": {
    "start": "yarn dev:start",
    "dev:start": "nodemon -e js,jsx --ignore lib --ignore dist --exec babel-node src",
    "compile": "babel src -d lib --ignore spec.js",
    "test": "yarn compile \&\& mocha --compilers js:babel-core/register test"
  }
}
EOF
`
  # sanitize to work with sed
  scripts=${scripts//\//\\\/}
  scripts=${scripts//$'\n'/\\$'\n'}
  # replace last } with scripts
  gsed -i "s/^}/$scripts/" package.json

  babelrc=`cat <<EOF
{
  "presets": [
    "env"
  ]
}
EOF
`
  echo "$babelrc" > .babelrc
}

setup_js_proj() {
  setup_airbnb
  setup_babel
}

# prints current LAT, LON coords
getloc() {
  locateme -f "{LAT} {LON}"
}

# gets uber price from given a destination
uberp() {
  uber price -s "$(getloc)" -e $1
}

# opens a google map direction age given a destination
mdir() {
  ${(z)BROWSER} "https://www.google.com/maps/dir/$(getloc)/${1}"
}

# colorized less output
cless () {
    pygmentize -f terminal "$1" | less -R
}

git-commit-browser() {
  if [[ -d '.git/' ]]; then
    glg --color=always "$@" |
    fzf --ansi \
      --no-sort \
      --reverse \
      --tiebreak=index \
      --bind=ctrl-s:toggle-sort \
      --preview "echo {} |
        grep --only-matching '[a-f0-9]\{7\}' |
        head -1 |
        xargs -I % sh -c 'git show --color=always --format="" % |
        diff-so-fancy |
        head -$LINES'" \
      --bind "enter:execute:echo {} |
        grep --only-matching '[a-f0-9]\{7\}' |
        head -1 |
        xargs -I % sh -c 'vim fugitive://\$(git rev-parse --show-toplevel)/.git//% < /dev/tty'"
  else
    echo 'Not a git repository'
  fi
}

fp() {
  ag -g "$@" | less -RFX
}

# ripgrep with paging
r() {
  rg -j 8 -p "$@" | less -RFX
}

# ripgrep hidden
rh() {
  rg -uu -j 8  -p "$@" | less -RFX
}

# find dirnames
lf() {
  l A "$@"
}

# find uniq dirnames
funiq() {
  f "$@" | cut -d'/' -f1,2 | uniq
}

hl() {
  how2 -l "$@"
}
ha() {
  howdoi -ca "$@"
}

# refresh path for disconnected drive
ref() {
  cd `pwd`
}

# gets the total running time of videos recursively from the working dir
vidtime() {
  exiftool -n -q -p '${Duration;our $sum;$_=ConvertDuration($sum+=$_)}' **/*.(mp4|webm|mkv|mov) | tail -n1
}

unpackvideo() {
  uz && dz && detox -r * && vidtime | pbcopy
}

unpackudc() {
  uz && dz && detox -r * && vidtime && mv -n */* . && rmdir *
}

# open clipboard link with mpv
mp() {
  mpv $(pbpaste) &
}

pget() {
  cd /tmp
  rm -rf *.magnet
  pirate-get "$@"
}

tget() {
  cd /tmp
  aria2c -c -x 10 -s 10 "$@" "$(cat *.magnet)"
}

# recursively run detox to fix filenames in all dirs
fixnames() {
  for i in **/*;do detox $i; done
}

detoxl() { for i in *; do detox $i; done }

2digit0pad() {
  for i in [0-9]-*; do mv "$i" "0$i"; done
}

imv() {
  local src dst
  for src; do
    [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
    dst=$src
    vared dst
    [[ $src != $dst ]] && mkdir -p $dst:h && mv -n $src $dst
  done
}

# mpv subtitle
# TODO: make it not suck
mpvs() {
  local file="$1"
  mpv --sub-file="$2" "$file"
}

# google open w3m
Gt() {
  BROWSER=w3m googler $@
}

npmexport() {
  npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > ~/.dotfiles/Npmfile
}

F() {
  find . -type d -name "*$1*" -print 2>/dev/null
}

# resumes at given index
ydlps() {
  youtube-dl --restrict-filenames -cio "%(autonumber)s-%(title)s.%(ext)s" --playlist-start $2 --autonumber-start $2 $1
}

# downloads playlist in medium format
ydlpm() {
  youtube-dl --restrict-filenames -f '(mp4)[height<1280]' -cio "%(autonumber)s-%(title)s.%(ext)s" $1
}

## Docker
# Stop all containers
dstop() { docker stop $(docker ps -a -q); }
# Remove all containers
drm() { docker rm $(docker ps -a -q); }
# Remove all images
dri() { docker rmi $(docker images -q); }
# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }
# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

sth() {
  say -v Kanya $(trans -b :th "$@")
}

sths() {
  say -v Kanya -r 130 $(trans -b :th "$@")
}

# using rsync locally (doesn't delete by default)
rlocal() {
  rsync -avhW --no-compress --progress $@
}

backup-seag8-to-silver() {
  rlocal ~/Development /Volumes/seag8silver/
  rlocal /Volumes/seag8 /Volumes/seag8silver/seag8
}

bo() {
  book_title=$1
  take $book_title
  pbpaste | pup '#text' | pandoc -f html --to markdown_github -o "$book_title.md"
  popd
}

# convert copied page source html to markdown
html_clipboard_to_markdown() {
  css_selector=$1
  fname=$2
  pbpaste | pup "$css_selector" | pandoc -f html --to markdown_github -o "$fname.md"
}

# find name
fn() {
  find . -iname "*$@*"
}

finde() {
  find . -iname "*$1*" -exec "$2" {} \;
}

ps_latest() {
  http https://www.pluralsight.com/browse | pup ".search-result__title a text{}" 
  echo
  echo "Open in browser?"
  read -r response
  case $response in
    [yY])
      ${(z)BROWSER} "https://pluralsight.com/browse"
  esac
}

change_screenshot_format() {
  format="$1"
  defaults write com.apple.screencapture type "$format" && killall SystemUIServer
}

brewS() {
  brew search "$@"
  brew cask search "$@"
}

fzf-git-reverse() {
  git log --oneline --reverse --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" |
  fzf --ansi --no-sort --reverse --tiebreak=index --height 100% --bind=ctrl-o:toggle-sort \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always --format="" | diff-so-fancy' \
    --bind "ctrl-m:execute:
              (grep -o '[a-f0-9]\{7,\}' | head -1 |
              xargs -I % sh -c 'git show --color=always --notes % | diff-so-fancy | less -R ') << 'FZF-EOF'
              {}
  FZF-EOF"
  clear
}

ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

# fuzzy mpv
fmpv() {
  mpv $(fzf -m) > /dev/null 2>&1 &
}

# search a directory name to begin fzf with
Fmpv() {
  mpv $(F $@ | fzf -m) > /dev/null 2>&1 &
}

dircount() {
  find . -mindepth 1 -type d | wc -l
}

restart-postgres() {
  rm /usr/local/var/postgres/postmaster.pid && ( \
    cd ~/Library/LaunchAgents && \
      launchctl unload homebrew.mxcl.postgresql.plist && \
      launchctl load -w homebrew.mxcl.postgresql.plist \
  )
}
