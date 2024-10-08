{ pkgs, ... }: {
  home.packages = with pkgs; [
    # ranger optional dependencies
    ffmpegthumbnailer
    mediainfo
    poppler
    ueberzugpp
  ];
  programs.ranger = {
    enable = true;
    mappings = {
      "N" = "shell nix develop";
    };
    settings = {
      hidden_filter = "^\\.|\\.(?:pyc|pyo|bak|swp)$|^lost\\+found$|^__(py)?cache__$|^(Downloads|vmware-prayag|result)$";
      column_ratios = "2,2,4";
      vcs_aware = true;
      vcs_backend_git = "enabled";
      preview_images = true;
      preview_images_method = "ueberzug";
      unicode_ellipsis = true;
      draw_borders = true;
    };
  };
}
