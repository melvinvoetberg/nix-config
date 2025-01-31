_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "cursor"
  "cyberduck"
  "figma"
  "firefox"
  "minecraft"
  "mongodb-compass"
  "obs"
  "postico"
  "tor-browser"
  "yubico-yubikey-manager"
]
