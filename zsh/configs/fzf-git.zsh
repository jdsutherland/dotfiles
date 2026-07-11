# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }

# fbrd - Fuzzy Branch Delete
fbrd() {
  local branches branch
  branches=$(git branch --merged) &&
    branch=$(echo "$branches" | fzf +m) &&
    git branch -d $(echo "$branch" | sed "s/.* //") && fbrd
  }
# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
  git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
  git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
      target=$(
      (echo "$tags"; echo "$branches") |
        fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
              git checkout $(echo "$target" | awk '{print $2}')
            }
          # fcoc - checkout git commit
          fcoc() {
            local commits commit
            commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
              commit=$(echo "$commits" | fzf --tac +s +m -e) &&
              git checkout $(echo "$commit" | sed "s/ .*//")
            }

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
  }
# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
      --expect=ctrl-d,ctrl-b);
        do
          mapfile -t out <<< "$out"
          q="${out[0]}"
          k="${out[1]}"
          sha="${out[-1]}"
          sha="${sha%% *}"
          [[ -z "$sha" ]] && continue
          if [[ "$k" == 'ctrl-d' ]]; then
            git diff $sha
          elif [[ "$k" == 'ctrl-b' ]]; then
            git stash branch "stash-$sha" $sha
            break;
          else
            git stash show -p $sha
          fi
        done
      }
    # List files in git status using relative paths
    gip() {
      # Can provide a matcher against the porcelain tags, i.e. "M ", "UU", etc
      # If not provided return all files listed in git status
      if [[ "$1" == "" ]]; then
        local TYPE=".."
      else
        local TYPE="$1"
      fi
      local TOP_DIR=$(git rev-parse --show-toplevel)
      # resolve the current relativity to the git dir
      local REL="$(python -c 'import os.path; print os.path.relpath("'"$TOP_DIR"'", os.path.abspath("."))')"
      git status --porcelain | sed -ne "/^$TYPE/s/^$TYPE \+/$REL\//p" -e 's/\n/ /'
    }
  gim() {
    vim $(gip)
  }


# git file/branch/tag/remote/hash fzf widgets now come from junegunn/fzf-git.sh
# (loaded via zinit in .zshrc). Their key bindings — plus the C-g C-g hash
# override and the gfzf browser — live in keybindings.zsh.
