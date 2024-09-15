{ inputs, ... }:
{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vineeth = {
    isNormalUser = true;
    description = "Vineeth Chelur";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "vineeth" = import ../home-manager/vineeth.nix;
    };
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "vineeth";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

}