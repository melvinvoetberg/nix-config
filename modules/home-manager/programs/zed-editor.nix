_:

{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      assistant = {
        enabled = true;
        version = "2";
        default_open_ai_model = null;
        default_model = {
          provider = "openai";
          model = "gpt-4o";
        };
      };

      buffer_font_family = "MesloLGS Nerd Font";
      buffer_font_size = 16;
      buffer_font_features = {
        salt = true;
      };

      chat_panel = {
        button = false;
      };

      notification_panel = {
        button = false;
      };

      project_panel = {
        auto_fold_dirs = false;
      };

      journal = {
        hour_format = "hour24";
      };

      tab_size = 2;

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      terminal = {
        font_family = "MesloLGS Nerd Font";
      };

      theme = {
        mode = "system";
        light = "One Light";
        dark = "Zedokai Darker (Filter Spectrum)";
      };

      ui_font_size = 16;
      vim_mode = true;
    };
  };
}
