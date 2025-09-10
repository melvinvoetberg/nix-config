_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "clop"
  "cursor"
  "cyberduck"
  "dropshare"
  "mongodb-compass"
  "postico"
  "prismlauncher"
  "redis-insight"
  "tor-browser"
  "yubico-yubikey-manager"
]
