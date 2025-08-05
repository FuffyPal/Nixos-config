{ config, pkgs, lib, ... }:
{
    networking.hostName = "any"; # Define your hostname.
#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # NetworkManager settings
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.macAddress = "random";
    wifi.powersave = true;
    wifi.backend = "wpa_supplicant";
    ethernet.macAddress = "random";
  };

  # DNS
  networking.nameservers = [ 
    "1.1.1.1#one.one.one.one" 
    "1.0.0.1#one.one.one.one" 
  ];
  services.resolved = {
    enable = true;
    dnssec = "true";
    llmnr = "false";
    domains = [ 
      "~." 
    ];
    fallbackDns = [ 
#      "9.9.9.9"
      "1.1.1.1#one.one.one.one" 
      "1.0.0.1#one.one.one.one" 
    ];
    dnsovertls = "true";
  };
    # Firewall settings
  networking.firewall = {
    enable = true;
    logRefusedConnections = true;
    logRefusedUnicastsOnly = true;
    logReversePathDrops = true;
    logRefusedPackets = true;
    allowedUDPPorts = [ 
    53317
    ];
    allowedUDPPortRanges = [
    {
     from = 1714;
     to = 1764;
    }
    ];
    allowedTCPPorts = [ 
    53317
    ];
    allowedTCPPortRanges = [
    {
     from = 1714;
     to = 1764;
    }
    ];
    allowPing = false;
  };
    # Zapret settings
  services.zapret = {
    enable = true;
    httpSupport = true;
    configureFirewall = true;
    params = [
      "--hostspell=hoSt"
      "--dpi-desync=fake --dpi-desync-ttl=4 --dpi-desync-fake-tls-mod=rnd,dupsid,rndsni,padencap"
      "--dpi-desync=fake --dpi-desync-ttl=3"
    ];
  };
}
