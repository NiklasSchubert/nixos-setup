1. `git clone https://github.com/NiklasSchubert/nixos-setup.git`
2. `sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./nixos-setup/disko.nix`
