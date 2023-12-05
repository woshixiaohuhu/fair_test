import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:url_launcher/url_launcher.dart';

///此处类名需要与js中变量名保持一致
class XhBasicPlugin extends IFairPlugin {
  static final XhBasicPlugin _fairXPlugin = XhBasicPlugin._internal();

  XhBasicPlugin._internal();

  factory XhBasicPlugin() {
    return _fairXPlugin;
  }

  Future<bool> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    return await launchUrl(launchUri);
  }

  Future<dynamic> call(map) async {
    print('FairXPlugin pluginRequest');

    if (map == null) {
      return;
    }
    var req;
    bool isDart;
    if (map is Map) {
      isDart = true;
      req = map;
    } else {
      isDart = false;
      req = jsonDecode(map);
    }

    var args = req['args'];
    var pageName = req['pageName'];
    var id = req['id'];

    var responseCallback = args['response'];
    var type = args['type'];
    switch (type) {
      case 'Call':
        var phoneNumber = args['phoneNumber'];
        var result = await canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
        if (result) {
          var value = await _makePhoneCall(phoneNumber);
          if (isDart) {
            responseCallback?.call(value);
          } else {
            var resp = {
              'pageName': pageName,
              'id': id,
              'response': value,
            };
            return Future.value(jsonEncode(resp));
          }
        } else {
          throw 'Could not call $phoneNumber';
        }
        break;
    }

    return Future.value();
  }

  // 设置xh中biz类型
  setXhType(dynamic map) {
    if (map == null) {
      return;
    }
    var req;
    if (map is Map) {
      req = map;
    } else {
      req = jsonDecode(map);
    }

    var type = req['type'];
    // eventBus.fire(SetBizTypeEvent(type));
  }

  // 判断是否是debug模式
  getIsDebug(dynamic map) {
    final data = {'debug': false};
    return jsonEncode(data);
  }

  ///注册需要被识别的方法名
  @override
  Map<String, Function> getRegisterMethods() {
    var functions = <String, Function>{};
    functions.putIfAbsent('getIsDebug', () => getIsDebug);
    return functions;
  }
}
