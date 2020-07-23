# `-` by itself will act like `cd -`. Needs to be a function because `alias -`
# breaks.
function -() { cd - }

# If piping something in, copy it.
# If just doing `clip`, paste it.
clip() { [ -t 0 ] && pbpaste || pbcopy;}

first() { awk '{print $1}' }
second() { awk '{print $2}' }
sum() { paste -sd+ - | bc }

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
ftcount() {
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

# fd - cd to selected directory
fcd() {
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

# refresh path for disconnected drive
ref() {
  cd `pwd`
}

# gets the total running time of videos recursively from the working dir
vidtime() {
  exiftool -n -q -p '${Duration;our $sum;$_=ConvertDuration($sum+=$_)}' **/*.(mp4|webm|mkv|mov|m4v|avi) | tail -n1
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

finde() {
  find . -iname "*$1*" -exec "$2" {} \;
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

notify() {
  text=${1:=Something finished}
  osascript -e "display notification \"$text\" with title \"Alert\""
}

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
newvids() {
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
  wc -l **/*.(js|go|rb|py|js|c) | sort | tail -n 20 | sed '$d'
}

golong() {
  find . -not -path './vendor/*' -iname *.go -exec wc -l {} + | sort | tail -n 20 | sed '$d'
}

# open a github pr in diff-so-fancy
difpr() {
  url="$(dirname $1).patch"
  curl -L "$url" | diff-so-fancy | less -r
}

# send to background no output
bkg() { "$@" > /dev/null 2>&1 & }

# get the root dirname of search
frootdir()  { ag -g "$1" | xargs -I {} dirname {} | cut -d '/' -f1 | uniq }

ajaxh() { http "$@" X-Requested-With:XMLHttpRequest }
