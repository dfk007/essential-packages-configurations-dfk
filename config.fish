# Initialize oh-my-posh with theme
oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source

# VirtualFish activation hook to display venv in oh-my-posh
if test -n "$VIRTUAL_ENV"
    set -gx VIRTUALFISH_PROMPT "($(basename $VIRTUAL_ENV))"
else
    set -gx VIRTUALFISH_PROMPT ""
end

# Reapply the virtual environment prompt after each activation
function fish_vf_post_activate --on-event virtualfish_did_activate
    set -gx VIRTUALFISH_PROMPT "($(basename $VIRTUAL_ENV))"
end

# Clear the prompt variable upon deactivation
function fish_vf_post_deactivate --on-event virtualfish_did_deactivate
    set -gx VIRTUALFISH_PROMPT ""
end

# Check for interactive sessions
if status is-interactive
    source ~/.config/fish/functions/pacman_aliases.fish
    fastfetch
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'
end

# Set PATH and additional environment setups
set -gx PATH $PATH /var/lib/snapd/snap/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
zoxide init fish | source

# Add fenv to path
set fish_function_path $fish_function_path ~/plugin-foreign-env/functions

# Warp-specific interactive check
if status is-interactive
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end

# NVM configuration
set -x NVM_DIR $HOME/.nvm
if test -s "$NVM_DIR/nvm.sh"
    . "$NVM_DIR/nvm.sh"
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/home/dfk/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

set -Ux PATH $PATH /home/dfk/.npm-global/bin
