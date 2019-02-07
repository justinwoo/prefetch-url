{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "prefetch-url";

  src = ./.;

  buildInputs = [
    pkgs.makeWrapper
    pkgs.ghc
  ];

  installPhase = ''
    mkdir -p $out/bin
    ghc -o prefetch-url prefetch-url.hs
    install -D -m555 -t $out/bin prefetch-url

    wrapProgram $out/bin/prefetch-url \
      --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.nix
      ]}
  '';
}
