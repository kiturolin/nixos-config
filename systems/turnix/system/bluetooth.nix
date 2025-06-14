{
  # 启用蓝牙模块
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # 启用Blueman程序作为系统的Bluetooth Manager
  services.blueman.enable = true;
  # 启用Pipewire的Pulse组件， 支持蓝牙设备声音输出
  services.pipewire.pulse.enable = true;
}