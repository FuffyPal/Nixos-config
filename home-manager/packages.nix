{ config , pkgs , ... }:

{
  home.packages = with pkgs; [
    vesktop
    jan
    logseq
    nextcloud-client
  ];
}
