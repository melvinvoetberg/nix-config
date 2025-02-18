_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "betterdiscord-installer"
  "clop"
  "cursor"
  "cyberduck"
  "docker"
  "figma"
  "firefox"
  "minecraft"
  "mongodb-compass"
  "notion"
  "obs"
  "postico"
  "proton-drive"
  "redis-insight"
  "tor-browser"
  "yubico-yubikey-manager"
]
