{config, pkgs, ...}: {
  programs.ranger.settings = {
    column_ratios = "2,2,4";
    hidden_filter = "(Downloads|result|vmware-prayag)";
    vcs_aware = true;
    vcs_backend_git = "enabled";
    preview_images = true;
    preview_images_method = "w3m";
    unicode_ellipsis = true;
    draw_borders = true;
  };
}
