# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./gnome.nix
      ./vim.nix
      ./networking.nix
#      ./Flaumig.nix
      ./nvidia.nix
#      ./image.nix

    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "tr";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "trq";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.[redected] = {
    isNormalUser = true;
    description = "FluffyPal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Allow flatpak service
  services.flatpak.enable = true;

  # vim 
  programs.vim.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    flatpak
    podman
    zapret
    protonvpn-gui
  ];

  # fstrim settings
  services.fstrim = {
    enable = true;
    interval = "d";
  };

  # Podman settings
  virtualisation.podman  = {
    dockerSocket.enable = false;
  #  enableNvidia = true;
    enable = true;
    autoPrune.enable = false;
  };

  # Systemd service settings
  systemd.services = {
    NetworkManager-wait-online = {
      enable = false;
    };
  };
  
  # Kernel Settings
  boot.kernelPackages = pkgs.linuxPackages;

  # System auto upgrade settings
  system.autoUpgrade = {
    enable = true;
    dates = "Mon,Tue,Wed,Thu,Fri,Sat,Sun 03:00:00"; # Her gün sabah 3'te güncelleme
    allowReboot = true; # Güncelleme sonrası otomatik yeniden başlatma
    channel = "https://nixos.org/channels/nixos-25.05";
    randomizedDelaySec = "30m"; # Gecikmeyi 30 dakikaya düşürme
  };
  # bash shell settings
  programs.bash = {
    # Alias
    shellAliases = {
      panic="sudo systemctl stop NetworkManager.service";
      develenv="podman run -it --rm --name env -p 2222:22 -v $HOME/Projects:/workspace localhost/fluffy:env";
      up="sudo nix-channel --update && sudo nixos-rebuild switch --upgrade-all && flatpak update -y";
    };
  }; 

  system.stateVersion = "25.05"; # Did you read the comment?

}
