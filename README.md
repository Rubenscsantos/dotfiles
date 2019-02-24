# Dotfiles

Emacs, i3, git, zsh and tmux dotfiles.

## Getting Started

### Prerequisites

- git

### Installing

#### Setup environment in a new computer

##### Clone this repository

`git clone --bare https://github.com/joao/dotfiles.git $HOME/.dotfiles`

##### Define this alias in the current shell scope

`alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

##### Checkout the actual content from the git repository to your $HOME

`dotfiles checkout`

#### Installing using `script.sh`

Run `bash script.sh`

Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back them up somewhere else. It's up to you.

## Contributing

Open a issue or a pull request.

## Authors

* **João Thallis** - *Initial work* - [joaothallis](https://github.com/joaothallis)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under CC0 - see [CC0](https://creativecommons.org/choose/zero/?lang=en) for details

## Acknowledgments

* https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

