{ pkgs, ... }:

{
  home.username = "ermann";
  home.homeDirectory = "/home/ermann";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };
}
