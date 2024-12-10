{ pkgs }:

with pkgs;
let
  packages = import ../../modules/darwin/packages.nix { inherit pkgs; };
in
packages ++ [
  discord
  slack
  spotify
]
