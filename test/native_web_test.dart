import 'package:flutter_test/flutter_test.dart';
import 'package:native_web/native_web.dart';
import 'package:native_web/native_web_platform_interface.dart';
import 'package:native_web/native_web_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeWebPlatform
    with MockPlatformInterfaceMixin
    implements NativeWebPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeWebPlatform initialPlatform = NativeWebPlatform.instance;

  test('$MethodChannelNativeWeb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeWeb>());
  });

  test('getPlatformVersion', () async {
    NativeWeb nativeWebPlugin = NativeWeb();
    MockNativeWebPlatform fakePlatform = MockNativeWebPlatform();
    NativeWebPlatform.instance = fakePlatform;

    expect(await nativeWebPlugin.getPlatformVersion(), '42');
  });
}
