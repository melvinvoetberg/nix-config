_:

{
  programs.git = {
    enable = true;
    ignores = [
      ".DS_Store"
    ];

    userName = "Melvin Voetberg";
    userEmail = "melvin@voetberg.net";

    extraConfig.init.defaultBranch = "main";
  };
}
