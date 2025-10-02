{ pkgs, ... }:

{
  users.users.niklas = {
    isNormalUser = true;
    description = "Niklas";
    extraGroups = [ "networkmanager" "scanner" "lp" "wheel" "input" "uinput" "render" "video" "audio" "docker" "libvirt" "kvm" "vboxusers" "adbusers" "gamemode" ];
    initialPassword = "changeme";
    packages = with pkgs; [
      tree
    ];
  };
}