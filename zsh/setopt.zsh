# cd options
setopt auto_cd
setopt cdablevarS
setopt pushd_ignore_dups

# globbing options
setopt extended_glob

# history options
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# completion options
setopt always_to_end
setopt auto_menu
setopt complete_in_word
unsetopt menu_complete # allows auto_menu to work

# Correction options
setopt correct

# prompt options
setopt prompt_subst
setopt transient_rprompt
