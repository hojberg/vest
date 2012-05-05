# Vest

Simple vim test runner

## install with pathogen

```
git submodule add git@github.com:hojberg/vest.git
git submodule init
```

## Setup patterns and runners

```VimL
let g:vest_runners = { 
  \ '_spec.rb': 'bundle exec rspec %', 
  \ '.feature': 'bundle exec rake cucumber FEATURE=%'
  \ }
```

## Setup mapping:
```VimL
nnoremap <leader>t :Vest<cr>
```
