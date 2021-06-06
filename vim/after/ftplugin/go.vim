set noexpandtab tabstop=4 shiftwidth=4
set foldmethod=syntax

" TODO: keep?
nnoremap <buffer> ,f :GoDef<cr>
nnoremap <buffer> <silent> K :call SearchWordWithRg()<cr>
nnoremap <buffer> ,gec :GoErrCheck<cr>
nnoremap <buffer> <space>gdo :GoDoc<cr>
nnoremap <buffer> <space>gdd :GoDescribe<cr>
nnoremap <buffer> <space>gdi :GoImplements<cr>
nnoremap <buffer> <space>gde :GoWhicherrs<cr>
nnoremap <buffer> <space>gdr :GoReferrers<cr>
nnoremap <buffer> <space>gds :GoCallstack<cr>
nnoremap <buffer> <space>gdc :GoCallees<cr>
nnoremap <buffer> <space>gdC :GoCallers<cr>
nnoremap <buffer> <space>gdp :GoChannelPeers<cr>
vnoremap <buffer> <space>gdp :GoChannelPeers<cr>
vnoremap <buffer> <space>gdf :GoFreevars<cr>
nnoremap <buffer> <space>ggr :GoRename<space>
nnoremap <buffer> <space>ggi :GoImpl<space>
nnoremap <buffer> <space>gim :GoImport<space>
nnoremap <buffer> <space>G :GoInfo<cr>
nnoremap <buffer> <space>B :GoRun<cr><esc>
nnoremap <buffer> <space>tc :GoCoverageToggle<cr>
nnoremap <buffer> <space>gts :<C-u>call BuildGoFiles()<CR>
nnoremap <buffer> <space>gtt :GoTestFunc<cr>

command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
