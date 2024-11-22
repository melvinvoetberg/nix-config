_:

let
  casks = import ../../modules/darwin/casks.nix;
in
casks ++ [
  "minecraft"
]
