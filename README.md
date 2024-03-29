# dotfiles

Steps to set up:

1.Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- brew tap Homebrew/Bundle # install homebrew bundle
- copy common.Brewfile to ~
- brew bundle --file="~/common.Brewfile" # install brew formulas & casks in Brewfile

2.Config bash
- Copy .bash_profile, .bash_creds to ~

3.Install zsh [instruciton](https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c)
  - oh-my-zsh.
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz update
```
  - powerlevel10k zsh theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
  - CMD cheatsheet: https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet
- Install font and zsh theme Powerlevel. Default font cannot recognize many symbols. [here](https://github.com/romkatv/powerlevel10k#getting-started)
  - run `exec zsh` or 'omz reload' to apply the change of .zshrc. Enter into Wizard to customize your theme. 
  - use `omz reload` instead of 'source .zshrc'
  - Zsh completion

4.Install Vim
- .vimrc
- ~/.vim/plugins.vim
- Install Vim Vundle
  https://github.com/VundleVim/Vundle.vim#quick-start
- brew install macvim

5.Install Tmux
- brew install tmux
- ~/.tmux.conf
- install Tmux Plugin Manager(TPM) https://arcolinux.com/everything-you-need-to-know-about-tmux-plugins-manager/

6.Iterm2
- integrate with Tmux
- font, color, style, etc

7.git
- ~/.gitconfig
- zsh git plugin provides many useful features [here](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)

8.Productivity tools & Theme
- Follow https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99#4abb

9.Mac App - already installed via BrewBundle
- [hammerspoon-shiftit](https://github.com/peterklijn/hammerspoon-shiftit)
- Alfred.  A global search spotlight alternatives on MacOS
  
10.Chrome extension
- Google Drive Save, Google Keep(image), pocket, Toby, Evernote, OneTab; translation, short url, Marinara Pomodoro, Grammarly, Glean
- Git related. SourceGraph, Gif for Github, Ginger, OctoTree, Better Pull Request
- Theme: Momentum


## dev env config
1. Java
- brew install --cask adoptopenjdk8
2. Maven
- By default, local repo location is ~/.m2/repository
- global settings at {M2_HOME}/conf/settings.xml
3. Gradle
-  global/user settings at ~/.gradle/gradle.properties

## ctags
Use ctags in Vim: https://andrew.stwrt.ca/posts/vim-ctags/

### Auto-generate ctags

Easytags can help manage tags but it's slow for big repo.
https://github.com/xolox/vim-easytags

For big repro, could set up CI/CD to build ctags in repro continuously. Local dev can live pull and share the same prebuilt ctags.  In local could just build the ctags for the new and modified files.

## Tagbar
A class outline viewer for file. It create a sidebar that display ctags-generated tags of the current file, ordered by scope.
It is not a general-purpose tool for managing tags files. It only creates the tags it needs on-the-fly in-memory without creating any files.
https://github.com/preservim/tagbar/wiki



# shortcuts
Github:
cmd + k: navigation
