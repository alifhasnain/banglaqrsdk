

import 'package:banglaqrsdk/banglaqrsdk_platform_interface.dart';

class Banglaqr {
  Future<String?> getPlatformVersion() {
    return BanglaqrsdkPlatform.instance.getPlatformVersion();
  }

  Future initializeBanglaQRSdk() {
    return BanglaqrsdkPlatform.instance.initializeBanglaQRSdk();
  }
}
