" .vimrc
" Main vim configuration
"
" Configuration inspired by:
" * https://github.com/nvie/vimrc/blob/master/vimrc
" * http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" * http://vimcasts.org/episodes/archive/
" * https://www.youtube.com/playlist?list=PLwJS-G75vM7kFO-yUkyNphxSIdbi_1NKX
"
" WARNING: put comments on new line, so they are not interpreted as commands
" WARNING (maybe obsolete): install python plugins dependencies to neovim3 virtualenv:
" $ pyenv activate neovim3 && pip install pynvim pylama jedi

" Here I add plugins only, see ~/.vim/plugin for more configuration files

" Fix paths on Windows
set runtimepath+=$HOME/.vim
set packpath+=$HOME/.vim

" Editing {{{

" wrap and unwrap arguments, lists and dictionaries
" https://github.com/foosoft/vim-argwrap
packadd! vim-argwrap

" work even better with characters in pairs
" https://github.com/tmsvg/pear-tree
packadd! pear-tree

" automated lists behavior
" https://github.com/dkarter/bullets.vim
packadd! bullets.vim

" comment functions so powerful—no comment necessary
" https://github.com/preservim/nerdcommenter
packadd! nerdcommenter

" enhanced in-file search
" https://github.com/wincent/loupe
packadd! loupe

" enable repeating supported plugin maps with .
" https://github.com/tpope/vim-repeat
packadd! vim-repeat

" convenient re-run of last recorded macro
" https://github.com/wincent/replay
packadd! replay

" fast within-file word replacement
" https://github.com/wincent/scalpel
packadd! scalpel

" quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
packadd! vim-surround

" bracketed paste
" https://github.com/ConradIrwin/vim-bracketed-paste
packadd! vim-bracketed-paste
" }}}

" Look and feel {{{

" airline status line
" https://github.com/vim-airline/vim-airline
packadd! vim-airline
packadd! vim-airline-themes

" file icons
" https://github.com/ryanoasis/vim-devicons
packadd! vim-devicons

" a Vim plugin which shows a git diff in the sign column and handles hunks
" https://github.com/airblade/vim-gitgutter
packadd! vim-gitgutter

" make the yank region apparent
" https://github.com/machakann/vim-highlightedyank
packadd! vim-highlightedyank

" Neosolarized theme
" https://github.com/iCyMind/NeoSolarized
packadd! NeoSolarized

" display the indention levels with thin vertical lines
" https://github.com/Yggdroot/indentLine
packadd! indentLine

" fix focus reporting inside tmux
" https://github.com/tmux-plugins/vim-tmux-focus-events
packadd! vim-tmux-focus-events

" }}}

" Navigation {{{

" fast file navigation
" https://github.com/ctrlpvim/ctrlp.vim
packadd! ctrlp.vim

" fuzzy file search
" https://github.com/junegunn/fzf
packadd! fzf
packadd! fzf.vim

" seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
packadd! vim-tmux-navigator

" better directory browser
" https://github.com/tpope/vim-vinegar
packadd! vim-vinegar

" NERDTree
" https://github.com/preservim/nerdtree
packadd! nerdtree

" }}}

" Tools {{{

" a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
packadd! vim-fugitive

" file encryption
" https://github.com/jamessan/vim-gnupg
packadd! vim-gnupg

" a solid language pack
" https://github.com/sheerun/vim-polyglot
packadd! vim-polyglot

" join lines flexibly
" https://github.com/sk1418/Join
packadd! Join

" }}}

" Filetype specific {{{
" Can I move this to ftplugin? No, see
" https://vi.stackexchange.com/questions/22095/why-packadd-from-ftplugin-does-not-work-the-same-way-as-from-vimrc

" Asynchronous Lint Engine
" https://github.com/dense-analysis/ale
packadd! ale

"Code completion
" https://github.com/prabirshrestha/asyncomplete.vim
" https://github.com/prabirshrestha/vim-lsp
" https://github.com/prabirshrestha/asyncomplete-lsp.vim
" ATTENTION: run :!pip install python-language-server
packadd! asyncomplete.vim
packadd! vim-lsp
packadd! asyncomplete-lsp.vim

" Python: folding
" https://github.com/tmhedberg/SimpylFold
packadd! SimpylFold

" Markdown: preview
" https://github.com/iamcco/markdown-preview.nvim
" ATTENTION: run :call mkdp#util#install() before first use
packadd! markdown-preview.nvim

" }}}

filetype indent plugin on
syntax on

" Load help for all plugins
packloadall
silent! helptags ALL
