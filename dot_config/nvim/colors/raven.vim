" Name:         raven
" Description:  Dark theme using classic xterm cterm colors on a black background
" Author:       Brian Pomerantz
" License:      Copyright (c) 2026 Brian Pomerantz. All Rights Reserved.

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'raven'

" cterm color map (standard xterm palette):
" 0=#000000  1=#cd0000  2=#00cd00  3=#cdcd00
" 4=#0087ff  5=#cd00cd  6=#00cdcd  7=#e5e5e5

hi Normal       guifg=#e5e5e5 guibg=#000000 gui=NONE

hi SpecialKey   guifg=#0087ff guibg=NONE    gui=NONE
hi NonText      guifg=#0087ff guibg=NONE    gui=bold
hi Directory    guifg=#0087ff guibg=NONE    gui=NONE
hi ErrorMsg     guifg=#e5e5e5 guibg=#cd0000 gui=bold
hi IncSearch    guifg=NONE    guibg=NONE    gui=reverse
hi Search       guifg=NONE    guibg=#cdcd00 gui=NONE
hi MoreMsg      guifg=#00cd00 guibg=NONE    gui=NONE
hi ModeMsg      guifg=NONE    guibg=NONE    gui=bold
hi LineNr       guifg=#cdcd00 guibg=NONE    gui=NONE
hi Question     guifg=#00cd00 guibg=NONE    gui=NONE
hi StatusLine   guifg=NONE    guibg=NONE    gui=bold,reverse
hi StatusLineNC guifg=NONE    guibg=NONE    gui=reverse
hi VertSplit    guifg=NONE    guibg=NONE    gui=reverse
hi Title        guifg=#cd00cd guibg=NONE    gui=NONE
hi Visual       guifg=NONE    guibg=NONE    gui=reverse
hi VisualNOS    guifg=NONE    guibg=NONE    gui=bold,underline
hi WarningMsg   guifg=#cd0000 guibg=NONE    gui=NONE
hi WildMenu     guifg=#000000 guibg=#cdcd00 gui=NONE
hi Folded       guifg=#0087ff guibg=#e5e5e5 gui=NONE
hi FoldColumn   guifg=#0087ff guibg=#e5e5e5 gui=NONE
hi DiffAdd      guifg=NONE    guibg=#0087ff gui=NONE
hi DiffChange   guifg=NONE    guibg=#cd00cd gui=NONE
hi DiffDelete   guifg=#0087ff guibg=#00cdcd gui=bold
hi DiffText     guifg=NONE    guibg=#cd0000 gui=bold
hi Cursor       guifg=bg      guibg=fg
hi lCursor      guifg=bg      guibg=fg

hi Comment      guifg=#0087ff guibg=NONE    gui=NONE
hi Constant     guifg=#cd0000 guibg=NONE    gui=NONE
hi String       guifg=#00aa00 guibg=NONE    gui=NONE
hi Special      guifg=#cd00cd guibg=NONE    gui=NONE
hi Identifier   guifg=#00cdcd guibg=NONE    gui=NONE
hi Statement    guifg=#cdcd00 guibg=NONE    gui=bold
hi PreProc      guifg=#cd00cd guibg=NONE    gui=NONE
hi Type         guifg=#00cd00 guibg=NONE    gui=bold
hi Ignore       guifg=#e5e5e5 guibg=NONE    gui=bold
hi Error        guifg=#e5e5e5 guibg=#cd0000 gui=bold
hi Todo         guifg=#000000 guibg=#cdcd00 gui=NONE
