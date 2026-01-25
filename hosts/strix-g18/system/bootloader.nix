{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.strix-g18.bootloader;
  validBootloaders =
    lib.mapAttrsToList (k: v: lib.replaceString ".nix" "" k)
    (builtins.readDir ./../../../system/bootloader);
  expectedPath = ./../../../system/bootloader + "/${cfg.name}.nix";
  pathExists = builtins.pathExists expectedPath;
in {
  options.strix-g18.bootloader.name = lib.mkOption {
    type = lib.types.enum validBootloaders;
    description = "Name of the bootloader file in ./system/bootloader";
  };

  config.assertions = [
    {
      assertion = pathExists;
      message = ''
        Invalid bootloader name: "${cfg.name}".
        The file ${toString expectedPath} does not exist.
      '';
    }
  ];

  config.boot =
    lib.mkIf pathExists
    (import expectedPath {inherit pkgs lib;}).boot;
}
