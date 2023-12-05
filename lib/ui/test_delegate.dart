import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDelegate extends FairDelegate {
  @override
  Map<String, Function> bindFunction() {
    var func = super.bindFunction();
    func['showDialog'] = _showDialog;
    func['showDialog2'] = _showDialog;
    func['showDialog3'] = _showDialog;
    func['checkInputStr'] = _checkInputStr;
    return func;
  }

  void _checkInputStr() {
    var result = runtime?.variablesSync(pageName, {'inputStr': ''});
    var json = jsonDecode(result!);
    var tip = json['result']['inputStr'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('提示'),
          content: Text('这是一个对话框弹窗示例,delegate调用js：执行结果$tip'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialog() async {
    ///同步方式获取变量值
    //获取单个变量值
    var result = runtime?.variablesSync(pageName, {'loginName': ''});
    var json = jsonDecode(result!);
    var tip = json['result']['loginName'];

    //获取多个变量值
    var result2 =
        runtime?.variablesSync(pageName, {'loginName': '', 'password': ''});
    var json2 = jsonDecode(result2!);
    var tip2 = json2['result']['loginName'];

    //获取js页面所有成员变量值
    var result3 = runtime?.variablesSync(pageName, {});
    var json3 = jsonDecode(result3!);
    var tip3 = json3['result']['loginName'];

    ///异步方法获取
    var result11 = await runtime?.variables(pageName, {'loginName': ''});
    var json11 = jsonDecode(result11!);
    var tip11 = json11['result']['loginName'];

    ///同步执行js函数
    var result4 = runtime?.invokeMethodSync(pageName, 'getLoginName', null);
    var json4 = jsonDecode(result4!);
    var tip4 = json4['result']['result'];

    ///异步执行js函数
    var result5 = await runtime?.invokeMethod(pageName, 'getLoginName', null);
    var json5 = jsonDecode(result5!);
    var tip5 = json5['result']['result'];

    String str = '$tip,$tip2,$tip3,$tip4,$tip5,$tip11';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('提示'),
          content: Text('这是一个对话框弹窗示例,delegate调用js：执行结果$str'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }
}
