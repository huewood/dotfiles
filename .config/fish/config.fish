if status is-interactive
  # Setting intro message
  function fish_greeting
    # If konsole, run fastfetch
    if set -q KONSOLE_DBUS_SESSION
      fastfetch
    # If iterm2, run fastfetch
    else if test "$TERM_PROGRAM" = "iTerm.app"
      fastfetch
    else
      echo "Good luck."
    end
  end

  # Adding homebrew binaries
  fish_add_path /opt/homebrew/bin

  # Adding additional binaries
  fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  # Aliases
  abbr --add --global k kubectl
  abbr --add --global c clear
  abbr --add --global g git

  ## ASDF configuration
  # ASDF configuration code
  if test -z $ASDF_DATA_DIR
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims

  # Using full filepath; not squished
  set -g fish_prompt_pwd_dir_length 0

  function fish_right_prompt
    date '+%H:%M:%S'
  end

end
