{...}: {
  services.ollama = {
    enable = true;
    loadModels = [
      "gpt-oss:20b"
      "gemma3:4b"
      "gemma3:12b"
      "glm-4.7-flash:q4_K_M"
    ];
    # Remove any models not declared in `loadModels`
    syncModels = true;
  };
}
