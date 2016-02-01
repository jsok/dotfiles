dotfiles
========

My dotfiles

Requirements
------------

Get rcm, follow the [installation guide](https://github.com/thoughtbot/rcm#installation) for your platform.

`.rcrc` Template
---------------

Create a `$HOME/.rcrc` with something like:

```bash
EXCLUDES="README.md LICENSE"
DOTFILES_DIRS="$HOME/.dotfiles-work $HOME/.dotfiles"
HOSTNAME="scribbly"
TAGS="osx github iterm2"
UNDOTTED="Library"
```

Make it happen
-------------

Install all the .rc files:

```shell
rcup
```

List all the ones which got installed:

```shell
lsrc
```

