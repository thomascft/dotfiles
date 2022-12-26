{pkgs, lig, config, ...}:{
  virtualisation.libvirtd.enable = true;

  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  users.users.thomas.extraGroups = ["libvirtd"];

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
