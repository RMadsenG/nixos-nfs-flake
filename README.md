```bash
parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1MB -2GB
parted /dev/sda -- set 1 boot on
parted /dev/sda -- mkpart primary linux-swap -2GB 100%
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mount /dev/disk/by-label/nixos /mnt
swapon /dev/sda2
nixos-generate-config --root /mnt/ --flake

# Then overwrite `hardware-configuration.nix` with `/mnt/etx/nixos/hardware-configuration.nix`
sudo nixos-install --flake .#nixos --no-root-passwd
nixos-enter --root /mnt -c 'passwd admin'
reboot
```

Still need to:
1. Add auth key to ssh folder
2. Mount NFS Drive
