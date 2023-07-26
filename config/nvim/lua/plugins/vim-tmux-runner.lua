return {
  'christoomey/vim-tmux-runner',
  lazy = false,
  dependencies = 'airblade/vim-rooter',
  config = function()
    vim.cmd([[
    let g:rooter_manual_only = 1
    let g:VtrUseVtrMaps = 1
    let g:VtrGitCdUpOnOpen = 1
    let g:VtrClearBeforeSend = 0
    " press enter to repeat last cmd
    nnoremap <localleader>v :VtrSendCommandToRunner<space>
    nnoremap <localleader>vv :w<cr>:VtrSendCommandToRunner<cr>
    " shortcut to mapping a temp runner with
    nnoremap <localleader>vb :nnoremap ,t :VtrSendCommandToRunner<space>
    nnoremap <localleader>vo :VtrOpenRunner<cr>
    " cd to current buffer's root (FindRootDirectory from vim-rooter)
    nnoremap <localleader>vr :execute 'VtrSendCommandToRunner cd ' FindRootDirectory()<CR>
    nnoremap <localleader>vq :VtrKillRunner<cr>
    nnoremap <localleader>vd :VtrSendCtrlD<cr>
    nnoremap <localleader>vc :VtrSendCtrlC<cr>
    nnoremap <localleader>vf :VtrSendFile<cr>
    nnoremap <localleader>va :VtrAttachToPane<cr>
    " on startup, attach to pane below
    autocmd VimEnter * if !system("tmux display-message -p '#{pane_at_bottom}'") | execute 'VtrAttachToPane' system('tmux display -p -t "{down-of}" "#{pane_index}"')

    " map <localleader>V <Plug>(operator-vtr)
    " call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')
    ]])
  end
}
