_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "claude"
  "clop"
  "cyberduck"
  "docker"
  "dropshare"
  "figma"
  "firefox"
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
