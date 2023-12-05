import 'dart:convert';
import 'dart:io';
import 'package:fair/fair.dart';

class FairBasicInfoPlugin extends IFairPlugin {
  static final FairBasicInfoPlugin _instance = FairBasicInfoPlugin._internal();

  FairBasicInfoPlugin._internal();

  static Map<String, dynamic>? commonInfo;

  factory FairBasicInfoPlugin() {
    return _instance;
  }

  Future<dynamic> getAppInfo(
      void Function(Map<String, dynamic> result)? complete) async {
    ///空实现，仅用dart端占位
  }

  Future<dynamic> getAppIsDebug() async {
    ///空实现，仅用dart端占位
  }

  Future<dynamic> _getAppInfo(dynamic map) async {
    var req = jsonDecode(map);
    var pageName = req['pageName'];
    var args = req['args'];

    var callId = args['callId'];
    Map<String, dynamic> data = _getAppData();
    if (commonInfo?.isNotEmpty == true) {
      data.addAll(commonInfo!);
    }

    var resp = {
      'callId': callId,
      'pageName': pageName,
      'data': data,
    };
    return Future.value(jsonEncode(resp));
  }

  Future<dynamic> _getAppIsDebug(dynamic map) async {
    var resp = {'appIsDebug': appIsDebug};
    return Future.value(jsonEncode(resp));
  }

  Map<String, dynamic> _getAppData() {
    return {
      'os': Platform.isAndroid ? 'android' : 'ios',
      'version': Platform.version, //dart sdk version
      'appIsDebug': appIsDebug
    };
  }

  static bool appIsDebug = !const bool.fromEnvironment("dart.vm.product");

  Map<String, Function> getRegisterMethods() {
    var functions = <String, Function>{};
    functions.putIfAbsent('getAppInfo', () => _getAppInfo);
    functions.putIfAbsent('getAppIsDebug', () => _getAppIsDebug);
    return functions;
  }
}
