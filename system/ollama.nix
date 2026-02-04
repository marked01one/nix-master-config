{...}: {
  services.ollama = {
    enable = true;
    loadModels = [
      "gpt-oss:20b"
      "gemma3:4b"
      "gemma3:12b"
    ];
    # Remove any models not declared in `loadModels`
    syncModels = true;
  };
}
