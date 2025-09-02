{ config, pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./git.nix
  ];
  
  home.username = "redected";
  home.homeDirectory = "/home/[redected]";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
