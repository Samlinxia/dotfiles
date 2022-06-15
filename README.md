# dotfiles

Steps to set up:

1.Install brew

2.Install zsh [instruciton](https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c)
- oh-my-zsh.
  - CMD cheatsheet: https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet
- Install font and zsh theme Powerlevel. Default font cannot recognize many symbols. [here](https://github.com/romkatv/powerlevel10k#getting-started)
  - run `exec zsh` to apply the change of .zshrc. Enter into Wizard to customize your theme.

3.Install homebrew

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

6.Config Iterm2
- integrate with Tmux
- font, color, style, etc

7.Install & config git
- brew git
- brew git-lfs
- ~/.gitconfig
- zsh git plugin provides many useful features [here](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)

8.brew install various handy dev tool, zsh plugins, tips and useful commands
- aws, gcp, jq(json parser)
- Follow https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99#4abb

## Language pkg
1. Java
- brew install --cask adoptopenjdk8
2. Maven
- brew install maven
- By default, local repo location is ~/.m2/repository
- global settings at {M2_HOME}/conf/settings.xml
3. Gradle
-  global/user settings at ~/.gradle/gradle.properties
4. Python3, pip3

## Code search tool
AG. The silver searcher - ACK/Grep like tool
https://github.com/ggreer/the_silver_searcher#installing

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
