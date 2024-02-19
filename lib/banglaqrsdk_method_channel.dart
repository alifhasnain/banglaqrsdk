import 'package:banglaqrsdk/banglaqrsdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [BanglaqrPlatform] that uses method channels.
class MethodChannelBanglaqr extends BanglaqrsdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('banglaqr');

  @override
  Future<String?> initializeBanglaQRSdk({
    required String primaryColorCode,
    required String secondaryColorCode,
  }) async {
    return await methodChannel.invokeMethod<String?>('initializeBanglaQRSdk',{
      "primaryColorCode":primaryColorCode,
      "secondaryColorCode":secondaryColorCode
    });
  }
}
