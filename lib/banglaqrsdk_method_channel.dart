import 'package:banglaqrsdk/banglaqrsdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';


/// An implementation of [BanglaqrPlatform] that uses method channels.
class MethodChannelBanglaqr extends BanglaqrsdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('banglaqr');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> initializeBanglaQRSdk() async {
    return await methodChannel.invokeMethod<bool>('initializeBanglaQRSdk');
  }
}
