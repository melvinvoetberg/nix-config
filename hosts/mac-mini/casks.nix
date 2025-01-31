_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "figma"
  "firefox"
  "minecraft"
  "mongodb-compass"
  "postico"
  "tor-browser"
  "yubico-yubikey-manager"
]
