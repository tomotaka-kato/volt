function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *before* a plugin is loaded.
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
  
  let g:LanguageClient_serverCommands = {'haskell' : ['hie-wrapper']}
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
  map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
  map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
  map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
  map <Leader>lb :call LanguageClient#textDocument_references()<CR>
  map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
  map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

  hi link ALEError Error
  hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
  hi link ALEWarning Warning
  hi link ALEInfo SpellCap

  let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
endfunction

function! s:loaded_on()
  " This function determines when a plugin is loaded.
  "
  " Possible values are:
  " * 'start' (a plugin will be loaded at VimEnter event)
  " * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
  " * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
  " <filetypes> and <excmds> can be multiple values separated by comma.
  "
  " This function must contain 'return "<str>"' code.
  " (the argument of :return must be string literal)

  return 'start'
endfunction

function! s:depends()
  " Dependencies of this plugin.
  " The specified dependencies are loaded after this plugin is loaded.
  "
  " This function must contain 'return [<repos>, ...]' code.
  " (the argument of :return must be list literal, and the elements are string)
  " e.g. return ['github.com/tyru/open-browser.vim']

  return []
endfunction