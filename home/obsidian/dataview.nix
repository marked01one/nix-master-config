{pkgs ? import <nixpkgs> {}}: let
  version = "0.5.68";
  owner = "blacksmithgu";
  repo = "obsidian-dataview";

  # Helper to fetch assets from the GitHub release
  fetchAsset = name: hash:
    pkgs.fetchurl {
      url = "https://github.com/${owner}/${repo}/releases/download/${version}/${name}";
      sha256 = hash;
    };
in
  pkgs.stdenv.mkDerivation {
    pname = "obsidian-dataview";
    inherit version;

    # Define the three files as separate inputs
    mainJs =
      fetchAsset "main.js" "sha256-eU6ert5zkgu41UsO2k9d4hgtaYzGOHdFAPJPFLzU2gs=";
    manifestJson =
      fetchAsset "manifest.json" "sha256-kjXbRxEtqBuFWRx57LmuJXTl5yIHBW6XZHL5BhYoYYU=";
    stylesCss =
      fetchAsset "styles.css" "sha256-MwbdkDLgD5ibpyM6N/0lW8TT9DQM7mYXYulS8/aqHek=";

    # We don't need to unpack anything since we fetched raw files
    phases = ["installPhase"];

    installPhase = ''
      mkdir -p $out
      cp $mainJs $out/main.js
      cp $manifestJson $out/manifest.json
      cp $stylesCss $out/styles.css
    '';
  }
