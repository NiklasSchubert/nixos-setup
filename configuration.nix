{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./disk-config.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
  nixpkgs.config.allowUnfree = true;
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.pipewire.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb.layout = "de";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      niklas = import ./home.nix;
    };
  };

  users.users.niklas = {
    isNormalUser = true;
    description = "Niklas";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    initialPassword = "changeme";
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment? Don't change it's not the packge version!

}

