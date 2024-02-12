dev() {
    echo "ready to code $1!"
    nix develop ~/.shells/$1
       
}

s(){
    sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/
}

