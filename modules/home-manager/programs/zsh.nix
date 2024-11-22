_:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      gpgconf --launch gpg-agent
    '';
    oh-my-zsh = {
      enable = true;
    };
    sessionVariables = {
      SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-socket)";
    };
  };
}
