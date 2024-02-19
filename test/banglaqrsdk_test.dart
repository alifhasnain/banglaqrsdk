import 'package:flutter_test/flutter_test.dart';
import 'package:banglaqrsdk/banglaqrsdk.dart';
import 'package:banglaqrsdk/banglaqrsdk_platform_interface.dart';
import 'package:banglaqrsdk/banglaqrsdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBanglaqrsdkPlatform
    with MockPlatformInterfaceMixin
    implements BanglaqrsdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BanglaqrsdkPlatform initialPlatform = BanglaqrsdkPlatform.instance;

  test('$MethodChannelBanglaqrsdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBanglaqrsdk>());
  });

  test('getPlatformVersion', () async {
    Banglaqrsdk banglaqrsdkPlugin = Banglaqrsdk();
    MockBanglaqrsdkPlatform fakePlatform = MockBanglaqrsdkPlatform();
    BanglaqrsdkPlatform.instance = fakePlatform;

    expect(await banglaqrsdkPlugin.getPlatformVersion(), '42');
  });
}
