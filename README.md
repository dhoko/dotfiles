dotfiles
========

## 2025

- _macos_: Move windows *ctrl + cmd + click* `defaults write -g NSWindowShouldDragOnGesture -bool true` [source](https://www.reddit.com/r/MacOS/comments/mwuaqr/comment/gvkdb0e/)

## 2023

- Add Helix editor config
- Add Alacritty config
- Add npmrc config
- Add oh my zsh config

UI: (_xfce4_)
  - Theme: Arc-Dark
  - Icons: Maia
  - Font: Noto sans regular 15
  - Default monospace: Monospace Regular 15
  - Rendering: 
    - [x] Enable anti-aliasing
    - Hinting: Slight
    - sub-pixel order: RGB
  - DPI: 96



## Pre 2023

Fichiers de configuration sur ma Debian

- Configuration du terminal
- Configuration du rendu des polices (rendu propre)
- Configuration de SublimeText2
- Configuration de Tmux
- Script de synchronisation de laravel sur le RaspberryPi
- Serveur de dev avec livereload auto
- Edition bash

## Prérequis

- python (si usage de server)
- node.js npm && browser-sync, http-server (si usage de front-dev)
- [z](https://github.com/rupa/z) (~/scripts/z.sh)
- [fzf](https://github.com/junegunn/fzf)
- [tmux](https://github.com/tmux/tmux/wiki)
- [TMUX plugin manager](https://github.com/tmux-plugins/tpm)
- [Tmux Resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [npm-merge-driver](https://www.npmjs.com/package/npm-merge-driver)

## Commandes

### Réglages du son (F10-F9-F8)
```shell
amixer set Master 5%+
amixer set Master 5%-
amixer set Master toggle
```

## Plugins pour Sublime Text 2/3

- Pretty JSON [GitHub](https://github.com/dzhibas/SublimePrettyJson)
- Prefixr [Site](http://wbond.net/sublime_packages/prefixr)
- Phpcs [Site](http://www.soulbroken.co.uk/code/sublimephpcs/)
- AlignTab [GitHub](https://github.com/randy3k/AlignTab)
- AngularJS Attributes Autocompletion [GitHub](https://github.com/subhaze/angularjs-attributes)
- BracketsHighlight [GitHub](https://github.com/facelessuser/BracketHighlighter)
- Yii Framework snippets [GitHub](https://github.com/dexnode/sublime-yii-snippets)
- CommandOnSave [GitHub](https://github.com/klaascuvelier/ST2-CommandOnSave)
- All Autocomplete [GitHub](https://github.com/alienhard/SublimeAllAutocomplete)
- DocBlockr [GitHub](https://github.com/spadgos/sublime-jsdocs)
- Emmet [GitHub](https://github.com/sergeche/emmet-sublime)
- LiveStyle [Site](http://livestyle.emmet.io/)
- Sublime unicode nbsp [GitHub](https://github.com/possan/sublime_unicode_nbsp)


## Setup vim

- [VimBundle](https://github.com/VundleVim/Vundle.vim)
