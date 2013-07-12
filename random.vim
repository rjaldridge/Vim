let rnd = localtime() % 0x10000 " VIM Random Numbers 

function! Random() 
  let g:rnd = (g:rnd * 31421 + 6927) % 0x10000 
  return g:rnd 
endfun 

function! Choose(n) " 0 n within 
  return (Random() * a:n) / 0x10000 
endfun 
