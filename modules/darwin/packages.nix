{ pkgs }:

with pkgs;
let
  packages = import ../shared/packages.nix { inherit pkgs; };
in
packages ++ [
  aerospace
  pinentry_mac
  raycast
  sketchybar
]
