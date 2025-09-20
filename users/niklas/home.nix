{ inputs, ... }: {
  imports = [
    ../../home/core.nix
    inputs.dots-hyprland.homeManagerModules.default
  ];

  programs.dots-hyprland = {
    enable = true;
    source = ./configs;
    packageSet = "essential";
    mode = "declarative";
    
    quickshell = {
      appearance = {
        transparency = true;
        fakeScreenRounding = 1;
      };
      
      bar = {
        bottom = true;  # Move bar to bottom
        topLeftIcon = "distro";
        cornerStyle = 1;  # Float style
        
        utilButtons = {
          showColorPicker = true;
          showScreenSnip = true;
          showMicToggle = true;
          showDarkModeToggle = true;
        };
        
        workspaces = {
          shown = 5;  # Only show 5 workspaces
          monochromeIcons = false;
          alwaysShowNumbers = true;
        };
      };
      
      battery = {
        low = 25;
        critical = 10;
        automaticSuspend = false;
      };
      
      apps = {
        terminal = "foot";
        taskManager = "htop";
      };
      
      time = {
        format = "HH:mm:ss";  # 24-hour with seconds
        dateFormat = "dddd, MMMM dd, yyyy";
      };
    };
    
    hyprland = {
      general = {
        gapsIn = 6;
        gapsOut = 10;
        borderSize = 3;
        allowTearing = true;  # For gaming
      };
      
      decoration = {
        rounding = 12;
        blurEnabled = false;  # Disable for performance
      };
      
      gestures = {
        workspaceSwipe = true;
      };
      
      monitors = [
        "eDP-1,1920x1080@60,0x0,1"
        "HDMI-A-1,1920x1080@60,1920x0,1"
      ];
    };
  };
}