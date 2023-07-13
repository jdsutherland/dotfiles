
return {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        vim.cmd([[
        " TODO: working from surround.vim but probably more elegant way to achieve this in nvim-surround
        " surround Function
        nmap ,F ysiwf

        " ,# Surround a word with #{ruby interpolation}
        autocmd FileType ruby,eruby nmap <buffer> nmap ,# ysiw}i#<esc>E
        autocmd FileType ruby,eruby nmap <buffer> vmap ,# c#{<C-R>"}<ESC>

        " ,$ Surround a word with ${js interpolation}
        autocmd FileType javascript,typescript,javascriptreact,tyescriptreact nmap <buffer> ,$ ysiw}i$<esc>E
        autocmd FileType javascript,typescript,javascriptreact,tyescriptreact nmap <buffer> vmap ,$ c${<C-R>"}<ESC>

        " ," Surround a word with "quotes"
        nmap ," ysiw"
        vmap ," c"<C-R>""<ESC>

        " ,' Surround a word with 'single quotes'
        nmap ,' ysiw'
        vmap ,' c'<C-R>"'<ESC>

        " ,) or ,( Surround a word with (parens)
        " The difference is in whether a space is put in
        nmap ,( ysiw(
        nmap ,) ysiw)
        vmap ,( c( <C-R>" )<ESC>
        vmap ,) c(<C-R>")<ESC>

        " ,[ Surround a word with [brackets]
        nmap ,] ysiw]
        nmap ,[ ysiw[
        vmap ,[ c[ <C-R>" ]<ESC>
        vmap ,] c[<C-R>"]<ESC>

        " ,{ Surround a word with {braces}
        nmap ,} ysiw}
        nmap ,{ ysiw{
        vmap ,} c{ <C-R>" }<ESC>
        vmap ,{ c{<C-R>"}<ESC>

        nmap ,` ysiw`
        nmap ,<space> ysiw<space><space>

        " TODO: translate this to nvim-surround
        " " x Surround jsx
        " autocmd FileType javascriptreact,typescriptreact,typescript.tsx let b:surround_120 = "<\r />"
        " autocmd FileType javascriptreact,typescriptreact,typescript.tsx nmap ,X ysiwxe
        ]])
      })
    end
  }
}
