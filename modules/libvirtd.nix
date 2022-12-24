{pkgs, lig, config, ...}:{
  virtualisation.libvirtd.enable = true;

  virtualisation.qemu.ovmf.enable = true;
  virtualisation.qemu.swtpm.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
