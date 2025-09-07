_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "claude"
  "clop"
  "cursor"
  "cyberduck"
  "dropshare"
  "figma"
  "firefox"
  "lm-studio"
  "mongodb-compass"
  "obs"
  "postgres-unofficial"
  "postico"
  "prismlauncher"
  "redis-insight"
  "tor-browser"
  "yubico-yubikey-manager"
]
