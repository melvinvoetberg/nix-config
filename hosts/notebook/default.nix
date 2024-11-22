{ pkgs, lib, home-manager, username, ... }:

let
  darwinModules = import ../../modules/darwin/default.nix { inherit home-manager pkgs username; };
in
{
  homebrew = lib.recursiveUpdate darwinModules.homebrew {
    casks = pkgs.callPackage ./casks.nix {};
  };

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/Applications/Orion.app"
          "/Applications/Obsidian.app"
          "${pkgs.wezterm}/Applications/Wezterm.app"
        ];
      };
    };
  };

  home-manager = {
    users.${username} = { pkgs, ... }: {
      imports = [
        ./programs/aerospace.nix
      ];
    };
  };
}
