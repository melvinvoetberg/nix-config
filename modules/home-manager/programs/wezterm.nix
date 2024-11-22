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

      return config
    '';
  };
}
