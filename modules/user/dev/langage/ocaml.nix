{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.ocaml
    pkgs.dune_3
    pkgs.ocamlPackages.ocaml-lsp
    pkgs.ocamlPackages.ocamlformat
    pkgs.ocamlPackages.menhir
    pkgs.ocamlPackages.utop
  ];
}
