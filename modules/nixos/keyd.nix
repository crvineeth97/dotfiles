{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    keyd
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        # Referenced https://github.com/davidkellis/mackeys/blob/master/default.conf
        ids = [ "*" ];
        settings = {
          main = {
            leftalt = "layer(ascontrol)";
            leftcontrol = "layer(asalt)";
          };
        };
        extraConfig = ''
          # Extraconfig comment to verify nixos build
          ##############################################################################################################
          # The main part! Using this layer, we can remap our new "Cmd" key to
          # do almost everything our muscle memory might need...
          [ascontrol:C]

          # As soon as tab is pressed (but not yet released), we switch to the
          # "app_switch_state" overlay where we can handle Meta-Backtick differently.
          # Also, send a 'M-tab' key tap before entering app_switch_sate.
          tab = swapm(app_switch_state, M-tab)

          # Meta-Backtick: Switch to next window in the application group
          # - M-` is the default binding for 'switch-group' in gnome
          # - keybinding: `gsettings get org.gnome.desktop.wm.keybindings switch-group`
          ` = swapm(app_window_cycle_state, M-`)

          # switch between open tabs
          1 = A-1
          2 = A-2
          3 = A-3
          4 = A-4
          5 = A-5
          6 = A-6
          7 = A-7
          8 = A-8
          9 = A-9

          # Meta-Space: Open the Launcher (a feature of gnome-shell)
          # keybinding: "Naviage applications and windows -> Launch and switch applications"
          # space = M-/

          # move cursor to top and bottom of editor
          up = C-home
          down = C-end

          # ctr+v = ctrl+shift+v
          v=C-S-v

          ##############################################################################################################
          [app_switch_state:M]
          tab = M-tab
          ` = M-S-tab 

          ##############################################################################################################
          [app_window_cycle_state:M]
          ` = M-`

          ##############################################################################################################
          [asalt:A]

          # Move cursor to beginning or end of line
          left = home
          right = end
        '';
      };
    };
  };
}
