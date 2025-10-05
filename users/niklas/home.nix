{ inputs, lib, pkgs, ... }:
{
  imports = [
    ../../home/core.nix

    # Desktop Environment Configuration
    ../../home/desktop/hyprland.nix          # Hyprland window manager and keybindings
    ../../home/desktop/hypridle.nix          # Hypridle idle management and power saving
    ../../home/desktop/quickshell.nix        # Quickshell desktop shell (placeholder)
    ../../home/desktop/theming.nix           # Cursors, themes, and visual appearance
    
    # Application and Program Configuration
    ../../home/programs/media.nix           # Media applications (OBS, players, editors)
  ];

    # Desktop environment and Wayland packages
  home.packages = with pkgs; [
    # Wayland and desktop environment
    xdg-desktop-portal-hyprland
    xwayland
    brightnessctl
    wlsunset
    wayland-scanner
    waypipe
    xorg.xhost
    wev
    
    # Desktop utilities
    polkit
    polkit_gnome
    dconf
    killall
    gnome-keyring
    wayvnc
    evtest
    zenity
    linux-pam
    cliphist
    sudo
    ssh-tools
    
    # GTK and GUI libraries
    gtk3
    gtk3.dev
    libappindicator-gtk3.dev
    libnotify.dev
    gtk4
    gtk4.dev
    gjs
    gjs.dev
    gtksourceview
    gtksourceview.dev
    xdg-desktop-portal-gtk
    
    # Non-GTK GUI libraries
    tk
    
    # Desktop integration
    libdbusmenu-gtk3
    upower
    yad
    gobject-introspection
    wrapGAppsHook
    
    # QT libraries
    libsForQt5.qwt
    
    # GNOME components
    gnome-keyring
    gnome-control-center
    gnome-bluetooth
    gnome-shell
    nautilus
    blueberry
    networkmanager
    
    # AGS and Hyprland dependencies
    coreutils
    cliphist
    curl
    ddcutil
    fuzzel
    # fuzzel-emoji
    ripgrep
    gojq
    dart-sass
    axel
    wlogout
    wl-clipboard
    hyprpicker
    gammastep
    libnotify
    bc
    xdg-user-dirs
    
    # Text processing and OCR
    tesseract
    
    # Node.js (required for various desktop components)
    nodejs_20
  ];

  programs.vscode.enable = true;
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    angular.ng-template
    dbaeumer.vscode-eslint
    eamodio.gitlens
    bbenoist.nix
    esbenp.prettier-vscode
    yoavbls.pretty-ts-errors
  ];
  programs.vscode.userSettings = {
    "editor.codeActionsOnSave.source.fixAll.eslint" = "explicit";
    "editor.codeActionsOnSave.source.organizeImports" = "explicit";
    "editor.fontFamily" = "'FiraCode Nerd Font Mono'";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 12;
    "editor.formatOnSave" = true;
    "editor.minimap.enabled" = false;
    "editor.minimap.side" = "left";
    "editor.stickyScroll.enabled" = false;

    "extensions.autoUpdate" = false;
    "extensions.ignoreRecommendations" = true;

    "git.autofetch" = true;

    "security.workspace.trust.enabled" = false;
    "security.workspace.trust.startupPrompt" = "never";
    "security.workspace.trust.untrustedFiles" = "newWindow";

    "telemetry.telemetryLevel" = "off";

    "terminal.explorerKind" = "both";
    "terminal.external.linuxExec" = "kitty";
    "terminal.integrated.defaultProfile.linux" = "zsh";
    "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font Mono";
    "terminal.integrated.fontSize" = 12;
    "terminal.integrated.shell.linux" = "/usr/bin/zsh";
    "terminal.sourceControlRepositoriesKind" = "both";

    "window.commandCenter" = false;
    "window.menuBarVisibility" = "toggle";
    "window.titleBarStyle" = "native";

    "workbench.colorTheme" = "Catppuccin Macchiato";
    "workbench.layoutControl.enabled" = false;
    "workbench.sideBar.location" = "right";

    "[typescript].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[html].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[scss].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[json].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[jsonc].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[css].editor.defaultFormatter" = "esbenp.prettier-vscode";
    "[javascript].editor.defaultFormatter" = "esbenp.prettier-vscode";
    
    "diffEditor.renderSideBySide" = true;
  };
}