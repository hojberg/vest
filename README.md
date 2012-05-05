# Vest

Simple test runnner from vim

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
map <leader>t :call Vest()<cr>
```
