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
fb() { fd -L -t file -p "$@" -X bat 2> /dev/null }
rb() { batgrep --smart-case --search-pattern --pager=less "$@" 2> /dev/null }

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
  tree -I "fonts|images|node_modules|bin|obj|__pycache__|tmp|cache|dist|vendor" -C ${@:-.} | less -F
}

f() {
  fd -L -t file -p -c always "$@" | less -XRF
}

F() {
  fd -L --type d -c always "$@" | less -XRF
}

# ripgrep with paging
r() {
  rg --follow --no-messages --smart-case --pretty "$@" | less -XRF
}

# ripgrep hidden
rh() {
  rg --follow --no-messages -uu -p "$@" 2> /dev/null | less -XRF
}

# list of uniq words matching regex
runiq() {  rg -INo "$@" | awk NF | sort | uniq }

# find dirs containing: dircont query
rdirs () { rg -L -l --no-messages "$@" | cut -d '/' -f1 | sort | uniq }

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
  total_length=0

  for file in *.(mp4|avi|mkv|mov|flv|wmv|mpg|mpeg|webm|3gp)
  do
    duration=$(ffprobe -i "$file" -show_entries format=duration -v quiet -of csv="p=0")
    total_length=$(echo "$total_length + $duration" | bc)
  done

  hours=$((total_length / 3600))
  minutes=$(( (total_length % 3600) / 60 ))
  seconds=$((total_length % 60))

  printf "%02d:%02d:%02d\n" $hours $minutes $seconds
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

ydl() {
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -ci "$@"
}

# json -- used to download only videos matching filenames `fd QUERY | xargs jq .id | xargs youtube-dl`
ydlj() {
  yt-dlp --write-info-json --skip-download --ignore-errors --download-archive archive.txt --restrict-filenames "$@"
}

# medium quality (<720p)
ydlm() { yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -cio "%(title)s.%(ext)s" -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' "$@" }
yy() {
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -cio "%(title)s.%(ext)s" -f 'bestvideo[height<=720]+bestaudio/best' "$@"
}

yyd() {
  yt-dlp --download-archive downloaded.txt --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -cio "%(title)s.%(ext)s" -f 'bestvideo[height<=720]+bestaudio/best' "$@"
}

yyp() {
  yt-dlp --download-archive downloaded.txt --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -cio "%(autonumber)s-%(title)s.%(ext)s" -f 'bestvideo[height<=720]+bestaudio/best' "$@"
}


ydla() {
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames -cio "%(title)s.%(ext)s" -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' --external-downloader aria2c "$@"
}

ydlp() {
  url="$1"
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --ignore-errors --download-archive archive.txt --output "%(autonumber)s-%(title)s.%(ext)s" "$url"
}

# resumes at given index
ydlps() {
  url="$1"
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f '(mp4)[height<720]' -cio "%(autonumber)s-%(title)s.%(ext)s" --playlist-start $2 --autonumber-start $2 "$url"
}

# downloads playlist in medium format
ydlpm() {
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' -cio "%(autonumber)s-%(title)s.%(ext)s" "$@"
}

# downloads playlist in medium format
ydlps() {
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f 'bestvideo[height<=550][vcodec=vp9]+bestaudio[acodec=opus]' -cio "%(autonumber)s-%(title)s.%(ext)s" "$@"
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

mpvg() { mpv --player-operation-mode=pseudo-gui "$*" & }
m() { mpv --player-operation-mode=pseudo-gui "$*" & }

# mps - open mpv with yt query <count> <query>
mps() {
  items=${3:-20}
  mpv "ytdl://ytsearch${items}:$1" $2
}

# yts - download yt query <count> <query>
ytq() {
  yt-dlp --write-sub --embed-subs --no-mtime --no-overwrites --restrict-filenames --download-archive archive.txt -f 'bestvideo[height<=720][vcodec=vp9]+bestaudio[acodec=opus]' ytsearch"${1:-20}":$2
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

sch() { say -v Ting-Ting $(trans -b :zh "$@") }

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

# git browser grep filter (defaults to Bump as it's noisy)
gvf() {
  gfzf -E --invert-grep --grep "${@:-^Bump}"
}

# checkout 1 commit fwd/rev
gfwd() { git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout }
grev() { git checkout HEAD~ }

glinesby() { for f in $(git ls-files); do git blame $f | grep "${1:-Sutherland}"; done }

gcode() { git log -S "$@" --stat }
glog() { git log -E --grep "$@" --stat }

# checkout a pr w/ fzf preview
ghpr() {
  GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

# fzf-gh-issues
fgi() {
  gh issue list --limit 100 | awk '{NF-=3}1' | fzf --preview "gh issue view {+1}" \
    --header="enter: browser, C-d: closed, C-o: open, C-s: search" \
    --bind="ctrl-m:execute(gh issue view {+1} --web),ctrl-d:reload(gh issue list --state closed --limit 100 | awk '{NF-=3}1'),ctrl-o:reload(gh issue list --state open --limit 100 | awk '{NF-=3}1'),ctrl-s:reload(gh issue list --state all --search {q} --limit 999 | awk '{NF-=3}1' | rg -v Bump)"
}

# fzf-gh-prs
fgp() {
  gh pr list --limit 100 | fzf --preview "gh pr view {+1}" \
    --header="enter: diff, C-o: checkout, C-b: browser, C-s: search" \
    --bind="ctrl-m:execute(gh pr diff --color=always {+1} | diff-so-fancy | less -R),ctrl-o:execute(gh pr checkout {+1}),ctrl-b:execute(gh pr view {+1} --web),ctrl-s:reload(gh pr list --state all --search {q} --limit 999 | rg -v Bump)"
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
  curl -L "$url" | diff-so-fancy | less -RFX
}

# }}}

# list new vids
newvids() {
  count=${1:-20}
  gfind . -regex '.*\.\(mp4\|webm\|mkv\|mov\|m4v\)' -exec stat -f '%c%t%Sm %N' {} + | sort -n | cut -d ' ' -f5- | tail -r -n "$count" | sed 's#.*/##' | less
}

subr() {
  for f in **/*.(mp4|webm|mkv|mov|m4v|avi); do subliminal download -l en $f; done
}

pdfg() {
  pdfgrep --color always -i "$1" **/*.pdf | less -RFX
}

# most recent photobooth vid
rvid() {
  vidpath="/Users/$USER/Pictures/Photo Booth Library/Pictures"
  vid=$(ls -Art "$vidpath" | tail -n 1) && mpv --player-operation-mode=pseudo-gui "$vidpath/$vid" &
}

longcode() {
  fd -e erb -e html -e c -e go -e rb -e py -e js -e ts -e jsx -e tsx -e ex -e rs -e java -e cs -E dist -E vendor -E 'jquery*' -E 'polyfills*' -E 'babel*' -E db -E '*config*' -E seeds --full-path "${@:-.}" | xargs wc -l 2> /dev/null | sort -r | sed 1d | head -n 15
}

# send to background no output
bkg() { "$@" > /dev/null 2>&1 & }

ajaxh() { http "$@" X-Requested-With:XMLHttpRequest }

# move symlink: `ml foo /tmp/dir` foo becomes symlink that lives at /tmp/dir/foo
ml() { mv "$1" "$2" && ln -sf "$2/$1" "$1" }

# opens cropped pdf
tmpdf() { local dir="`mktemp`".pdf; briss -s "$1" -d "$dir" && open $dir }

# displays function
fn() { type $1 | field 3 | xargs bat }

dif() {
  git diff --no-index "$@" | diff-so-fancy | less -RFX
}

dsf() {
  diff -u -r "$@" | diff-so-fancy | less -RFX
}

# rails {{{
Rroutes() {
  batgrep "$@" config/routes.rb -A 5
}

Rtests() {
  r -w -s --no-line-number --multiline '(test|describe|context|it).*do$' "$@" test spec -t ruby
}
# }}}

Jtests() {
  r -s --no-line-number --multiline -w '(test|describe|context|it)\(.*\{$' "$@" -t js -t ts
}

# find-alias
fa() { print -z $(alias | fzf | cut -d'=' -f2 | sd -p "'" '') }

bdot() { fd -tf -p --color always ${@:-.} ~/.dotfiles/ | fzf --multi | xargs bat }

# TODO: make this one command with fzf bind to viw and fzf preview
# fzf viw from `functions` and bin
source ~/.dotfiles/zsh/configs/viw.zsh
viwfz() {
  viw $({ ls ~/.dotfiles/bin | sd -p '\*' '' ; functions E '^(async|prompt|comp)' | rg '^[a-zA-Z]\w+\s\(\)' | field 1 } | sort | fzf --preview 'source ~/.dotfiles/zsh/configs/{functions,aliases,viw}.zsh; viw {}')
}
# fzf eval from `functions` and bin
myfns() {
  eval $({ ls ~/.dotfiles/bin | sd -p '\*' '' ; functions E '^(async|prompt|comp)' | rg '^[a-zA-Z]\w+\s\(\)' | field 1 } | sort | fzf --preview 'source ~/.dotfiles/zsh/configs/{functions,aliases,viw}.zsh; viw {}')
}

Rga() { rga -L --color=always "$@" | less -XRF }

rgafz() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}
