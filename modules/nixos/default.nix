{ inputs, ... }:
{
  imports = 
  [
    inputs.home-manager.nixosModules.default
    ./keyd.nix
    ./networking.nix
    ./users.nix
    ../docker/docker.nix
  ];
}