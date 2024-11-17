{ pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.gnome.seahorse}/libexec/seahorse/ssh-askpass";
}
