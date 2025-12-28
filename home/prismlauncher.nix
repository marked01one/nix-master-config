{pkgs, ...}: {
  home.packages = with pkgs; [
    (prismlauncher.override {
      # Add binary required by some mods.
      additionalPrograms = [ffmpeg];

      # Change Java runtimes available to Prism Launcher.
      jdks = [
        graalvmPackages.graalvm-ce
        zulu
        zulu17
        zulu8
      ];
    })
  ];
}
