{ pkgs }:

with pkgs;
let
  packages = import ../../modules/darwin/packages.nix { inherit pkgs; };
in
packages ++ [
  android-tools
  coreutils
  exiftool
  postgresql_17_jit
  postman
  slack
  spotify
]
