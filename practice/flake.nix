{
  description = "Custom nvi script for plain neovim with essential config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        nvi = pkgs.writeShellScriptBin "nvi" ''
          exec ${pkgs.neovim}/bin/nvim -u ./essential.vim "$@"
        '';
      in
      {
        packages = {
          default = nvi;
          nvi = nvi;
        };

        apps = {
          default = {
            type = "app";
            program = "${pkgs.lib.getExe nvi}";
          };
        };

        devShells = {
          default = pkgs.mkShell { buildInputs = [ nvi ]; };
        };
      }
    );
}
