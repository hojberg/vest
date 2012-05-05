" vest.vim - Run tests from vim
" Maintainer: Simon Højberg <http://icreateui.com/>
" Version: 1.0.0

hi VestSuccess guifg=#005f00 guibg=#b1d631 gui=bold ctermfg=22 ctermbg=148 cterm=bold
hi VestFailed guifg=#d70000 guibg=#5f0000 gui=bold ctermfg=216 ctermbg=52 cterm=bold

if !exists('g:vest_runners') 
  let g:vest_runners = { 
    \ '_spec.rb': 'bundle exec rspec %', 
    \ '.feature': 'bundle exec rake cucumber FEATURE=%'
    \ }
end

command Vest :call VestRunner()

function! VestRunner()
  write

  let current_file = expand('%')

  " loop over runners
  for [matcher, runner] in items(g:vest_runners)
    " if the current file matches a runner, run it
    if match(current_file, matcher) != -1
      exec '!' . runner

      " If the command is successful, go back to 
      " vim and show a passed message
      if shell_error == 0
        redraw!
        echohl VestSuccess
        echo ' PASSED! '
        echohl None
      else
        echohl VestFailed
        echo ' FAILED! '
        echohl None
      endif

    endif
  endfor

endfunction
