{ inputs, pkgs, unstable-pkgs, lib, config, ...}:
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
    ./configs/ranger
    ./configs/flatpak/local.nix
    ./drv/cp
  ];

  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";
    }
  ];

  services.flatpak.uninstallUnmanaged = false;

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
        "xdg-config/kdeglobals"
        "home/me:ro"
        "/nix/store:ro"
      ];
      Environment = {
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
      };
    };
  };

  home.packages = with pkgs; [
    brave
    cava
    tree
    btop
    fastfetch
    ookla-speedtest
    gnome-disk-utility
    obs-studio
    kdePackages.filelight
    gimp
    corefonts
    libreoffice-stable
    cachix
    qbittorrent
    jamesdsp
    megasync
    ani-cli
    open-dyslexic
    tauon
    discord
    devenv
    unrar
    localsend
    ollama
    sysstat

    qmk-udev-rules
    vial # qmk/via keyboard app

    # for dev
    # yes i don't want to enter a nix shell again and again when I'm just brainstorming
    clang-tools
    clang
    (lib.hiPrio gcc)
    gdb
    zed-editor
    wineWow64Packages.stable

    python3 # temp

    unstable-pkgs.antigravity-cli
    
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
      dotDir = config.home.homeDirectory;
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
  nixpkgs.overlays = [];
}
