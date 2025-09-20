{
  description = "Hyprland + Caelestia Shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dots-hyprland = {
      url = "github:celesrenata/end-4-flakes";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, dots-hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        tuxedo = let
          username = "niklas";
          specialArgs = {inherit username dots-hyprland;};
        in lib.nixosSystem {
          inherit specialArgs;
          modules = [
            home-manager.nixosModules.default  
            
            ./hosts/tuxedo/configuration.nix
            ./users/${username}/nixos.nix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix  { inherit inputs; };
            }
          ];
        };
      };
    };
}