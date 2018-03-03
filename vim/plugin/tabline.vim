if (exists("g:loaded_tabline_xx") && g:loaded_tabline_xx) || &cp
  finish
endif

let g:loaded_tabline_xx = 1

function! tabline#render()
  let s = '%#TabLineFill#'
  let tabCount = len(range(tabpagenr('$')))
  let currentPage = tabpagenr()
  let start = currentPage - 2
  let end   = currentPage + 2

  if start < 0
    let start = 0
  endif

  if end >= tabCount
    let end = tabCount - 1
  endif

  if end - start < 6
    let start = start - (6 - (end - start))
  endif

  if start < 0
    let start = 0
  endif

  let arrow = "\ue0b0"
  let arrowLight = "\ue0b1"

  let nextMore = ""
  let prevMore = ""
  for i in range(tabpagenr('$'))
    let tab = i + 1

    if i < start
        let prevMore .= tab."."
        continue
    endif
    if i > end
        let nextMore .= tab."."
        continue
    endif

    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")
    let bufname = (bufname != '' ? ' '. fnamemodify(bufname, ':t') . ' ' : '[No Name] ')

    if len(bufname) > 14
        "let bufname = system("echo 'aaa'")
        let nbufname = strpart(bufname, 0, 10) . '..'
        let nbufname .= strpart(bufname, len(bufname) - 4, 3)
        let bufname = nbufname
    endif

    if i + 1 == currentPage
      let s .= '%#TabLineSel# ' .tab . ':' . bufname
      if bufmodified
        let s .= '[+] '
      endif
      let s .=  '%#TabLineSelRightIcon#' . arrow
    else
      let s .= '%#TabLine# ' .tab.':' . bufname
      if bufmodified
        let s .= '[+] '
      endif

      if i + 2 == currentPage
        let s .=  "%#TabLineRightIcon#".arrow
      else
        let s .= arrowLight
      endif
    endif
  endfor
  if prevMore != ""
      let prevMore = "%#TabLine#" . prevMore . arrowLight
  endif
  if nextMore != ""
      let nextMore = " " . nextMore
  endif
  let s = prevMore . s . nextMore . '%#TabLineFill#'
  return s
endfunction

function! tabline#GetBuffList()
    return filter(range(1,bufnr('$')),'buflisted(v:val) && "quickfix" !=? getbufvar(v:val, "&buftype")')
endfunction

function! tabline#getBufferBar()
  let s = ''
  let tabCount = len(tabline#GetBuffList())
  let currentPage = winbufnr(0)
  let start = currentPage - 2
  let end   = currentPage + 2

  if start < 0
    let start = 0
  endif

  if end >= tabCount
    let end = tabCount - 1
  endif

  if end - start < 6
    let start = start - (6 - (end - start))
  endif

  if start < 0
    let start = 0
  endif

  let arrow = "\ue0b0"
  let arrowLight = "\ue0b1"

  let nextMore = ""
  let prevMore = ""

  let buflist = tabline#GetBuffList()
  for i in range(bufnr('$'))
    let tab = i + 1

    if i < start
        let prevMore .= tab."."
        continue
    endif
    if i > end
        let nextMore .= tab."."
        continue
    endif

    let bufnr = buflist[i]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")
    let bufname = (bufname != '' ? ' '. fnamemodify(bufname, ':t') . ' ' : '[No Name] ')

    if len(bufname) > 14
        "let bufname = system("echo 'aaa'")
        let nbufname = strpart(bufname, 0, 10) . '..'
        let nbufname .= strpart(bufname, len(bufname) - 4, 3)
        let bufname = nbufname
    endif

    if i + 1 == currentPage
      let s .= '%#TabLineSel# ' .tab . ':'
      let s .= bufname
      if bufmodified
        let s .= '[+] '
      endif

      if i + 1 != tabCount
          let s .=  '%#TabLineSelRightIcon#' . arrow
      endif

    else
      let s .= '%#TabLine# ' .tab.':'
      let s .= bufname
      if bufmodified
        let s .= '[+] '
      endif

      if i + 2 == currentPage
        let s .=  "%#TabLineRightIcon#".arrow
      elseif i+ 1 != tabCount
        let s .= arrowLight
      endif
    endif
  endfor
  if prevMore != ""
      let prevMore = "%#TabLine#" . prevMore . arrowLight
  endif
  if nextMore != ""
      let nextMore = " " . nextMore
  endif
  let s = prevMore . s . nextMore . '%#TabLineFill#'
  return s
endfunction

function! tabline#updateBuffer()
    set tabline=%!tabline#getBufferBar()
endfunction

if (exists("g:forceUseTab") && g:forceUseTab == 1)
    set tabline=%!tabline#render()
    let g:loaded_tabline_type = 1
else
    set showtabline=2
    set tabline=%!tabline#updateBuffer()
    let g:loaded_tabline_type = 2
    autocmd BufAdd    * call tabline#updateBuffer()
    autocmd BufDelete * call tabline#updateBuffer()
    autocmd TabEnter  * call tabline#updateBuffer()
    autocmd VimEnter  * call tabline#updateBuffer()

endif


