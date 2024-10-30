{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, arion }:
    let system = "x86_64-linux"; in
    rec {
      pkgs = import nixpkgs { inherit system; };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          arion.packages.${system}.arion
        ];
      };
        
    };
}
