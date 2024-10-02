{ pkgs, ... }:
{
  networking.hostName = "urvi"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "vineeth" "root" ];
      UseDns = true;
      X11Forwarding = true;
      PermitRootLogin = "yes";
      PubkeyAuthentication = true;
    };
  };

  services.fail2ban.enable = true;

  environment.systemPackages = with pkgs; [
    openssl
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 443 ];
  networking.firewall.allowedUDPPorts = [ 22 443 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}