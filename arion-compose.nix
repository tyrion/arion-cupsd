{ pkgs, ... }:
{
  project.name = "cupsd";

  services.cupsd = {
    nixos.useSystemd = true;
    nixos.configuration = { lib, ...}: {
      services.printing = {
        enable = true;
        webInterface = true;
        # listenAddresses = [ ":631" ];
        startWhenNeeded = false;
        defaultShared = true;
        cups-pdf.enable = true;
        browsing = true;
        browsed.enable = true;
        extraConf = ''
          PreserveJobFiles Yes
        '';
      };
      services.avahi.enable = true;
      # services.avahi.nssmdns4

      boot.tmp.useTmpfs = true;
      networking.useDHCP = false;
      systemd.oomd.enable = false;
      services.nscd.enable = false;
      system.nssModules = lib.mkForce [];
      system.stateVersion = "24.05";
    };

    service = {
      container_name = "cupsd";
      network_mode = "host";
      #volumes = [
      #  "./var/spool:/var/spool/cups"
      #];
    };
  };
}
