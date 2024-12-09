{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {
      enableHybridCodec = true;
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      intel-media-sdk
      # vpl-gpu-rt
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
    VDPAU_DRIVER = "iHD";
  };
}
