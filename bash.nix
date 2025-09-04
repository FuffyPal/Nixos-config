{ config , ... }:

{
  programs.bash = {
    completion.enable = true;
    shellAliases = {
      comfyui = "podman run  -v $HOME/Models/Checkpoint/Illustrious/:/workspace/ComfyUI/models/checkpoints/Illustrious -v $HOME/Models/Checkpoint/NoobAI/:/workspace/ComfyUI/models/checkpoints/NoobAI --name comfyui -p 8188:8188 -it --device nvidia.com/gpu=all --rm --security-opt=label=disable comfyui:latest";
    };
  };
}
