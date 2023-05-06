import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_web_method_channel.dart';

abstract class NativeWebPlatform extends PlatformInterface {
  /// Constructs a NativeWebPlatform.
  NativeWebPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeWebPlatform _instance = MethodChannelNativeWeb();

  /// The default instance of [NativeWebPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeWeb].
  static NativeWebPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeWebPlatform] when
  /// they register themselves.
  static set instance(NativeWebPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
