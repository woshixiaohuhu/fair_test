import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'test_flutter_plugin_method_channel.dart';

abstract class TestFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a TestFlutterPluginPlatform.
  TestFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static TestFlutterPluginPlatform _instance = MethodChannelTestFlutterPlugin();

  /// The default instance of [TestFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelTestFlutterPlugin].
  static TestFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TestFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(TestFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
