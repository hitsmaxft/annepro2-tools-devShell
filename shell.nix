{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    nixpkgs-fmt
    anne2pro-tools
  ];

  shellHook = ''
  '';
}
