{
  # sayodevice
  services.udev.extraRules = ''
      #BlackC Sayobot.cn SayoDevice *std-F*
    KERNEL=="hidraw*" \
    , ATTRS{idVendor}=="8089" \
    , ATTRS{idProduct}=="0005" \
    , MODE="0666"

    KERNEL=="hidraw*" \
    , ATTRS{idVendor}=="8089" \
    , ATTRS{idProduct}=="0004" \
    , MODE="0666"

    #BlackC Sayobot.cn SayoDevice *mini*
    KERNEL=="hidraw*" \
    , ATTRS{idVendor}=="8089" \
    , ATTRS{idProduct}=="0003" \
    , MODE="0666"

    #BlackC Sayobot.cn SayoDevice *std*
    KERNEL=="hidraw*" \
    , ATTRS{idVendor}=="8089" \
    , ATTRS{idProduct}=="0002" \
    , MODE="0666"
  '';
}
