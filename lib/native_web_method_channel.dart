import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_web_platform_interface.dart';

/// An implementation of [NativeWebPlatform] that uses method channels.
class MethodChannelNativeWeb extends NativeWebPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_web');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
