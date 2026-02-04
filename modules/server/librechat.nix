{ config, ... }: {
  sops.secrets.mistral_api_key.owner = "librechat";
  services.librechat = {
    enable = true;
    credentials.MISTRAL_API_KEY = config.sops.secrets.mistral_api_key.path;
    env = {
      ALLOW_REGISTRATION = true;
      CONSOLE_JSON_STRING_LENGTH = 255;
      HOST = "0.0.0.0";
      PORT = 8069;
    };
    settings = {
      version = "1.2.9";
      endpoints.custom = [{
        apiKey = "\${MISTRAL_API_KEY}";
        baseURL = "https://api.mistral.ai/v1";
        models = {
          default = [
            "mistral-tiny"
            "mistral-small"
            "mistral-medium"
            "mistral-large-latest"
          ];
          fetch = true;
        };
        name = "Mistral";
        modelDisplayLabel = "Mistral";
        titleConvo = true;
        titleModule = "mistral-large-latest";
        dropParams = [ "stop" "user" "frequency_penalty" "presence_penalty" ];
      }];
      interface = {
        privacyPolicy = {
          externalUrl = "https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=RDdQw4w9WgXcQ";
          openNewTab = true;
        };
      };
    };
  };
}
