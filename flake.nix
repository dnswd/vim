{
  description = "halcyonage/dnswd's neovim config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixlib.url = "github:dnswd/nixlib";
  };

  outputs =
    {
      nixpkgs,
      nixlib,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
      forAllDevSystems = lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.lib.extend (
            final: prev: {
              # custom libs under lib.my
              my = nixlib.mkLib {
                inherit inputs pkgs;
                lib = final;
              };
            }
          );
          halcyon-vim-package = (
            import ./default.nix {
              inherit pkgs inputs system;
              inherit (lib) my;
            }
          );
        in
        halcyon-vim-package // { default = halcyon-vim-package; }
      );

      devShells = forAllDevSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.lib.extend (
            final: prev: {
              # custom libs under lib.my
              my = nixlib.mkLib {
                inherit inputs pkgs;
                lib = final;
              };
            }
          );
          halcyon-vim = (
            import ./default.nix {
              inherit pkgs inputs system;
              inherit (lib) my;
            }
          );
        in
        lib.genAttrs [ "default" "ci" ] (
          name:
          import ./shell.nix {
            inherit pkgs halcyon-vim;
          }
        )
      );
    };
}
