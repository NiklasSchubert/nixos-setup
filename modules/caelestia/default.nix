{ config, pkgs, lib, ... }:

let
  caelestiaConfigDir = ./.;
in
{
  home.packages = with pkgs; [
    caelestia-shell
    caelestia-cli
  ];

  xdg.configFile."caelestia/shell.json".source =
    caelestiaConfigDir + "/shell.json";

  xdg.stateFile."caelestia/wallpaper/path.txt".source =
    caelestiaConfigDir + "/path.txt";
}
