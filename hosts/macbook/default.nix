{ pkgs, lib, username, ... }:

let
  darwinModules = import ../../modules/darwin/default.nix { inherit pkgs username; };
in
{
  homebrew = lib.recursiveUpdate darwinModules.homebrew {
    casks = pkgs.callPackage ./casks.nix {};
  };

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/System/Cryptexes/App/System/Applications/Safari.app"
          "/Applications/Proton Mail.app"
          "/Applications/Obsidian.app"
          "${pkgs.wezterm}/Applications/Wezterm.app"
          "${pkgs.vscode}/Applications/Visual Studio Code.app"
        ];
      };
    };
  };

  home-manager = {
    users.${username} = { pkgs, ... }: {
      home = {
        packages = pkgs.callPackage ./packages.nix {};
      };

      imports = [
        ./programs/aerospace/default.nix
      ];
    };
  };
}
