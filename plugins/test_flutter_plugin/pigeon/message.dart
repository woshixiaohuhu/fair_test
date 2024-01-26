import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class AppNativeApi {
  String? getHost();

  String? getBrokerId();
}
