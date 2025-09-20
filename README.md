# Installing the OS

## Setting up disk partitions

1. curl https://raw.githubusercontent.com/NiklasSchubert/nixos-setup/refs/heads/main/hosts/tuxedo/disko.nix -o /tmp/disk-config.nix
1. sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/disk-config.nix
1. If installing on a new devie maybe update the hardware-configuration.nix (optional)

## Installing nixos

- sudo nixos-install --no-write-lock-file --impure --flake github:NiklasSchubert/nixos-setup#tuxedo
  or
- git clone https://github.com/NiklasSchubert/nixos-setup.git
- sudo nixos-install --no-write-lock-file --impure --flake ./nixos-setup#tuxedo

1. curl https://raw.githubusercontent.com/NiklasSchubert/nixos-setup/refs/heads/main/configuration.nix -o /mnt/etc/nixos/configuration.nix

# Handy commands

sudo nixos-install --no-write-lock-file --impure --flake github:NiklasSchubert/nixos-setup#tuxedo
sudo nixos-rebuild switch --no-write-lock-file --impure --flake github:NiklasSchubert/nixos-setup#tuxedo

git clone https://github.com/NiklasSchubert/nixos-setup.git

git fetch && git rebase
