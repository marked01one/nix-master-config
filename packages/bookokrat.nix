{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "bookokrat";
  version = "0.2.2";

  src = pkgs.fetchurl {
    url = "https://github.com/bugzmanov/bookokrat/releases/download/v${version}/bookokrat-v${version}-x86_64-unknown-linux-musl.tar.gz";
    sha256 = "sha256-ZKvUpYrtCWzHM0naCRnaCSlliUXAMArIZGcJ4m+gqzk=";
  };

  # Since the source is only a tarball (no directories), we need to set out
  # source root as the current directory.
  sourceRoot = ".";

  # The source is a tarball, so Nix will unpack it automatically.
  # We just need to tell it how to install the resulting binary.
  installPhase = ''
    mkdir -p $out/bin
    mv bookokrat $out/bin
  '';

  meta = with pkgs.lib; {
    description = "Terminal EPUB Book Reader.";
    homepage = "https://github.com/bugzmanov/bookokrat";
    license = licenses.mit;
    platforms = ["x86_64-linux"];
  };
}
