filetype plugin indent on
syntax on

" set hybrid line numbers in active buffer. Change to absolute numbers in not active buffer
set number relativenumber
set laststatus=2

" colorscheme
colorscheme nordfox

" fold settings
set foldenable
set foldmethod=syntax
set foldlevel=99
set foldclose=all
set modelines=1 " Tell vim to check the final line of the file for a modeline

" set system clipbord to default
set clipboard=unnamedplus

" enable live susbstitution
set inccommand=nosplit

set noerrorbells              "don't make noise
set hidden                    "allow hiding buffers with unsaved changes

set cursorline                " underline the current line in the file
set autoindent                " automatic indentation in non-C files
set smartindent
set cindent                   " recommended seting for automatic C-style indentation

set listchars=tab:>~,nbsp:_,trail:-,space:.,eol:$ " set chars for white spaces, tabs and others
set expandtab                 " spaces instead of tabs for better cross-editor compatibility

" shiftwidth = number of spaces to use in each autoindent step
" tabstop = number of spaces for a tab
set ts=4 sts=4 sw=4

if (has("termguicolors"))
   set termguicolors
endif

set textwidth=119 "textwidth used for reformatting lines with gq
set colorcolumn=120

"set background color for column 120
highlight ColorColumn ctermbg=magenta guibg=grey23

lua vim.diagnostic.config({virtual_text = false})
