import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import 'package:fair_extension/toast/fair_toast_plugin.dart';

@FairPatch()
class TestDialog extends StatelessWidget {
  TestDialog({Key? key}) : super(key: key);

  @FairProps()
  var data;
  var password;
  var loginName;
  var type;
  var tag;
  var inputStr;

  onLoad() {
    password = data['password'];
    loginName = data['loginName'];
    type = data['type'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: showToast, child: const Text('点击toast')),
            ElevatedButton(
                onPressed: showDialog, child: const Text('点击dialog')),
            ElevatedButton(
                onPressed: showDialog2, child: const Text('点击dialog2')),
            ElevatedButton(
                onPressed: showDialog3, child: const Text('点击dialog3')),
            TextField(
              /*([props]) =>
            _functions?['runtimeInvokeMethod']?.call(funcName, false, props);类型不匹配*/
              onChanged: onChanged,
            ),
            ElevatedButton(
                onPressed: checkInputStr,
                child: const Text('delegate调用js实例：获取输入框内容')),
          ],
        ),
      ),
    );
  }

  void onChanged(String text) {
    inputStr = text;
  }

  void checkInputStr() {}

  showToast() {
    FairToast.show(msg: '1234');
  }

  showDialog() {}

  @FairWell('showDialog2')
  showDialog2() {}

  @FairWell('showDialog3')
  void showDialog3() {}

  String getLoginName() {
    return loginName;
  }
}
