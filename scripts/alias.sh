dev() {
    echo "ready to code $1!"
    nix develop ~/.dotfiles/shells/$1
       
}

s(){
    sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/
}

