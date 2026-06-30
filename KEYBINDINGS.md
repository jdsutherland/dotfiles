# Keybinding Reference

## Modifier Notation
- `hyper` = Ctrl+Shift+Opt+Cmd (Caps Lock held)
- `M-` = Option key (Meta/Alt)
- `super` = Command key (in Ghostty config)

---

## Karabiner-Elements — System-Level Remaps

| Binding | Effect | File |
|---------|--------|------|
| Caps Lock held → hyper (ctrl+shift+opt+cmd) | Hyper key modifier | karabiner.json |
| Caps Lock tap → Escape | Quick escape | karabiner.json |
| Ctrl+Shift+h/j/k/l → ←/↓/↑/→ | Vim arrows system-wide | ctrl-shift_vim-movements.json |
| Cmd+Q twice → Quit app | Prevent accidental quit | double-cmd-q-to-quit.json |
| Shift tap → ( / ) | Parentheses on shift tap | ghostty.json |
| Cmd+R → hyper / cmd-tab tap | Right cmd hyper | r_cmd_hyper_alt-tab-tap.json |
| Cmd+H → disabled | Prevent hide shortcut | prevent-cmd-h-hide.json |
| hyper+w → hyper+` | Avoid macOS wifidiag | disable-macOS-hyper-w.json |

### Ghostty-specific (Karabiner)

| Binding | Effect |
|---------|--------|
| Opt+Space → Cmd+Space | Alfred fix |
| Ctrl+I → F6 | Vim tab separate from Ctrl+I |
| left_cmd → left_opt (held) | Cmd acts as Opt in terminal for tmux binds |
| left_cmd tap → Opt+Tab | Tmux zoom (pane toggle) |
| fn tap → Opt+Shift+z | Tmux git individual file history |
| left_ctrl tap → Opt+Shift+x | Tmux git file full history |
| left_opt tap → Opt+Shift+c | Tmux git diff (working) |
| right_opt tap → Opt+Ctrl+c | Tmux git diff (staged) |

---

## Ghostty — Terminal Keybindings

| Binding | Effect |
|---------|--------|
| super+v | Paste from clipboard |
| super+c | Copy to clipboard |
| ctrl+/, ctrl+slash → `\x1f` | Fzf-git-browser (gfzf) |
| ctrl+q → `\x11` | (sent as escape sequence) |
| alt+delete | Reset font size |
| alt+= | Increase font size 1pt |
| alt+- | Decrease font size 1pt |
<!-- super+key navigation bindings removed — handled by Karabiner cmd→opt remap -->

---

## Tmux

| Binding | Effect |
|---------|--------|
| prefix = Ctrl+Space | Send prefix |
| prefix + r | Reload tmux config |
| prefix + I | Install TPM plugins |
| M-j | Previous window |
| M-k | Next window |
| M-l | Last window |
| M-p | Switch client |
| M-o | Cycle panes |
| M-h | Command prompt split |
| M-Tab | Resize pane (zoom) |
| M-C | Git diff split (working) |
| M-C-c | Git diff split (staged) |
| M-q | Zoom vim window toggle |
| M-e | Focus vim runner |
| M-w | Focus vim runner + zoom |
| M-y | Save + run + focus |
| M-t | Save + test + focus |
| C-g | Split with gfzf (fzf git browser) |
| C-f | Fzf windows |
| C-p | Fzf current pane |
| C-j | Session switcher (fzf) |
| C-space send-prefix | Prefix |
| M-1 through M-9 | Select window 1-9 |
| M-0 | Select last window |

---

## Slate — Window Management (hyper+key)

| Binding | Effect |
|---------|--------|
| hyper+o | Throw next screen |
| hyper+u | Undo last window move |
| hyper+i | Full screen |
| hyper+[ | Left half |
| hyper+] | Right half |
| hyper+space | Hide current app |
| hyper+1 | Layout: notifications |
| hyper+2 | Layout: 1-notifications |
| hyper+3 | Layout: 1-monitor |
| hyper+4 | Layout: 2-notifications |

### Window Layouts (automatic)
- **2monitors**: Alacritty left, Chrome right, Preview full on ASUS, etc.
- **1monitor**: Full screen for most apps
- **1dev**: Term leftmost, Chrome rightless (3/4 split)
- **1pdf**: Preview leftmost, Chrome/term rightless
- **1mpv**: mpv leftmost, other apps rightless

---

## Hammerspoon — App Focusing (hyper+key)

| Binding | Effect |
|---------|--------|
| hyper+t | Focus Alacritty |
| hyper+q | Focus Anki |
| hyper+a | Focus Brave Browser Beta |
| hyper+g | Focus Finder |
| hyper+p | Focus Preview |
| hyper+c | Focus ChatGPT |
| hyper+r | Focus Microsoft Excel |
| hyper+e | Focus Evernote |
| hyper+d | Focus Discord |
| hyper+z | Focus Gemini |
| hyper+x | Focus Claude |
| hyper+v | Focus mpv |
| hyper+n | Focus Notion |
| hyper+b | Focus Google Chrome |

### Chrome Tab Jumping

| Binding | Effect |
|---------|--------|
| hyper+` | Jump to WhatsApp web tab |
| hyper+m | Jump to Messages web tab |
| hyper+s | Jump to Google Sheets tab |
| hyper+f | Jump to TP-Link router admin |

---

## Neovim — LSP Keybindings

| Binding | Effect |
|---------|--------|
| gd | Goto definition |
| <c-f> | Hover documentation |
| <F6> | Signature help (insert mode) |
| <localleader>sh | Signature help |
| <space>vws | Workspace symbol |
| <space>vd | Diagnostics float |
| [d | Next diagnostic |
| ]d | Previous diagnostic |
| <space>vca | Code action |
| <space>vrr | References |
| <space>vrn | Rename |
| <space>vtd | Type definition |
| <space>fd | Document symbols (Telescope) |
| <space>fo | Function symbols (Telescope) |
| <space>fw | Workspace symbols (Telescope) |

### Autocompletion (nvim-cmp)

| Binding | Effect |
|---------|--------|
| <C-f> | Confirm selection |
| <C-j> | Luasnip jump forward |
| <C-k> | Luasnip jump backward |
| <C-n> | Select next item |
| <C-p> | Select previous item |
| <C-u> | Scroll docs up |
| <C-d> | Scroll docs down |

### Other Plugins

| Binding | Effect |
|---------|--------|
| <space>ll | Goto-preview definition |
| <space>lr | Goto-preview references |
| <space>lt | Goto-preview type definition |
| <space>li | Goto-preview implementation |
| <space>lc | Close all preview windows |
| <space>lv | Vertical split preview |
| <localleader>z | Symbols outline |

---

## Zsh — Shell Keybindings

| Binding | Effect |
|---------|--------|
| ^a | Beginning of line |
| ^e | End of line |
| ^d | Backward delete char |
| ^y | Accept and hold |
| ^w | Backward kill word |
| ^n | Insert last word |
| ^f | Menu complete |
| ^x^y | Copy last command to clipboard |
| ^b | Tmux man for current word |
| ^P | Vim-fzf-preview |
| ^O | Ranger-cd |
| ^x^p | Fzf playlist widget |
| ^g^f | Fzf git file widget |
| ^g^t | Fzf git tag widget |
| ^g^b | Fzf git branch widget |
| ^g^r | Fzf git remote widget |
| ^g^g | Fzf git hash widget |
| ^_ (Ctrl+/) | Fzf git browser (gfzf) |
