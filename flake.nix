{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      with pkgs;
      {
        devShells.default = mkShell {
          # https://search.nixos.org
          packages = [
            nodejs_20
            yarn

            # TODO https://github.com/NixOS/nixpkgs/pull/261906
            # (python3.withPackages (p: with p; [
            #   mkdocs-techdocs-core
            # ]))
          ];
        };
      }
    );
}
