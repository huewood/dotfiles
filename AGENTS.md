# Dotfiles Repository Instructions

This repository contains personal configuration files managed with GNU Stow. Paths under the repository mirror paths under `$HOME`; for example, `.config/hypr/hyprland.lua` is linked to `~/.config/hypr/hyprland.lua`.

## Working in this repository

- Edit the tracked source under `~/dotfiles`, not the live path in `$HOME` once Stow has linked it.
- Keep configuration paths in the repository aligned with their intended home-directory paths.
- Preserve unrelated settings and existing user customisations; make the smallest requested change.
- Keep secrets, credentials, host-specific tokens, and generated caches out of the repository.
- Do not commit or push changes unless explicitly asked.

## GNU Stow

- Run Stow from the repository root; the documented install command is `stow .`.
- Before changing links or adopting existing files, inspect the plan with `stow --no --verbose --target="$HOME" .`.
- Use `stow -D .` to remove links. Do not use `--adopt` broadly without checking exactly which files it would move into the repository.
- `AGENTS.md` is repository guidance, not a home-directory config, and must remain excluded from Stow.

## Validation

- After editing, review the diff and check `git status` for unintended files.
- Fish: run `fish -n ~/.config/fish/config.fish` (or the corresponding repository source).
- Fastfetch: validate JSON/JSONC and run the configured command when practical.
- Hyprland: this repository uses a Lua config at `.config/hypr/hyprland.lua`; on the active desktop, reload with `hyprctl reload` and verify important bindings with `hyprctl binds`. If runtime access is unavailable, say so rather than claiming the desktop behavior was tested.
- Verify Stow changes with a dry run and confirm each home endpoint resolves to the intended repository source.
