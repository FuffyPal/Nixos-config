{ config, pkgs, ... }:
{
  virtualisation.oci-containers.containers = {
    "DevelENV" = {
      image = "docker.io/library/ubuntu:latest";
      autoStart = false;
      ports = [ "0.0.0.0:2222:22/tcp" ];
      autoRemoveOnStop = true;
      volumes = [
        "/home/[redected]/Projects:/workspace"
      ];
      extraOptions = [
        "--name env"
      ];
      cmd = [
        "/bin/bash"
      ];
    };
  };
}
