if status is-interactive
  # Setting intro message
  function fish_greeting
    # If iterm2, run neofetch for epicness
    if test "$TERM_PROGRAM" = "iTerm.app"
      neofetch
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

  # Using full filepath; not squished
  set -g fish_prompt_pwd_dir_length 0
end
