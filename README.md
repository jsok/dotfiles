dotfiles
========

My dotfiles

Requirements
------------

Get rcm:

```shell
wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.3-1_all.deb
sudo dpkg -i rcm_1.2.3-1_all.deb
```

git-crypt
---------

Get git-crypt:

```shell
git clone https://github.com/AGWA/git-crypt.git
cd git-crypt
make
sudo cp git-crypt /usr/local/bin
```

Initialise git-crypt with my keyfile:

```shell
cd ~/.dotfiles
git-crypt init /path/to/dotfiles-keyfile
```

$RCRC Template
---------------

Create a `$HOME/.rcrc` with something like:

```bash
EXCLUDES="README.md LICENSE"
DOTFILES_DIRS="$HOME/.dotfiles-work $HOME/.dotfiles"
HOSTNAME="scribbly"
TAGS="linux xorg"
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

