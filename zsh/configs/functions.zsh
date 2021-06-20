# `-` by itself will act like `cd -`. Needs to be a function because `alias -`
# breaks.
function -() { cd - }

# If piping something in, copy it.
# If just doing `clip`, paste it.
clip() { [ -t 0 ] && pbpaste || pbcopy;}

first() { awk '{print $1}' }
second() { awk '{print $2}' }
sum() { paste -sd+ - | bc }

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

# fb - open filename query in bat
fb() { fd -E node_modules -L -t file -p "$@" -X bat 2> /dev/null }
fB() { ag --follow 2> /dev/null -g $@ | xargs bat }
# rB - open rg query in bat
rB() { rg -SL --no-messages -l "$@" | xargs bat }

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

# prints current LAT, LON coords
getloc() {
  locateme -f "{LAT} {LON}"
}

# gets uber price from given a destination
uberp() {
  uber price -s "$(getloc)" -e $1
}

# opens a google map direction age given a destination
maps() { open "https://www.google.com/maps/dir/$(getloc)/$@" }

# tree with sensible ignores
t() {
  tree -I "migrate/*|fonts|images|node_modules|bin|obj|__pycache__|tmp|cache|*.lock|dist|jquery*" -C ${@:-.} | less -F
}

# tree 3 depth dir only
td() {
  tree -I "node_modules|bin|obj|__pycache__|tmp|cache|*.lock|dist|jquery*" -C -d -L 3 ${@:-.} | less -F
}

f() {
  fd -E node_modules -L -t file -p -c always "$@" | less -XRF
}

F() {
  fd -L --type d -c always "$@" | less -XRF
}

# ripgrep with paging
r() {
  rg --follow --no-messages --smart-case --pretty "$@" | less -r
}

# ripgrep hidden
rh() {
  rg --follow --no-messages -uu -p "$@" 2> /dev/null | less -r
}

# list of uniq words matching regex
runiq() {  rg -INo "$@" | awk NF | sort | uniq }

# find dirs containing: dircont query
rdir () { rg -L -l --no-messages "$@" | cut -d '/' -f1 | sort | uniq }

# rgv <query> rip-grep-vim - rg query | fzf | vim vsplit
rgv() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  local files
  IFS=$'\n' files=($(rg -S -l -L --no-messages "$*" | fzf --preview-window=right:57% --multi --select-1 --exit-0 --preview 'bat --color=always {}'))
  [[ -n "$files" ]] && ${EDITOR:-vim} -s <(printf "/$*\r") -O "${files[@]}" && print -l "$files[@]"
}

# fif <query> - find-in-file uses rga (pdf, books, slides, etc) to `open`
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
}

# fzf history
fzh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --query="'" +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# asdf install
vmi() {
  local lang=${1}

  if [[ ! $lang ]]; then
    lang=$(asdf plugin-list | fzf)
  fi

  if [[ $lang ]]; then
    local versions=$(asdf list-all $lang | tail -r | fzf -m)
    if [[ $versions ]]; then
      for version in $(echo $versions);
      do; asdf install $lang $version; done;
    fi
  fi
}

# asdf clean
vmc() {
  local lang=${1}

  if [[ ! $lang ]]; then
    lang=$(asdf plugin-list | fzf)
  fi

  if [[ $lang ]]; then
    local versions=$(asdf list $lang | fzf -m)
    if [[ $versions ]]; then
      for version in $(echo $versions);
      do; asdf uninstall $lang $version; done;
    fi
  fi
}

# refresh path for disconnected drive
ref() { cd `pwd` }

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

ydl() {
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -ci "$@"
}

# json -- used to download only videos matching filenames `fd QUERY | xargs jq .id | xargs youtube-dl`
ydlj() {
  youtube-dl --write-info-json --skip-download --ignore-errors --download-archive archive.txt --restrict-filenames "$@"
}

# medium quality (<720p)
ydlm() {
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -cio "%(title)s.%(ext)s" -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' "$@"
}

ydlp() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --ignore-errors --download-archive archive.txt --output "%(autonumber)s-%(title)s.%(ext)s" "$url"
}

# resumes at given index
ydlps() {
  url="$1"
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f '(mp4)[height<720]' -cio "%(autonumber)s-%(title)s.%(ext)s" --playlist-start $2 --autonumber-start $2 "$url"
}

# downloads playlist in medium format
ydlpm() {
  youtube-dl --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' -cio "%(autonumber)s-%(title)s.%(ext)s" "$@"
}

# open clipboard link with mpv
mp() {
  mpv "$(pbpaste)" --ytdl-format="bestvideo[height<=?1080][fps<=?30][vcodec!=?vp9]+bestaudio/best" > /dev/null 2>&1
}

ytn() {
  mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"'$*'"
}

yts() {
  mpv ytdl://ytsearch10:"'$*'"
}

# mpv youtube-dl watch-later
mpw() {
  mpv --player-operation-mode=pseudo-gui --ytdl-raw-options="cookies=~/.config/mpv/cookies.txt,playlist-end=${1:-50}" ytdl://:ytwatchlater &
}

# mps - open mpv with yt query <count> <query>
mps() {
  items=${3:-20}
  mpv "ytdl://ytsearch${items}:$1" $2
}

# yts - download yt query <count> <query>
ytq() {
  youtube-dl y--download-archive archive.txt -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' tsearch"${1:-20}":$2
}

# datetime
dt() {
  date '+%Y-%m-%d %H:%M:%S'
}

dtdiff() {
  gdate -d "$1" '+%Y-%m-%d %H:%M:%S'
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
  rsync -avhW --progress $@
}

finde() {
  find . -iname "*$1*" -exec "$2" {} \;
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

# git {{{
# git clone append name
gcn() {
  name="$(basename $1)_$2"
  git clone $1 $name && cd $name
}

# git clone cd
gcd() {
  git clone $1 && cd $(basename $1)
}

# git branch changes: see what the current branch has that the base branch does not
gbc() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $@..$(git rev-parse --abbrev-ref HEAD)
}

# git branch base changes: see what the base branch has that the current branch does not
gbbc() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $(git rev-parse --abbrev-ref HEAD)..$@
}

# git rebase onto: https://thoughtbot.com/blog/rebasing-your-branch-with-git-rebase-onto
#  for when branched off of a topic branch and the topic branch gets rebased off of master or squashes commits
#    ex: gro b-want-to-be-based-off b/hash-changes-cur-based-off
gro() {
  git rebase --onto $1 $2 $(git rev-parse --abbrev-ref HEAD)

}

gvf() {
  gfzf --grep "${@:-^Bump}" --invert-grep -i
}

fzf-git-reverse() {
  git log --no-merges --oneline --reverse --color=always \
    --format="%C(auto)%h%d %s %C(#373b41)%C(bold)%cr" |
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

# git log diff filetype
gldft() {
  git log --follow --patch -- "*.${1}"
}

# checkout 1 commit fwd/rev
gfwd() { git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout }
grev() { git checkout HEAD~ }

gfirst() {
  git rev-list --max-parents=0 HEAD | xargs git checkout
}

gauthor() {
  git log --topo-order --stat --patch "--author=$@" | grep -vw bot
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

# open a github pr in diff-so-fancy
gdifpr() {
  url="$(dirname $1).patch"
  curl -L "$url" | diff-so-fancy | less -r
}

# }}}

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
  fd -e c -e go -e rb -e py -e js -e ts -e jsx -e tsx -e ex -e rs -e java -e cs -E dist -E vendor -E 'jquery*' -E 'polyfills*' -E 'babel*' -E db -E '*config*' -E seeds --full-path ${1:-.} | xargs wc -l 2> /dev/null | sort -r | sed 1d | head -n 15
}

golong() {
  find . -not -path './vendor/*' -iname *.go -exec wc -l {} + | sort | head -n 20 | sed '$d'
}

# send to background no output
bkg() { "$@" > /dev/null 2>&1 & }

ajaxh() { http "$@" X-Requested-With:XMLHttpRequest }

# move symlink: `ml foo /tmp/foo` foo becomes symlink that lives at /tmp/foo
ml() { mv "$1" "$2" && ln -sf "$2/$1" "$1" }

# opens cropped pdf
tmpdf() { local dir="`mktemp`".pdf; briss -s "$1" -d "$dir" && open $dir }

# displays function
fn() { type $1 | field 3 | xargs bat }

# grep rails routes
rrg() { batgrep "$@" config/routes.rb -A 5 }
