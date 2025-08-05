{ config, pkgs, lib, ... }:
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
    # Make sure to use the correct Bus ID values for your system!
    # intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:5:0:0"; # For AMD IGPU
  };
  };
}
