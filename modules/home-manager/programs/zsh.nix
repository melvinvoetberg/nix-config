_:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      gpgconf --launch gpg-agent

      source ~/.zsh_env
    '';
    oh-my-zsh = {
      enable = true;
    };
    sessionVariables = {
      SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-socket)";
    };
    shellAliases = {
      k = "kubectl";
      gac = "git add . && git commit -m";
      gcb = "git checkout -b";
      gc = "git checkout";
      gp = "git push";
      gl = "git pull";
    };
  };
}
