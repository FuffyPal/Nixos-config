{ config, pkgs, ... }:
{
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
    autoLogin.delay = 2;
  };
  services.displayManager.autoLogin = {
    user = "[redected]";
    enable = true;
  };
  services.displayManager.defaultSession = "gnome";
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.xserver.desktopManager.gnome.flashback.enableMetacity = false;
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    papirus-icon-theme
    ptyxis  
    adw-gtk3
    nautilus
    gnome-software
    gnome-system-monitor 
    gnome-weather


    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.appindicator
    gnomeExtensions.color-picker
    gnomeExtensions.battery-health-charging
    gnomeExtensions.day-progress
    gnomeExtensions.gsconnect
    gnomeExtensions.media-controls
    gnomeExtensions.open-desktop-file-location
    gnomeExtensions.quick-settings-tweaker
    gnomeExtensions.weather-oclock
    gnomeExtensions.compiz-windows-effect
    gnomeExtensions.tiling-shell
    gnomeExtensions.search-light


  ];
}
