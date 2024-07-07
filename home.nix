{ config, pkgs, ... }:

{
  home.username = "pl";
  home.homeDirectory = "/home/pl";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    bat
    eza
    fzf
    jq
    ripgrep
    tree
    which
    gnumake

    # ygt
    go-task
    google-cloud-sdk
    docker-compose
    sops
    nodejs_22
    yarn

    # elm
    elmPackages.elm
  ];

  programs.git = {
    enable = true;
    userName = "Pawel Lisewski";
    userEmail = "dev@palekiwi.com";
    ignores = [
	"*.swp"
	"build"
	"tags"
    ];
    extraConfig = {
	init.defaultBranch = "master";
	pull.rebase = false;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';

    shellAliases = {
      gu = "gitui";
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = "source ${./aliases.zsh}";

    shellAliases = {
      ll = "ls -l";
      gu = "gitui";
      update = "sudo nixos-rebuild switch";
      cat = "bat";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "avit";
    };
  };
}
