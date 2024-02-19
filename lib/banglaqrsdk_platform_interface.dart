import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'banglaqrsdk_method_channel.dart';

abstract class BanglaqrsdkPlatform extends PlatformInterface {
  /// Constructs a BanglaqrPlatform.
  BanglaqrsdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static BanglaqrsdkPlatform _instance = MethodChannelBanglaqr();

  /// The default instance of [BanglaqrPlatform] to use.
  ///
  /// Defaults to [MethodChannelBanglaqr].
  static BanglaqrsdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BanglaqrPlatform] when
  /// they register themselves.
  static set instance(BanglaqrsdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> initializeBanglaQRSdk({
    required String primaryColorCode,
    required String secondaryColorCode,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
