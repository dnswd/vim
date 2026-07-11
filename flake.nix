{
  description = "halcyonage/dnswd's neovim config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
      forAllDevSystems = lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

    in
    {
      packages = forAllDevSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
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
        {
          default = halcyon-vim-package;
          halcyon-vim = halcyon-vim-package;
        }
      );

      devShells = forAllDevSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
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
