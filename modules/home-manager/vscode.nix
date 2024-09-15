{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    nil
    nixpkgs-fmt
    (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "code --wait --new-window";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      davidanson.vscode-markdownlint
      codezombiech.gitignore
      eamodio.gitlens
      donjayamanne.githistory
      mhutchie.git-graph
      github.copilot
      alefragnani.project-manager
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      tomoki1207.pdf
      ms-python.python
      ms-python.black-formatter
      jnoortheen.nix-ide
    ];
  };
}