_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "docker"
  "figma"
  "minecraft"
  "mongodb-compass"
  "postico"
  "yubico-yubikey-manager"
]
