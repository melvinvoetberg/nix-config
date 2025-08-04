_:

{
  programs.zsh = {
    enable = true;
    initContent = ''
      gpgconf --launch gpg-agent

      source ~/.zsh_env
      setopt interactive_comments
      preexec(){ _lc=$1; }
    '';
    oh-my-zsh = {
      enable = true;
    };
    sessionVariables = {
      SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-socket)";
    };
    shellAliases = {
      k = "kubectl";
      gac = "git add . && git commit -m \"\${_lc#gac }\" #";
      gcb = "git checkout -b";
      gc = "git checkout";
      gp = "git push";
      gl = "git pull";
      zed = "zeditor";
    };
  };
}
