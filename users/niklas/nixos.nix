{ pkgs, ... }:

{
  users.users.niklas = {
    isNormalUser = true;
    description = "Niklas";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    initialPassword = "changeme";
    packages = with pkgs; [
      tree
    ];
  };
}