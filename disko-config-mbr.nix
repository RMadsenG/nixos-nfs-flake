{
  disko.devices = {
    disk = {
      root = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "table";
          format = "msdos";
          partitions = [
            {
              start = "1M";
              end = "-2G";
              part-type = "primary";
              name = "root";
              bootable = true;
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            }
            {
              start = "-2G";
              end = "100%";
              name = "swap";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
              };
            }
          ];
        };
      };
      ryannfs = {
        device = "/dev/sdb";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ryannfs = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/mnt/ryannfs";
              };
            };
          };
        };
      };
    };
  };
}