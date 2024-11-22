{ username, ...}:

{
  home-manager = {
    useGlobalPkgs = true;
    users.${username} = {
      home = {
        stateVersion = "24.11";
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
        ./programs/mise.nix
        ./programs/wezterm.nix
        ./programs/zed-editor.nix
        ./programs/zsh.nix
      ];
    };
  };
}
