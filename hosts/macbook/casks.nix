_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "betterdiscord-installer"
  "cursor"
  "cyberduck"
  "docker"
  "figma"
  "firefox"
  "minecraft"
  "mongodb-compass"
  "obs"
  "postico"
  "tor-browser"
  "yubico-yubikey-manager"
]
