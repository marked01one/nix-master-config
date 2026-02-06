{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.dataview";
  version = "0.5.68";

  src = pkgs.fetchFromGitHub {
    owner = "blacksmithgu";
    repo = "obsidian-dataview";
    rev = version;
    hash = "sha256-BF9ye4ocE6vZh+ChkmuLkQpNWtH425EX0EHQs+wbTZc=";
  };

  offlineCache = pkgs.fetchYarnDeps {
    yarnLock = src + "/yarn.lock";
    hash = "sha256-Tf1K048Ox+hImIfrdBWQHsiDe+3FGUQLFBcf/Bbbo1U=";
  };

  nativeBuildInputs = with pkgs; [
    nodejs
    yarnConfigHook
    yarnBuildHook
    npmHooks.npmInstallHook
  ];

  installPhase = ''
    mkdir -p $out
    cp ./manifest.json $out/manifest.json
    cp ./main.js $out/main.js
    cp ./styles.css $out/styles.css
  '';
}
