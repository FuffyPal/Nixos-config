{ config, pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./git.nix
    ./podman.nix
    ./packages.nix
  ];
  
  home.username = "secret";
  home.homeDirectory = "/home/secret";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
