{ pkgs }:

with pkgs;
let
  packages = import ../shared/packages.nix { inherit pkgs; };
in
packages ++ [
  aerospace
  bartender
  iina
  pinentry_mac
  raycast
]
