{ config, pkgs, ... }: {
  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    environmentFile = config.sops.secrets.vaultwarden_env.path;
    config = {
      DOMAIN = "https://pass.cylenia.dev";
      SENDS_ALLOWED = true;
      INCOMPLETE_2FA_TIME_LIMIT = 3;
      DISABLE_ICON_DOWNLOAD = false;
      SIGNUPS_ALLOWED = false;
      SIGNUPS_VERIFY = false;
      SIGNUPS_VERIFY_RESEND_TIME = 3600;
      SIGNUPS_VERIFY_RESEND_LIMIT = 6;
      INVITATIONS_ALLOWED = true;
      EMERGENCY_ACCESS_ALLOWED = true;
      EMAIL_CHANGE_ALLOWED = true;
      PASSWORD_ITERATIONS = 600000;
      PASSWORD_HINTS_ALLOWED = true;
      SHOW_PASSWORD_HINT = false;
      INVITATION_ORG_NAME = "Vaultwarden";
      IP_HEADER = "X-Real-IP";
      ICON_REDIRECT_CODE = 302;
      ICON_CACHE_TTL = 2592000;
      ICON_CACHE_NEGTTL = 259200;
      ICON_DOWNLOAD_TIMEOUT = 10;
      HTTP_REQUEST_BLOCK_NON_GLOBAL_IPS = true;
      DISABLE_2FA_REMEMBER = false;
      AUTHENTICATOR_DISABLE_TIME_DRIFT = false;
      REQUIRE_DEVICE_EMAIL = false;
      RELOAD_TEMPLATES = false;
      LOG_TIMESTAMP_FORMAT = "%Y-%m-%d %H:%M:%S.%3f";
      ADMIN_SESSION_LIFETIME = 20;
      INCREASE_NOTE_SIZE_LIMIT = false;

      _ENABLE_YUBICO = true;
      _ENABLE_DUO = true;
      _ENABLE_SMTP = true;

      USE_SENDMAIL = false;
      SMTP_SECURITY = "starttls";
      SMTP_PORT = 587;
      SMTP_FROM_NAME = "Vaultwarden";
      SMTP_TIMEOUT = 15;
      SMTP_EMBED_IMAGES = true;
      SMTP_ACCEPT_INVALID_CERTS = false;
      SMTP_ACCEPT_INVALID_HOSTNAMES = false;

      _ENABLE_EMAIL_2FA = false;
      EMAIL_TOKEN_SIZE = 6;
      EMAIL_EXPIRATION_TIME = 600;
      EMAIL_ATTEMPTS_LIMIT = 3;
      EMAIL_2FA_ENFORCE_ON_VERIFIED_INVITE = false;
      EMAIL_2FA_AUTO_FALLBACK = false;
    }
  };
}
