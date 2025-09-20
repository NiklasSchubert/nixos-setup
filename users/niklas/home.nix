{ inputs, ... }: {
  imports = [
    ../../home/core.nix
    inputs.dots-hyprland.homeManagerModules.default
  ];

  programs.dots-hyprland = {
    enable = true;
    style = "illogical-impulse";
    
    components = {
      hyprland = true;
      quickshell = true;
      theming = false;  # Phase 4
      ai = false;       # Phase 4
      audio = true;
    };
    
    features = {
      overview = true;
      sidebar = false;  # Phase 4
      notifications = true;
      mediaControls = true;
    };
    
    keybinds = {
      modifier = "SUPER";
      terminal = "foot";
    };
  };

}