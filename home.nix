{ pkgs, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
in {
  home.username = "ermann";
  home.homeDirectory = if isDarwin then "/Users/ermann" else "/home/ermann";
  home.stateVersion = "24.05";

  home.packages = [ pkgs.multimarkdown ];

  programs.home-manager.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };
}
