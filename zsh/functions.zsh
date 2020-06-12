# `-` by itself will act like `cd -`. Needs to be a function because `alias -`
# breaks.
function -() { cd - }

# If piping something in, copy it.
# If just doing `clip`, paste it.
clip() { [ -t 0 ] && pbpaste || pbcopy;}

fzf-vim-open() {
  local file
  file=$(fzf --height 100% --preview "bat --theme=TwoDark --color=always {}")

  if [[ -n $file ]]; then
     </dev/tty > /dev/tty 2>&1 vim $file
  fi
}

# open vim with preview
vp() {
  files=$(fzf-down-full -m --select-1 --exit-0 --preview "bat --theme=TwoDark --color=always {}")
  [[ -n "$files" ]] && vim "${files[@]}"
}

# agv - use ag and fzf to open result in vim in matching line
agv () {
  CHOICE=$(ag --color $* | fzf -0 -1 --ansi)
  if [ ! -z "$CHOICE" ]; then
    # Open vim at the selected file and line, but also run the Ag scan
    # the ! on Ag! stops Ag jumping to the first match, and the wincmd gives the editor window focus
    vim $( echo "$CHOICE" | awk 'BEGIN { FS=":" } { printf "+%d %s\n", $2, $1 } ') +"Rg '$*'" "+wincmd k"
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
  nvim +Conflicted
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

tdz() {
  tree -d -L 1 | fzf
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

gfwd() {
  git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout
}

gfirst() {
  git rev-list --max-parents=0 HEAD | xargs git checkout
}

# sets up airbnb eslint for project
setup_airbnb_eslint_yarn() {
  yarn add dev eslint
  npm info eslint-config-airbnb@latest peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs yarn add --dev eslint-config-airbnb@latest
  echo '{\n  "extends": "airbnb"\n}' > .eslintrc.json
}

setup_airbnb_eslint_npm() {
  npm install --save-dev eslint
  npm info eslint-config-airbnb@latest peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --save-dev eslint-config-airbnb@latest
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
  ${(z)BROWSER} "https://www.google.com/maps/dir/$(getloc)/$@"
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
  rg -S -p "$@" | less -RFX
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
  exiftool -n -q -p '${Duration;our $sum;$_=ConvertDuration($sum+=$_)}' **/*.(mp4|webm|mkv|mov|m4v|avi) | tail -n1
}

unpackvid() {
  uz && dz && detox -r * && vidtime | pbcopy
}

unpackudc() {
  uz && dz && detox -r * && vidtime && mv -n */* . && rmdir *
}

# recursively run detox to fix filenames in all dirs
fixnames() {
  for i in **/*;do detox $i; done
}

detoxr() { for i in **/*; do detox $i; done }

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

F() {
  find . -type d -iname "*$1*" -print 2>/dev/null
}

ydl() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -ci "$url"
}

ydlp() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --ignore-errors --download-archive archive.txt --output "%(autonumber)s-%(title)s.%(ext)s" "$url"
}

# resumes at given index
ydlps() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -f '(mp4)[height<1280]' -cio "%(autonumber)s-%(title)s.%(ext)s" --playlist-start $2 --autonumber-start $2 "$url"
}

ydlm() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -f '(mp4)[height<1280]' -cio "%(title)s.%(ext)s" "$url"
}

# downloads playlist in medium format
ydlpm() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f '(mp4)[height<1280]' -cio "%(autonumber)s-%(title)s.%(ext)s" "$url"
}

# open clipboard link with mpv
mp() {
  mpv $(pbpaste) &
}

ytn() {
  mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"'$*'"
}

yts() {
  mpv ytdl://ytsearch10:"'$*'"
}

# Pipe to this to quote filenames with spaces
alias quote="sed 's/.*/\"&\"/'"
# Files created today
alias today="days 0"
# Created in last n days
days(){
  local query="kMDItemFSCreationDate>\$time.today(-$1) && kMDItemContentType != public.folder"
  mdfind -onlyin . "$query" | quote
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
  rlocal ~/Development /Volumes/seag8blu/ --delete
  rlocal ~/Books /Volumes/seag8blu/ --delete
  rlocal ~/Development /Volumes/seag8silver/ --delete
  rlocal ~/Books /Volumes/seag8silver/ --delete
  rsync -avhW --no-compress --delete /Volumes/seag8silver/ /Volumes/seag8blu
  # rsync -avhW --no-compress /Volumes/seag8silver/Media/dev-learning/upcase /Volumes/seag8blu/Media/dev-learning/upcase
  # rsync -avhW --no-compress /Volumes/seag8silver/Media/dev-learning/destroy-all-software /Volumes/seag8blu/Media/dev-learning/destroy-all-software
  # rsync -avhW --no-compress /Volumes/seag8silver/Media/dev-learning/ruby-tapas /Volumes/seag8blu/Media/dev-learning/ruby-tapas
  # rsync -avhW --no-compress /Volumes/seag8silver/Media/dev-learning/pluralsight /Volumes/seag8blu/Media/dev-learning/pluralsight
  # rsync -avhW --no-compress /Volumes/seag8/Media/dev-learning/upcase /Volumes/seag8silver/Media/dev-learning/upcase
  # rsync -avhW --no-compress /Volumes/seag8/Media/dev-learning/pluralsight /Volumes/seag8silver/Media/dev-learning/pluralsight
  # rsync -avhW --no-compress /Volumes/seag8/Media/dev-learning/refactoring /Volumes/seag8silver/Media/dev-learning/refactoring
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

brewcd() {
  cd `brew --prefix "$1"`
}

fzf-git-reverse() {
  git log --no-merges --oneline --reverse --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" |
  fzf --ansi --no-sort --reverse --tiebreak=index --height 100% --bind=ctrl-o:toggle-sort \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always --date=format:"%Y-%m-%d %H:%M:%S" --patch-with-stat --format="%Cblue%an <%ae> %C(yellow)%ad %C(bold)(%ar)%Creset%n%Cblue%n %C(bold cyan)%s%Creset%n%n%C(italic cyan)%b%Creset" | diff-so-fancy' \
    --preview-window=right:55% \
    --bind "ctrl-m:execute:
              (grep -o '[a-f0-9]\{7,\}' | head -1 |
              xargs -I % sh -c 'git show --color=always --notes % | diff-so-fancy | less -R ') << 'FZF-EOF'
              {}
  FZF-EOF"
  clear
}

# fuzzy mpv
fmpv() {
  mpv $(fzf -m) > /dev/null 2>&1 &
}

# mpv dir only exact fzf
mf() {
  mpv $(ag -g . | find . -type d ! -path "*.git*" ! -path "*node_modules*" | fzf -e -m) > /dev/null 2>&1 &
}

# find files fzf
fz() {
  ag -g "$1" | fzf
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

bn() { basename "$@" }

dlmag() {
  if [[ $# -eq 0 ]]; then
    for e in *.magnet; do
      aria2c --file-allocation=falloc --seed-time=0 -c -x 10 -s 10 `cat $e` && rm -f "$e"
    done
  else
    aria2c --file-allocation=falloc --seed-time=0 -c -x 10 -s 10 `cat $@` && rm -f "$1"
  fi
}

# notify() {
#   text=${1:=Something finished}
#   osascript -e "display notification \"$text\" with title \"Alert\""
# }

# git clone append name
gcn() {
  name="$(basename $1)-$2"
  git clone $1 $name && cd $name
}

# git clone cd
gcd() {
  git clone $1 && cd $(basename $1)
}

# list new vids
llnv() {
  count=${1:-20}
  gfind . -regex '.*\.\(mp4\|webm\|mkv\|mov\|m4v\)' -exec stat -f '%c%t%Sm %N' {} + | sort -n | cut -d ' ' -f5- | tail -r -n "$count" | sed 's#.*/##' | less
}

# list new vids
lnv() {
  count=${1:-20}
  gfind . -regex '.*\.\(mp4\|webm\|mkv\|mov\|m4v\)' -exec stat -f '%c%t%Sm %N' {} + | sort -n | cut -d ' ' -f5- | tail -r -n "$count" | awk '{print $0,"\n"}' | less
}

profile_vim() {
  $HOME/Tools/vim-profiler/vim-profiler.py -p -r 10 nvim
}

# https://github.com/cgag/loc/issues/18
loc_hack() {
  loc $(git ls-files)
}

loc() {
  /usr/local/bin/loc $(git ls-files)
}

gauthor() {
  git log --topo-order --stat --patch "--author=$@"
}

gcommits() {
  hub browse -- "commit/$1"
}

gissues() {
  hub browse -- "issues/$1"
}

gpulls() {
  if [[ $1 ]]; then
    hub browse -- "pull/$1"
  else
    hub browse -- "pulls"
  fi
}

# opens pr page given sha
# gpr-sha <sha>
gpr-sha() {
  # TODO: use upstream env var: https://github.com/$GITHUB_UPSTREAM/${PWD##*/}/pull/%
  # http://joey.aghion.com/find-the-github-pull-request-for-a-commit/
  pr_num=`git log --merges --ancestry-path --oneline $1..master | grep 'pull request' | tail -n1 | awk '{print $5}' | cut -c2-`
  hub browse -- "pull/$pr_num"
}

subr() {
  for f in **/*.(mp4|webm|mkv|mov|m4v|avi); do subliminal download -l en $f; done
}

pdfg() {
  pdfgrep --color always -i "$1" **/*.pdf | less -R
}

# most recent photobooth vid
rvid() {
  vidpath="/Users/$USER/Pictures/Photo Booth Library/Pictures"
  vid=$(ls -Art "$vidpath" | tail -n 1) && mpv --player-operation-mode=pseudo-gui "$vidpath/$vid" &
}

longcode() {
  wc -l **/*.(js|go|rb|py|jsx|c|java|cs|cpp) | sort | tail -n 20 | sed '$d'
}

golong() {
  find . -not -path './vendor/*' -iname *.go -exec wc -l {} + | sort | tail -n 20 | sed '$d'
}

lnew1() { for d in `ls`;do (cd $d > /dev/null 2>&1 && lnew); done }

# trim protocol from copied url for go get
gogh() {
  package_path=$(echo "$1" | sed -E 's|https?://||g')
  go get "$package_path"
}

# open a github pr in diff-so-fancy
dif-pr() {
  url="$(dirname $1).patch"
  curl -L "$url" | diff-so-fancy | less -r
}

# cd dirname
cdd() { cd `dirname "$1"` }

# send to background no output
bkg() { "$@" > /dev/null 2>&1 & }

# get the root dirname of search
frootdir()  { ag -g "$1" | xargs -I {} dirname {} | cut -d '/' -f1 | uniq }

ajaxh() { http "$@" X-Requested-With:XMLHttpRequest }

