import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:banglaqrsdk/banglaqrsdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBanglaqrsdk platform = MethodChannelBanglaqrsdk();
  const MethodChannel channel = MethodChannel('banglaqrsdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
