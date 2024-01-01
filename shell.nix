{ pkgs ? import <nixpkgs> { } }:
with pkgs;

let
  tools =pkgs.anne2protools;
in
mkShell {
  buildInputs = [
    nixpkgs-fmt
    tools
  ];

  shellHook = ''
  '';
}
