{ config, pkgs, ... }:
{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };
  services.xserver.videoDrivers = [
    "amdgpu" # for AMD iGPU 
    "nvidia"
  ];
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:5:0:0"; # For AMD IGPU
    };
  };
  hardware.nvidia-container-toolkit.enable = true;
}
