# Media applications and multimedia tools
{ inputs, lib, pkgs, pkgs-old, pkgs-unstable, ... }:
{
  # Media packages
  home.packages = with pkgs; [
    # Media players
    mpv
    
    # Audio tools
    pavucontrol
    wireplumber
    playerctl
    
    # Audio effects and plugins
    libdbusmenu-gtk3
        
    # Image processing
    imagemagick
    
    # Screenshot and recording tools
    swappy
    wf-recorder
    grim
    slurp
    
    # Wallpaper management
    swww
  ];
}
