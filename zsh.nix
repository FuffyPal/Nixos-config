{ config , pkgs , ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    enableLsColors = true;
    histFile = "$HOME/.zsh_history";
    histSize = 2000;
    shellAliases = {
      comfyui = "podman run  -v $HOME/Models/Checkpoint/Illustrious/:/workspace/ComfyUI/models/checkpoints/Illustrious -v $HOME/Models/Checkpoint/NoobAI/:/workspace/ComfyUI/models/checkpoints/NoobAI --name comfyui -p 8188:8188 -it --device nvidia.com/gpu=all --rm --security-opt=label=disable comfyui:latest";
    };
    ohMyZsh = {
      enable = true;
      theme = "alanpeabody";
    };
  };
}
