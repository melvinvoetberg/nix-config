_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "claude"
  "clop"
  "cursor"
  "cyberduck"
  "docker-desktop"
  "dropshare"
  "figma"
  "firefox"
  "gqrx"
  "lm-studio"
  "mongodb-compass"
  "notion"
  "obs"
  "postico"
  "prismlauncher"
  "redis-insight"
  "tor-browser"
  "yubico-yubikey-manager"
]
