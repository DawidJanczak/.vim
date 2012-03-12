augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
  au! BufRead,BufNewFile *.ttcn3 setfiletype ttcn
  au! BufRead,BufNewFile *.in    setfiletype make
  au! BufRead,BufNewFile *.jelly setfiletype xml
augroup end
