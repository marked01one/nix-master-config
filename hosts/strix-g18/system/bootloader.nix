{
  config,
  lib,
  ...
}: let
  cfg = config.strix-g18.bootloader;
  expectedPath = ./../../../system/bootloaders + "/${cfg.name}.nix";
  pathExists = builtins.pathExists expectedPath;
in {
  options.strix-g18.bootloader.name = lib.mkOption {
    type = lib.types.str;
    description = "Name of the bootloader file in ./system/bootloaders";
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

  config.boot = lib.mkIf pathExists (import expectedPath);
}
