{ home-manager, username, ...}:

{
  home-manager = {
    useGlobalPkgs = true;
    users.${username} = { pkgs, ... }: {
      home = {
        stateVersion = "24.05";
      };

      services = {
        gpg-agent = {
          enable = true;
          enableSshSupport = true;
          defaultCacheTtl = 600;
          maxCacheTtl = 7200;
        };
      };

      programs.home-manager.enable = true;
      imports = [
        ./programs/git.nix
        ./programs/zsh.nix
      ];
    };
  };
}
