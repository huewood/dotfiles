if status is-interactive
  # Setting intro message
  function fish_greeting
    # Scale the image logo to the current Ghostty window width.
    if test "$TERM" = "xterm-ghostty"
      set -l terminal_width (tput cols 2>/dev/null)
      if not string match -rq '^[0-9]+$' -- "$terminal_width"
        set terminal_width 120
      end
      set -l logo_width (math "min(50, max(12, floor($terminal_width * 0.38)))")
      if test $terminal_width -lt 110
        # Give system info the full line width in smaller windows.
        fastfetch --logo-width $logo_width --logo-position top --disable-linewrap false
      else
        fastfetch --logo-width $logo_width
      end
    # If iTerm2, run fastfetch
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

direnv hook fish | source

