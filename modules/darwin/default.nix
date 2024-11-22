{ pkgs, username, ... }:

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
      alf = {
        globalstate = 1;
        stealthenabled = 1;
      };
      CustomUserPreferences = {
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.commerce" = {
          AutoUpdate = true;
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.finder" = {
          ShowRecentTags = false;
        };
        "com.apple.ImageCapture" = {
          disableHotPlug = true;
        };
        "com.apple.screensaver" = {
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          ScheduleFrequency = 1;
          AutomaticDownload = 1;
          CriticalUpdateInstall = 1;
        };
        "com.apple.TimeMachine" = {
          DoNotOfferNewDisksForBackup = true;
        };
      };
      dock = {
        autohide = true;
        show-recents = false;
      };
      finder = {
        NewWindowTarget = "Computer";
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
      "Bitwarden" = 1352778147;
      "DaisyDisk" = 411643860;
      "Things" = 904280696;
      "Keka" = 470158793;
      "Passepartout" = 1433648537;
      "SponsorBlock for Safari" = 1573461917;
      "WiFi Explorer: Scanner" = 494803304;
      "Wipr 2" = 1662217862;
      "Xcode" = 497799835;
      "Yubico Authenticator" = 1497506650;
    };

    taps = [
      "nikitabobko/tap"
    ];
  };

  home-manager = {
    users.${username} = { pkgs, ... }: {
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
