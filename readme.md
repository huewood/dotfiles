# huewood's dotfiles

Configuring a fresh install of a unix-based OS (macOS, Linux) for development purposes.

For now, just creating some basic configuration files. Installations coming soon.

Due to symlinks & `stow` requirements, be sure to clone this repository into your home directory (~/.dotfiles).

# Tools

This setup requires [gnu stow](https://www.gnu.org/software/stow/) to be installed. 

Stow will setup the symlinks to the respective tools:
- [fish shell](https://fishshell.com/)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)

# Usage

Add symlinks:

```bash
stow .
```

Remove symlinks:

```bash
stow -D .
```
