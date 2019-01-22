{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "prefetch-url";

  src = ./.;

  buildInputs = [
    pkgs.makeWrapper
  ];

  installPhase = ''
    mkdir -p $out/bin
    install -D -m555 -t $out/bin prefetch-url

    wrapProgram $out/bin/prefetch-url \
      --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.nix
        pkgs.coreutils
      ]}
  '';
}
