{
  description = "nix-config";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, nix-darwin, nix-homebrew, ... } @inputs:
    let
      username = "melvin";
      linuxHostNames = [ "" ];
      darwinHostNames = [
        { name = "notebook"; system = "x86_64-darwin"; }
        { name = "macbook"; system = "aarch64-darwin"; }
        { name = "mac-mini"; system = "aarch64-darwin"; }
        { name = "mac-work"; system = "x86_64-darwin"; }
      ];
    in
    {
      darwinConfigurations = builtins.listToAttrs (map (hostConfig: {
        name = hostConfig.name;
        value = nix-darwin.lib.darwinSystem {
          system = hostConfig.system;
          specialArgs = { inherit inputs; username = username; };
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                user = "${username}";
              };
            }
            home-manager.darwinModules.home-manager
            ./modules/darwin/default.nix
            (import ./hosts/${hostConfig.name}/default.nix)
            ./modules/home-manager/default.nix
          ];
        };
      }) darwinHostNames);
    };
}
