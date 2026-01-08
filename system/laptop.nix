# System config for laptops, or devices running on battery in general. Contains
# power manangement features reactivity to lid switches.
# Docs: https://wiki.nixos.org/wiki/Laptop
{...}: {
  services.power-profiles-daemon.enable = false;
  services.logind.settings.Login = {
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
