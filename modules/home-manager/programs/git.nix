_:

{
  programs.git = {
    enable = true;
    ignores = [
      ".DS_Store"
    ];

    userName = "Melvin Voetberg";
    userEmail = "git@melvinvoetberg.com";

    extraConfig.init.defaultBranch = "main";
  };
}
