" Called after everything just before setting a default colorscheme
" Configure you own bindings or other preferences. e.g.:

" set nonumber " No line numbers
" let g:gitgutter_signs = 0 " No git gutter signs

" Python settings
let g:syntastic_python_checkers=['flake8', 'pylint']
let syntastic_python_flake8_args='--ignore=E501,E225,W293,E126,E127,E128,E221'
let g:syntastic_python_checker_args='--ignore=E501,E225,W293,E126,E127,E128,E221'

" Ignore non-text or back-up files.
set wildignore=*.o,*.obj,*.a,*.lib,*.so,*.dll,*.exe,*.pyc,*.class,*.swp,*~

" Auto add head info
" .py file auto add header
function HeaderPython()
    call setline(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


colorscheme base16-material
let g:lightline = {
      \ 'colorscheme': 'material',
      \ }
