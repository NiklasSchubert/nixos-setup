{
  description = "Hyprland + Caelestia Shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          inputs.home-manager.nixosModules.default
          ./configuration.nix
          {
            nixpkgs.overlays = [
              (final: prev: {
                caelestia-shell = caelestia-shell.packages.${system}.caelestia-shell;
                caelestia-cli   = caelestia-shell.inputs.caelestia-cli.packages.${system}.caelestia-cli;
              })
            ];
          }
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.niklas = {
              imports = [
                #./modules/hm #CHANGE ME FOR UR SETUP
                #./modules/hyprland #CHANGE ME FOR UR SETUP
                ./modules/caelestia #CHANGE ME FOR UR SETUP 
              ];
            };
          }
        ];
      };
    };
}