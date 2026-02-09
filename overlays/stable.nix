inputs: final: prev: {
  stable = import inputs.nixpkgs-stable {
    system = final.system;
    config.allowUnfree = true;
  };
}
