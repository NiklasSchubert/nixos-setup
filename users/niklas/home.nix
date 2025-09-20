{ inputs, ... }: {
  imports = [
    ../../home/core.nix
    inputs.dots-hyprland.homeManagerModules.default
  ];

  programs.dots-hyprland = {
    enable = true;
    source = ./configs;  # Use local configs
    packageSet = "essential";
    mode = "hybrid";
    
    # 🎨 Quickshell Configuration
    quickshell = {
      appearance = {
        extraBackgroundTint = true;
        fakeScreenRounding = 2;  # When not fullscreen
        transparency = false;
      };
      
      bar = {
        bottom = false;  # Top bar
        cornerStyle = 0;  # Hug style
        topLeftIcon = "spark";
        showBackground = true;
        verbose = true;
        
        utilButtons = {
          showScreenSnip = true;
          showColorPicker = true;   # 🎯 Enable color picker!
          showMicToggle = false;
          showKeyboardToggle = true;
          showDarkModeToggle = true;
          showPerformanceProfileToggle = false;
        };
        
        workspaces = {
          monochromeIcons = true;
          shown = 10;
          showAppIcons = true;
          alwaysShowNumbers = false;
          showNumberDelay = 300;
        };
      };
      
      battery = {
        low = 20;
        critical = 5;
        automaticSuspend = true;
        suspend = 3;
      };
      
      apps = {
        terminal = "foot";
        bluetooth = "kcmshell6 kcm_bluetooth";
        network = "plasmawindowed org.kde.plasma.networkmanagement";
        taskManager = "plasma-systemmonitor --page-name Processes";
      };
      
      time = {
        format = "hh:mm";
        dateFormat = "ddd, dd/MM";
      };
    };
    
    # 🖥️ Hyprland Configuration
    hyprland = {
      general = {
        gapsIn = 4;
        gapsOut = 7;
        borderSize = 2;
        allowTearing = false;
      };
      
      decoration = {
        rounding = 16;
        blurEnabled = true;
      };
      
      gestures = {
        workspaceSwipe = true;
      };
      
      monitors = [
        # Add your monitor config here, e.g.:
        # "eDP-1,1920x1080@60,0x0,1"
      ];
    };
    
    # 🖥️ Terminal Configuration
    terminal = {
      scrollback = {
        lines = 1000;
        multiplier = 3.0;
      };
      
      cursor = {
        style = "beam";
        blink = false;
        beamThickness = 1.5;
      };
      
      colors = {
        alpha = 0.95;
      };
      
      mouse = {
        hideWhenTyping = false;
        alternateScrollMode = true;
      };
    };
  };
            

}