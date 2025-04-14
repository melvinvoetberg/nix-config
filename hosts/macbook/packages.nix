{ pkgs }:

with pkgs;
let
  packages = import ../../modules/darwin/packages.nix { inherit pkgs; };
in
packages ++ [
  android-tools
  discord
  exiftool
  postgresql_17_jit
  postman
  slack
  spotify
]
