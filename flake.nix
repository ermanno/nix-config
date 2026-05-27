{
  description = "My Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      homeFor = system: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home.nix ];
      };
    in {
      homeConfigurations."ermann@aarch64-darwin" = homeFor "aarch64-darwin";
      homeConfigurations."ermann@aarch64-linux" = homeFor "aarch64-linux";
      homeConfigurations."ermann@x86_64-linux" = homeFor "x86_64-linux";
    };
}
