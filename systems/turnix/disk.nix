{
  disko.devices.disk.main = {
    device = "/dev/disk/by-id/nvme-ZHITAI_TiPlus7100_1TB_ZTA71T0AB241921MG3_1";
    content = {
      type = "gpt";
      partitions = {
        boot = {
          type = "EF00";
          size = "1G";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        root = {
          type = "8304";
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
