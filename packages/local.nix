{ config, inputs, pkgs, lib, ...}:
let
  overlays = import ../overlays {inherit inputs;};
in
{

  imports = [
    ./configs/emacs
    ./configs/vscode
    ./configs/neovim
    ./configs/tmux
    ./configs/opentabletdriver
    ./configs/xournalpp
    ./configs/firefox
    ./configs/mpv
    ./configs/flatpak/local.nix
    ./drv/cp
  ];

  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";
    }
    {
      name = "drawy-nightly";
      location = "https://origin.cdn.kde.org/flatpak/drawy-nightly/drawy-nightly.flatpakrepo";
    }
  ];

  services.flatpak.uninstallUnmanaged = false;
  services.flatpak.packages = [
    "app.zen_browser.zen"
    "com.github.flxzt.rnote"
    "org.gtk.Gtk3theme.Adwaita-dark"
    "org.kde.neochat"
    "org.kde.iconexplorer"
    "net.shadps4.shadPS4"
    "org.kde.drawy"
  ];

  services.flatpak.overrides = {
    global = {
      Context.sockets = ["wayland" "!x11" "!fallback-x11"];
      Context.filesystems = [
        "xdg-config/themes:ro"
        "xdg-config/icons:ro"
        "xdg-config/gtk-2.0:ro"
        "xdg-config/gtk-3.0:ro"
        "xdg-config/gtk-4.0:ro"
        "xdg-config/gtkrc:ro"
        "xdg-config/gtkrc-2.0:ro"
        "xdg-config/fontconfig/conf.d"
        "home/me:ro"
      ];
      Environment = {
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
        # GTK_THEME = "Adwaita:dark";
      };
    };
  };

  home.packages = with pkgs; [
    brave
    cava
    tree
    btop
    neofetch
    logseq
    inkscape
    ookla-speedtest
    gnome-disk-utility
    obs-studio
    baobab
    simple-scan
    gimp
    corefonts
    libreoffice-fresh
    cachix
    qbittorrent
    jamesdsp
    megasync
    vesktop
    ani-cli
    lorien
    open-dyslexic
    tauon
    discord
    rpcs3
    devenv
    thunderbird
    telegram-desktop
    unrar

    # for dev
    # yes i don't want to enter a nix shell again and again when I'm just brainstorming
    clang-tools
    clang
    (lib.hiPrio gcc)
    gdb
    jdk
    aseprite
    zed-editor
    wineWow64Packages.stable

    python3 # temp
    
    (pkgs.callPackage ./drv/lyrics-in-terminal.nix {})
    (pkgs.callPackage ./drv/fonts {})

    # (pkgs.libsForQt5.callPackage ./drv/xp-pen {})
    # ydotool

    # (retroarch.override {
    #   cores = with libretro; [
    #       dolphin
    #   ];
    # })


    # cracked minecraft :)
    # (pkgs.prismlauncher.override {
    #   prismlauncher-unwrapped = pkgs.prismlauncher-unwrapped.overrideAttrs (oldAttrs: {
    #     src = pkgs.fetchFromGitHub {
    #       owner = "Diegiwg";
    #       repo = "PrismLauncher-Cracked";
    #       rev = "9.4";
    #       hash = "sha256-Ld6t+zKGfDcXjfELdbcBAh9RQlAp7LIumUjQ2s7fjKg=";
    #     };
    #     buildInputs = oldAttrs.buildInputs ++ [
    #       pkgs.kdePackages.qtnetworkauth
    #     ];
    #   });
    # })
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initContent = lib.mkMerge [
      (lib.mkOrder 500 ''
        emulate zsh -c "$(direnv export zsh)"

        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi

        # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      '')
      (lib.mkOrder 1000 ''
        setopt EMACS
        if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then
          exec tmux
        fi

        # a run function
        run() {
            if [ $# -eq 0 ]; then
                return
            fi
            "$@" >/dev/null 2>&1 &
            disown >/dev/null 2>&1
        }

        _run_completion() {
            _command_names
        }

        compdef _run_completion run

        [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
      '')];
    };

    git = {
      enable = true;
      settings = {
        user = {
          email = "prayagjain2@gmail.com";
          name = "Prayag Jain";
        }; 
      };
    };

    direnv.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
      (import ../overlays/gcc-overlay.nix)
      overlays.emacs-overlay
  ];
}
