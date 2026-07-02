return {
  'christoomey/vim-tmux-runner',
  lazy = false,
  dependencies = 'airblade/vim-rooter',
  config = function()
    local function attachAndHighlightFn(pane)
      return function()
        vim.cmd('VtrAttachToPane ' .. pane)
        os.execute('tmux clock-mode -t ' .. pane .. ' && sleep 0.1 && tmux send-keys -t ' .. pane .. ' q')
      end
    end

    vim.keymap.set('n', '<localleader>v0', attachAndHighlightFn(0), { desc = 'VTR: Attach and flash pane 0', silent = true })
    vim.keymap.set('n', '<localleader>v1', attachAndHighlightFn(1), { desc = 'VTR: Attach and flash pane 1', silent = true })
    vim.keymap.set('n', '<localleader>v2', attachAndHighlightFn(2), { desc = 'VTR: Attach and flash pane 2', silent = true })

    vim.cmd([[
    let g:rooter_manual_only = 1
    let g:VtrUseVtrMaps = 1
    let g:VtrGitCdUpOnOpen = 1
    let g:VtrClearBeforeSend = 0
    " press enter to repeat last cmd
    nnoremap <localleader>v :VtrSendCommandToRunner<space>
    nnoremap <localleader>vv :w<cr>:VtrSendCommandToRunner<cr>
    " shortcut to mapping a temp runner with
    nnoremap <localleader>vb :nnoremap \vt :VtrSendCommandToRunner<space>
    nnoremap <localleader>vo :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
    " cd to current buffer's root (FindRootDirectory from vim-rooter)
    nnoremap <localleader>vr :execute 'VtrSendCommandToRunner cd ' FindRootDirectory()<CR>
    nnoremap <localleader>vq :VtrKillRunner<cr>
    nnoremap <localleader>vd :VtrSendCtrlD<cr>
    nnoremap <localleader>vc :VtrSendCtrlC<cr>
    nnoremap <localleader>vf :VtrSendFile<cr>
    nnoremap <localleader>va :VtrAttachToPane<cr>
    nnoremap <localleader>V :VtrSendLinesToRunner<cr>
    vmap <localleader>V :VtrSendLinesToRunner<cr>
    " on startup, attach to pane below
    autocmd VimEnter * if !system("tmux display-message -p '#{pane_at_bottom}'") | execute 'VtrAttachToPane' system('tmux display -p -t "{down-of}" "#{pane_index}"')
    ]])
  end
}
