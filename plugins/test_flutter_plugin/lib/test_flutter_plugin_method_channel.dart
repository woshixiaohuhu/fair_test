import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'test_flutter_plugin_platform_interface.dart';

/// An implementation of [TestFlutterPluginPlatform] that uses method channels.
class MethodChannelTestFlutterPlugin extends TestFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
