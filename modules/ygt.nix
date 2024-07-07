{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    docker-compose
    elmPackages.elm
    gnumake
    go-task
    google-cloud-sdk
    nodejs_22
    sops
    typescript
    yarn
  ];
}
