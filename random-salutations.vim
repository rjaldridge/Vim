let rnd = localtime() % 0x10000 " VIM Random Numbers 

function! Random() 
  let g:rnd = (g:rnd * 31421 + 6927) % 0x10000 
  return g:rnd 
endfun 

function! Choose(n) " 0 n within 
  return (Random() * a:n) / 0x10000 
endfun 

let greetings = ['Hi','Hello','Hi, how are things?'] 
let signoffs  = ['Bye','Bye for now', 'Laters']
let ack = ['Ok','Aha','Sure','(Y)','Great']
let nack = ['Not Good','Oh Dear','Shame','Never mind']

amenu Conversation.Greet :call S2C(greetings[Choose(3)])<CR><ESC>
amenu Conversation.Signoff :call S2C(signoffs[Choose(3)])<CR><ESC>
amenu Conversation.Ack :call S2C(ack[Choose(5)])<CR><ESC>
amenu Conversation.Nack :call S2C(nack[Choose(4)])<CR><ESC>

func! PL(str) " Print string into the current buffer
  exe "normal o" . a:str
endf

func! NL()
	exe "normal o" 
endf

func! Print(str) " Print string into the current buffer
	exe "normal i" . a:str
endf

func! P(str) " Print string into the current buffer
	call Print(a:str)
endf

func! SelectAll() " Select all of current buffer
	exe "normal ggVG"
endf

func! SA() " Select all of current buffer
	call SelectAll()
endf

func! SelectLine() " Select current line 
	exe "normal V"
endf

func! SL() " Select current line 
	call SelectLine()
endf

func! Copy() " Copy current selection to clipboard
	exe 'normal "+y'
endf

func! CP() " Copy current selection to clipboard
	call Copy()
endf

func! CopyAll() " Copy current buffer contents to clipboard
	call SelectAll()
	call Copy()
endf

func! CPA() " Copy current buffer contents to clipboard
	call CopyAll()
endf

func! CopyLine() " Copy a single line
	call SelectLine()
	call Copy()
endf

func! CPL() " Copy a single line
	call CopyLine()
endf

func! Cut() " Cut current buffer contents to clipboard
	call CopyAll()
	%d
endf

func! S2C(str) " Put string on clipboard
	%d
	call P(a:str)
	call Cut()
endf
