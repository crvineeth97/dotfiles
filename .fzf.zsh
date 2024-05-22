# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tyrion/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tyrion/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/tyrion/.fzf/shell/completion.zsh"

# Key bindings
# ------------
# source "/home/tyrion/.fzf/shell/key-bindings.zsh"
