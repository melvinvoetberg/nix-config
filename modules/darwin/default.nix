{ home-manager, pkgs, username, ... }:

{
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  system = {
    stateVersion = 5;

    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
      };
      NSGlobalDomain = {
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        _HIHideMenuBar = true;
      };
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    masApps = {
      "Things" = 904280696;
      "Keka" = 470158793;
      "Passepartout" = 1433648537;
    };

    taps = [
      "nikitabobko/tap"
    ];
  };

  home-manager = {
    users.${username} = { pkgs, ... }: {
      home = {
        packages = pkgs.callPackage ./packages.nix {};
      };

      services = {
        gpg-agent = {
          extraConfig = ''
            pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
          '';
        };
      };
    };
  };

  services.sketchybar.enable = true;
}
