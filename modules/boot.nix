{ pkgs, ... }:
{
    boot.plymouth.enable = true;
    boot.plymouth.theme = "colorful_sliced";
    boot.plymouth.themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
            selected_themes = [ "colorful_sliced" ];
        })
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable "Silent boot"
    boot.consoleLogLevel = 3;
    boot.initrd.verbose = false;
    boot.kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    boot.loader.timeout = 0;
}