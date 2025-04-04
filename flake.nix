{
  description = "Elixir development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.stdenv.mkDerivation {
          name = "elixir-shell";
          buildInputs = [];
          nativeBuildInputs = with pkgs; [
            elixir
          ];

          shellHook = ''
            elixir -v
          '';
        };
      }
    );
}
