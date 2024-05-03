" deoplete
" Next generation completion framework.

let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1

" Map standard Ctrl-N completion to Ctrl-Space
inoremap <C-Space> <C-n>

call deoplete#custom#source('_', {
\ 'min_pattern_length': 2,
\ 'max_list': 20
\})

call deoplete#custom#option({
\ 'keyword_patterns': {
\   'default': '\h\w*'
\ }
\})

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
