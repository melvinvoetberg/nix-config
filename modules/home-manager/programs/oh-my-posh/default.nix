_:

{
  programs.oh-my-posh = {
    enable = true;
    useTheme = "gruvbox";
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (
      builtins.unsafeDiscardStringContext (builtins.readFile ./config.json)
    );
  };
}
