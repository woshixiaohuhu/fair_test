import 'package:fair_extension/toast/fair_toast_plugin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestLifeCycleObserver extends StatefulWidget {
  const TestLifeCycleObserver({super.key});

  @override
  State<TestLifeCycleObserver> createState() => _TestLifeCycleObserverState();
}

class _TestLifeCycleObserverState extends State<TestLifeCycleObserver>
    with WidgetsBindingObserver {
  String appStateStr = '';
  String appStateStr2 = '';
  int state1 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              appStateStr,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              appStateStr2,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

/*
* 1、从顶部滑动通知中心： inactive ,
* 2、从顶部滑动关闭通知中心：resumed
* 3、按home到手机桌面：inactive，paused。
* 4、点击app回到app：inactive，resumed
* */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print("切换到了前台");
      appStateStr = '切换到了前台';
      appStateStr2 = "resumed";
      if (state1 == 1) {
        Fluttertoast.showToast(msg: '回到前台');
      }
      state1 = 0;
    } else if (state == AppLifecycleState.paused) {
      print("切换到了后台");
      appStateStr = '切换到了后台';
      appStateStr2 = "paused";
      state1 = 1;
    } else if (state == AppLifecycleState.detached) {
      appStateStr2 = "detached";
    } else if (state == AppLifecycleState.inactive) {
      appStateStr2 = "inactive";
    } else if (state == AppLifecycleState.detached) {
      appStateStr2 = "detached";
    }
    print(appStateStr2);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 在这里执行一些清理工作、释放资源
    WidgetsBinding.instance.removeObserver(this);
  }

/*deactivate 是在 Widget 不可见时调用，而 dispose 是在 Widget 被永久销毁时调用。
在这两个方法中，你可以执行清理工作，
但 dispose 更适合执行一些比较重的清理操作，例如释放资源和取消订阅。*/
  @override
  void deactivate() {
    super.deactivate();
    // 在这里执行一些轻量级的清理工作
  }
}
