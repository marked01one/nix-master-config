{ config, pkgs, ... }:

{
  services.logind.settings.login = {
    HandleLidSwitch = "poweroff";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  # Enable auto-cpufreq.
  services.auto-cpufreq = {
    enable = true;

    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
