{ pkgs }:

with pkgs;
let
  packages = import ../../modules/darwin/packages.nix { inherit pkgs; };
in
packages ++ [
  android-tools
  coreutils
  exiftool
  hcloud
  kind
  mitmproxy
  packer
  postgresql_17_jit
  postman
  slack
  spotify
  terraform
]
