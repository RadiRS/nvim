call plug#begin('~/.local/share/nvim/site/plugged')

" Themes
"Plug 'overcache/NeoSolarized'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" Files Finder
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Tools
Plug 'scrooloose/nerdcommenter'
Plug 'folke/which-key.nvim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'akinsho/dependency-assist.nvim'

" JS Development
Plug 'yuezk/vim-js'
Plug 'meain/vim-package-info', { 'do': 'npm install' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rafamadriz/friendly-snippets'
"Plug 'epilande/vim-react-snippets'
"Plug 'mlaursen/vim-react-snippets'

" Dart Development
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/dartlang-snippets'
Plug 'Neevash/awesome-flutter-snippets'
"Plug 'thosakwe/vim-flutter'

" CSS Development
Plug 'ap/vim-css-color'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

"---------------------------------------

set termguicolors
set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set mouse=a
set expandtab
set hidden
set signcolumn=yes
set ignorecase
set ai
set si
set path+=**
set wildignore+=*/node_modules/*
let g:vim_package_info_virutaltext_prefix = '  ¤ '

lua << EOF
  require'dependency_assist'.setup{}
EOF

"---------------------------------------

" Config Themes
"colorscheme NeoSolarized
colorscheme palenight
set encoding=utf-8
set background=dark
let g:airline_powerline_fonts = 1
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

if (has("termguicolors"))
  set termguicolors
endif

"---------------------------------------


" Editor Mapping
inoremap jk <ESC>
noremap <S-Tab> gt
nnoremap <leader>s :w<CR>
nnoremap <C-M> :wq<CR>
nnoremap <leader>q :q<CR>
inoremap <expr> <Tab> search('\%#[]>)}''""]', 'n') ? '<Right>' : '<Tab>'

"---------------------------------------

" Telescope Mapping
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

"---------------------------------------

" Nerdtree Mapping
nmap <C-n> :NERDTreeToggle<CR>

" NERD Commenter Config
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' } }
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

"---------------------------------------

" Coc Config & Mapping
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-emmet',
\ 'coc-css',
\ 'coc-html',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-flutter',
\ 'coc-yaml',
\ ]

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"inoremap <silent><expr> <TAB>
      "\ coc#pum#visible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ CheckBackSpace() ? "\<TAB>" :
      "\ coc#refresh()

"function! CheckBackSpace() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'

"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"let col = col('.') - 1
"return !col || getline('.')[col - 1] =~# '\s'
"endfunction
"inoremap <expr> <cr> pumvisible() ? "\<C-Y>" : "\<CR>"


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold \* silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

"---------------------------------------

" Flutter Config & Mapping
" Some of these key choices were arbitrary;
nnoremap <leader>fa :CocCommand flutter.run <CR>
nnoremap <leader>fA :CocCommand flutter.run -d all<CR>
nnoremap <leader>fq :CocCommand flutter.dev.quit <CR>
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
"nnoremap <leader>fd :below new output:///flutter-dev <CR>
nnoremap <leader>fd :CocCommand flutter.dev.openDevLog <CR>

let g:dart_format_on_save = 1
"let g:dart_style_guide = 2
"let g:dartfmt_options = ['--fix', '--line-length 120']

"---------------------------------------

" Autoclose tag config
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while`<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"---------------------------------------

" Which-key config
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"---------------------------------------

" Markdown configuration
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
"nnoremap <M-m> :MarkdownPreviewToggle <CR>
nnoremap <leader>mm :MarkdownPreviewToggle <CR>

"---------------------------------------

let g:loaded_python_provider = 0
"let g:loaded_python3_provider = 0
let g:loaded_perl_provider = 0
"let g:loaded_node_provider = 0

