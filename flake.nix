{
  description = "Hyprland + Caelestia Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";              # Main stable channel
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-24.11";          # Previous stable for compatibility
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";  # Latest packages

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dots-hyprland = {
      url = "github:celesrenata/end-4-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dots-hyprland-source.url = "github:celesrenata/dots-hyprland/quickshell-locked";
    dots-hyprland-source.flake = false;                           # Source files only, not a flake

    ags.url = "github:gorsbart/ags";                              # Fork with additional features
  };

  outputs = inputs@{ self, nixpkgs, home-manager, dots-hyprland, dots-hyprland-source, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    
      pkgs-old = import inputs.nixpkgs-old {
        inherit system;
        config = {
          allowUnfree = true;    # Allow proprietary software
          allowBroken = true;    # Allow packages marked as broken
        };
      };  
    in {
      nixosConfigurations = {
        tuxedo = let
          username = "niklas";
          pkgs = import inputs.nixpkgs rec {
            inherit system;
            config = {
              # Hardware acceleration and proprietary software support
              cudaSupport = false;                    # NVIDIA CUDA support for AI/ML
              allowUnfree = true;                    # Enable proprietary packages
              android_sdk.accept_license = true;     # Accept Android SDK license
              allowBroken = true;                    # Allow packages marked as broken
              nvidia.acceptLicense = true; 
              # Specific unfree packages whitelist for security
              allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
                "vscode" "discord" "nvidia-x11" "cudatoolkit" "steam" 
                "steam-original" "steam-run" "cuda_cccl"
              ];

              # Legacy packages for compatibility
              permittedInsecurePackages = [
                "python-2.7.18.7"                        # Legacy Python for compatibility
                "openssl-1.1.1w"                         # Legacy OpenSSL
              ];
            };
            
            # Package overlays for custom and modified packages
            overlays = [
              dots-hyprland.overlays.default # Hyprland desktop environment
              (import ./overlays/materialyoucolor.nix)        # Material You color theming
            ];
          };

          pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit system;
            config = {
              cudaSupport = true;
              allowUnfree = true;
              allowBroken = true;
            };
          };
        in lib.nixosSystem {
          # Special arguments passed to all modules
          specialArgs = {
            inherit pkgs;           # Main package set
            inherit pkgs-unstable;  # Unstable packages
            inherit pkgs-old;				# Old packages
          };

          modules = [            
            ./hosts/tuxedo/configuration.nix
            ./users/${username}/nixos.nix
            home-manager.nixosModules.default  
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true; # Enable verbose output for debugging
              
              home-manager.extraSpecialArgs = { 
                inherit inputs;                           # Flake inputs
                inherit pkgs-unstable;                    # Unstable package set
                inherit pkgs-old;                         # Legacy package set
                inherit username;
              };
              
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
      };
    };
}