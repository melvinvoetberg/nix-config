{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      local config = wezterm.config_builder()

      ${
        if pkgs.stdenv.isDarwin
        then ''
          config.front_end = "WebGpu"
          config.webgpu_power_preference = "HighPerformance"
        ''
        else ""
      }

      config.font = wezterm.font("MesloLGS Nerd Font")
      config.font_size = 16
      config.color_scheme = 'Monokai (terminal.sexy)'

      config.enable_tab_bar = false
      config.window_decorations = "RESIZE"

      local padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0.5cell',
      }

      wezterm.on('user-var-changed', function(window, pane, name, value)
        if name == "NVIM_ENTER" then
          local overrides = window:get_config_overrides() or {}
          if value == "1" then
            overrides.window_padding = {
              left = 0,
              right = 0,
              top = 0,
              bottom = 0
            }
          else
            overrides.window_padding = padding
          end
          window:set_config_overrides(overrides)
        end
      end)

      return config
    '';
  };
}
