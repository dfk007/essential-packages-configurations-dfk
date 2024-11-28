# Alias for installing packages without confirmation
function ass
    sudo pacman --noconfirm -S $argv
end
complete -c ass -w 'pacman --noconfirm -S' -a '(pacman -Slq)'

# Alias for searching packages
function sss
    sudo pacman -Ss $argv
end
complete -c sss -w 'pacman -Ss' -a '(pacman -Slq)'

# Alias for showing package information
function ssss
    sudo pacman -Si $argv
end
complete -c ssss -w 'pacman -Si' -a '(pacman -Slq)'
# -----------syu alias changed below
# Alias for system update
#function syu
#    sudo pacman -Syu
#end
#complete -c syu -w 'pacman -Syu'
# Alias for a complete system update on Manjaro
function syu
    # Update system packages with pacman
    sudo pacman -Syu
    
    # Update AUR packages with yay
    yay -Syu --noconfirm
    
    # Update snap packages
    if type -q snap
        echo "Updating snap packages..."
        sudo snap refresh
    end
    
    # Update flatpak packages
    if type -q flatpak
        echo "Updating flatpak packages..."
        flatpak update -y
    end
end
complete -c syu -w 'pacman -Syu; yay -Syu --noconfirm; snap refresh; flatpak update -y'
# --------- syu alias changed above
# Alias for removing packages with dependencies
function rns
    sudo pacman -Rns $argv
end
complete -c rns -w 'pacman -Rns' -a '(pacman -Qq)'

# Alias for editing files with sudo nano
function nano
    sudo nano $argv
end
complete -c nano -f -a '(__fish_complete_path)'

# Alias for creating a directory and cd into it
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end
