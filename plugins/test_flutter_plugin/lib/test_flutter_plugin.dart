
import 'test_flutter_plugin_platform_interface.dart';

class TestFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return TestFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
