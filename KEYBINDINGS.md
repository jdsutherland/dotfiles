# Keybinding Reference

## Modifier Notation
- `hyper` = Ctrl+Shift+Opt+Cmd (macOS, Caps Lock held) / Ctrl+Super+Alt+Shift
  (Omarchy, right Alt held — see keyd below)
- `M-` = Option key (Meta/Alt)
- `super` = Command key on macOS (in Ghostty config); the Super/Windows key
  on Omarchy
- On Omarchy, keyd swaps `leftalt`/`leftmeta` so *physical key position*
  matches the mac keyboard rather than matching key names: the innermost
  key next to Space sends Super (Cmd's position, feeding Hyprland's
  SUPER-based defaults), and the next key out sends Alt (Option's
  position, feeding tmux's `M-`, Ghostty's `alt+`, and nvim's Alt binds).

---

## Karabiner-Elements — System-Level Remaps (macOS)

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

## keyd — System-Level Remaps (Omarchy)

`/etc/keyd/default.conf`, symlinked from `keyd/default.conf` (installed by
`scripts/omarchy.sh` rather than rcup, since `/etc` is root-owned). Panic
sequence if a bad reload breaks input: `backspace+escape+enter` kills keyd.

| Binding | Effect | Mac equivalent |
|---------|--------|-----------------|
| leftalt held → Super | Physical position match (see Modifier Notation) | leftmeta (Cmd) |
| leftalt tap → SUPER+ALT+F | Hyprland full width | — |
| leftmeta held → Alt | Physical position match | leftalt (Opt) |
| Caps Lock held → Ctrl | Generic ctrl from either key | Karabiner hyper base |
| Caps Lock tap → Escape | Quick escape | Caps Lock tap → Escape |
| rightalt held → hyper (ctrl+super+alt+shift) | Falls through to Hyprland's `bindings.lua` | Caps Lock held → hyper |
| rightalt tap → SUPER+CTRL+TAB | Hyprland "former workspace" (back-and-forth toggle) | — |
| rightcontrol held → AltGr | Unused on US layout, takes over rightalt's stock role | — |

### Ctrl+Shift Vim Movements (`[control+shift]` layer)

Full port of Karabiner's `ctrl-shift_vim-movements`. Known conflicts
accepted for now: VS Code/Electron Command Palette on P, browser DevTools
Inspect on I, Chrome incognito/Nautilus new-folder on N, Firefox bookmarks
on O, Chrome console on J, Firefox console on K, Linux's own unicode entry
on U.

| Binding | Effect |
|---------|--------|
| ctrl+shift+h/j/k/l | ←/↓/↑/→ |
| ctrl+shift+p / n | Word left / right (`C-left` / `C-right`) |
| ctrl+shift+i / o | Delete word left / right (`C-backspace` / `C-delete`) |
| ctrl+shift+u / y | Undo / redo (`C-z` / `C-S-z`) |
| ctrl+shift+, / . | Backspace / delete |
| ctrl+shift+; | Enter |
| ctrl+shift+[ / ] | Page down / up |
| ctrl+shift+= | Clipboard history (`super+ctrl+v`) — mimics the mac Karabiner bind |

### keyd-application-mapper — Per-App Overlays

`~/.config/keyd/app.conf`, applied by `keyd-application-mapper` as a
runtime overlay on top of `/etc/keyd/*.conf` whenever a matching window is
focused (cleared on focus-out); autostarted by Hyprland, see
`config/hypr/autostart.lua`.

| App | Binding | Effect | Mac equivalent |
|-----|---------|--------|-----------------|
| Ghostty | leftalt tap → Alt+z | tmux zoom (`M-z`) | left_cmd tap → Opt+Tab (`M-Tab`) |
| Chrome | ctrl+h / l | Back / forward (`alt+left` / `alt+right`) | Karabiner browser binds |
| Chrome | ctrl+j / k | Previous / next tab | Karabiner browser binds |
| Chrome | ctrl+d | Close tab (`ctrl+w`) | — |
| Chrome | ctrl+r | Reopen closed tab (`ctrl+shift+t`) | — |

---

## Ghostty — Terminal Keybindings

Shared config (`config/ghostty/config`) plus a platform-specific file
(`platform` for mac, `tag-omarchy/config/ghostty/platform` for Omarchy) for
the parts that genuinely differ: clipboard binds, font size (9pt on
Omarchy vs. 12pt on mac — same font renders visibly larger on this
Linux/GTK stack), and theme (mac hardcodes Kanagawa Dragon; Omarchy follows
`omarchy theme set`).

| Binding | Effect | Platform |
|---------|--------|----------|
| super+v | Paste from clipboard | mac |
| super+c | Copy to clipboard | mac |
| alt+v | Paste (Karabiner remap compat — cmd+v→opt+v) | mac |
| ctrl+shift+v | Paste from clipboard | Omarchy |
| ctrl+shift+c | Copy to clipboard | Omarchy |
| ctrl+/, ctrl+slash → `\x1f` | Fzf-git-browser (gfzf) | both |
| ctrl+q → `\x11` | (sent as escape sequence) | both |
| alt+delete | Reset font size | both |
| alt+= | Increase font size 1pt | both |
| alt+- | Decrease font size 1pt | both |

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
| M-Tab | Resize pane (zoom) — mac (left_cmd tap via Karabiner) |
| M-z | Resize pane (zoom) — Omarchy (keyd leftalt tap in Ghostty; Alt+Tab itself is claimed by Hyprland's window-cycle bind) |
| M-C | Git diff split (working) |
| M-C-c | Git diff split (staged) |
| M-q | Zoom vim window toggle |
| M-e | Focus vim runner |
| M-w | Focus vim runner + zoom |
| M-y | Save + run + focus |
| M-t | Save + test + focus |
| M-f | Fleet popup (agent sidebar) |
| C-g | Split with gfzf (fzf git browser) |
| C-f | Fzf windows |
| C-p | Fzf current pane |
| C-j | Session switcher (fzf) |
| C-space send-prefix | Prefix |
| M-1 through M-9 | Select window 1-9 |
| M-0 | Select last window |

---

## Slate — Window Management (macOS, hyper+key)

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
- **2monitors**: Ghostty left, Chrome right, Preview full on ASUS, etc.
- **1monitor**: Full screen for most apps
- **1dev**: Term leftmost, Chrome rightless (3/4 split)
- **1pdf**: Preview leftmost, Chrome/term rightless
- **1mpv**: mpv leftmost, other apps rightless

---

## Hammerspoon — App Focusing (macOS, hyper+key)

| Binding | Effect |
|---------|--------|
| hyper+t | Focus Ghostty |
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

## Hyprland — Window Management + App Focusing (Omarchy, `config/hypr/`)

Coexists with Omarchy's own SUPER-based defaults (`omarchy menu keybindings
--print` lists everything, defaults included) rather than replacing them —
`bindings.lua` only unbinds the specific defaults it overrides.

### App Focusing (hyper+key)

Ported from the mac Hammerspoon list above; hyper here is keyd's right-Alt
layer (see keyd section), not Caps Lock.

| Binding | Effect |
|---------|--------|
| hyper+t | Focus/launch Ghostty |
| hyper+g | Focus/launch Nautilus (Finder equivalent) |
| hyper+p | Focus/launch Evince (Preview equivalent) |
| hyper+c | Focus/launch ChatGPT (webapp) |
| hyper+r | Focus/launch LibreOffice Calc (Excel equivalent) |
| hyper+d | Focus/launch Discord (webapp) |
| hyper+v | Focus/launch mpv |
| hyper+b | Focus/launch Chrome |
| hyper+\` | Focus/launch WhatsApp (webapp) |
| hyper+e | Focus/launch Obsidian |
| hyper+m | Focus/launch Google Messages (webapp) |
| hyper+s | Focus/launch Google Sheets (webapp) |

### Vim-style Navigation

| Binding | Effect |
|---------|--------|
| SUPER+h | Focus previous window (index-based cycle) |
| SUPER+l | Focus next window (index-based cycle) |
| SUPER+j | Previous workspace |
| SUPER+k | Next workspace |
| SUPER+apostrophe | Keybindings menu (moved off SUPER+K) |
| SUPER+backslash | Toggle window split (moved off SUPER+J) |
| SUPER+q | Toggle workspace layout (moved off SUPER+L) |
| SUPER+w | Close window — requires a double-press within 1s (guards against accidental kills) |

### Window Rules (`windows.lua`)

| Rule | Effect |
|------|--------|
| Terminal-tagged windows (incl. Ghostty) | Full opacity (Omarchy's default dims unfocused terminals) |
| All windows | No open/close/move/resize/fullscreen animations |

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
| ^_ (Ctrl+/) | Fzf git browser (gfzf) |

### Git fzf (junegunn/fzf-git.sh)

`C-g` prefix, then a second key. Selects git objects and inserts them into the
command line. Hashes and reflogs are remapped off their defaults (`C-g C-h` /
`C-g C-l`) because tmux's `C-h` / `C-l` pane-navigation intercepts those.

| Binding | Effect |
|---------|--------|
| ^g^f | Files |
| ^g^b | Branches |
| ^g^t | Tags |
| ^g^r | Remotes |
| ^g^g | Commit hashes (default `C-g C-h` remapped — tmux `C-h`) |
| ^g^s | Stashes |
| ^g^u | Reflogs (default `C-g C-l` remapped — tmux `C-l`) |
| ^g^w | Worktrees |
| ^g^e | Each ref (`for-each-ref`) |
