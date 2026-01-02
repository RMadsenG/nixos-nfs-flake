Clone/Copy all files to local dir
```bash
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount disko-config-mbr.nix --yes-wipe-all-disks
nixos-generate-config --root /mnt/ --flake

# Then overwrite `hardware-configuration.nix` with `/mnt/etx/nixos/hardware-configuration.nix`
sudo nixos-install --flake .#nixos --no-root-passwd
nixos-enter --root /mnt -c 'passwd admin'
reboot
```

Still need to:
1. Add auth key to ssh folder for each user `/etc/ssh/authkeys/%u`
2. Create `/mnt/%u/storage` for each user, and chown own it for same user
