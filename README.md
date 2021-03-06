# Dotfiles

Emacs, vim, code, i3, git, zsh and tmux dotfiles.

## Getting Started

### Prerequisites

- git

### Installing

#### Setup environment in a new computer

##### Clone this repository

`git clone --bare git@github.com:joaothallis/dotfiles.git $HOME/.dotfiles`

##### Define this alias in the current shell scope

`alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

##### Set git status to hide untracked files

`dot config --local status.showUntrackedFiles no`

##### Checkout the actual content from the git repository to your $HOME

`dot checkout`

#### Installing using `script.sh`

Run `bash script.sh`

Note that if you already have some of the files you'll get an error message. You can either delete them or back them up somewhere else. It's up to you.

## Contributing

Open a issue or a pull request.

## Authors

* **João Thallis** - *Initial work* - [joaothallis](https://github.com/joaothallis)

See also the list of [contributors](https://github.com/joaothallis/dotfiles/contributors) who participated in this project.

## License

This project is licensed under CC0 - see [CC0](https://creativecommons.org/choose/zero/?lang=en) for details

## Acknowledgments

* https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

