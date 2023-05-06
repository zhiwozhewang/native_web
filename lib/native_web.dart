
import 'native_web_platform_interface.dart';

class NativeWeb {
  Future<String?> getPlatformVersion() {
    return NativeWebPlatform.instance.getPlatformVersion();
  }
}
