import 'package:example/ui/fair_basic_info_plugin.dart';
import 'package:fair/fair.dart';
import 'package:fair_extension/toast/fair_toast_plugin.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestBasicInfo extends StatefulWidget {
  const TestBasicInfo({Key? key}) : super(key: key);

  @override
  State<TestBasicInfo> createState() => _TestBasicInfoState();
}

class _TestBasicInfoState extends State<TestBasicInfo> {
  var os;
  var version;
  var isDebug;

  onLoad() {
    os = ' ';
    version = ' ';
    isDebug = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(children: [
          ElevatedButton(
            onPressed: () => onTap(1),
            child: const Text('点击获取debug'),
          ),
          ElevatedButton(
            onPressed: () => onTap(2),
            child: const Text('点击获取app信息'),
          ),
          ElevatedButton(
            onPressed: () => test3,
            child: const Text('测试3'),
          ),
          Column(
            children: [
              Text(os),
              Text(version),
              Text('$isDebug'),
            ],
          )
        ]),
      ),
    );
  }

  Future<void> onTap(int method) async {
    if (method == 1) {
      var a = await FairBasicInfoPlugin().getAppIsDebug();
      isDebug = a;
      setState(() {});
    } else {
      var result = await FairBasicInfoPlugin().getAppInfo(null);
      os = result['os'];
      version = result['version'];
      isDebug = result['appIsDebug'];
      setState(() {});
    }
  }

  void test3() {
    FairBasicInfoPlugin().getAppInfo((result) {
      os = result['os'];
      version = result['version'];
      isDebug = result['appIsDebug'];
      setState(() {});
    });
  }
}
