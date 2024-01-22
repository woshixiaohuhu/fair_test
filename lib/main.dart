import 'dart:convert';

import 'package:example/ui/fair_basic_info_plugin.dart';
import 'package:example/ui/fair_native.dart';
import 'package:example/ui/list_view_index_test_delegate.dart';
import 'package:example/ui/login.dart';
import 'package:example/ui/test_btn.dart';
import 'package:example/ui/test_delegate.dart';
import 'package:example/ui/test_observer_lifecycle.dart';
import 'package:example/ui/test_page_native.dart';
import 'package:example/ui/test_statefullwidget_didupdatewidget.dart';
import 'package:example/ui/xh_basic_plugin.dart';
import 'package:fair/fair.dart';
import 'package:fair_extension/fair_extension.dart';
import 'package:fair_extension/toast/fair_toast_plugin.dart';
import 'package:flutter/material.dart';

import 'f_test_module.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FairApp.runApplication(
    FairApp(
      delegate: {
        'lib_ui_test_listview_index_title': (context, data) =>
            TestListViewIndexDelegate(),
        // 'test_dialog': (context, data) => TestDelegate(),
        // 'test_dialog1': (context, data) => TestDelegate(),
        // 'test_dialog2': (context, data) => TestDelegate(),
        // 'test_dialog3': (context, data) => TestDelegate(),
      },
      child: const MyApp(),
      generated: TestGeneraterModule(),
    ),
    plugins: FairExtension.plugins
      ..addAll({
        'XhBasicPlugin': XhBasicPlugin(),
        'FairBasicInfoPlugin': FairBasicInfoPlugin(),
      }),
    jsPlugins: FairExtension.jsPlugins
      ..addAll({
        'fair_basic_info_plugin': 'assets/plugin/fair_basic_info.js',
        'xh_basic_plugins': 'assets/plugin/xh_basic_plugins.js',
      }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: FairExtension.fairNavigatorKey,
      // 设置初始路由
      initialRoute: '/',
      // 定义命名路由
      routes: {
        '/': (context) => const HomePage(),
        '/somePage': (context) => const HomePage(),
        '/NativePage': (context) => TestNativePage(),
      },
    );
  }
}

dynamic _getParams(BuildContext context, String key) =>
    (ModalRoute.of(context)?.settings.arguments is Map)
        ? (ModalRoute.of(context)?.settings.arguments as Map)[key]
        : null;

class BasicConfig {
  static BasicConfig? _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  BasicConfig._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory BasicConfig.getInstance() => _getInstance();

  /// 获取单例内部方法
  static BasicConfig _getInstance() {
    // 只能有一个实例
    _instance ??= BasicConfig._internal();
    return _instance!;
  }

  String? phoneBrandName;

  bool appIsDebug = !const bool.fromEnvironment("dart.vm.product");
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            addItem("测试图片fair", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FairWidget(
                            name: 'lib_ui_test_image',
                            path: 'assets/fair/lib_ui_test_image.fair.json',
                          )));
            }),
            addItem("测试future", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FairWidget(
                            name: 'lib_ui_test_future',
                            path: 'assets/fair/lib_ui_test_future.fair.json',
                          )));
            }),
            addItem("LoginPage", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }),
            addItem("测试app前后台切换", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TestLifeCycleObserver()));
            }),
            addItem("测试list view index title", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FairWidget(
                            name: 'lib_ui_test_listview_index_title',
                            path:
                                'assets/fair/lib_ui_test_listview_index_title.fair.json',
                          )));
            }),
            addItem("测试Sugar.map", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FairWidget(
                            name:
                                'lib_ui_listview_list_view_componeny_hotel_listview.fair',
                            path:
                                'assets/fair/lib_ui_listview_list_view_componeny_hotel_listview.fair.json',
                          )));
            }),
            addItem("测试statefull更新", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TestStatefullupdatePage()));
            }),
            addItem("Testbtn", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Testbtn(),
                ),
              );
            }),
            addItem("TestSomeWidget", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'TestSomeWidget',
                    path: 'assets/fair/lib_ui_test_somewidget_block.fair.json',
                  ),
                ),
              );
            }),
            addItem("测试本地路由", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'lib_ui_test_navigator.fair',
                    path: 'assets/fair/lib_ui_test_navigator.fair.json',
                  ),
                ),
              ).then((value) {
                if (value is String) {
                  Fluttertoast.showToast(msg: value);
                }
              });
            }),
            addItem("测试listview点击获取对应的item,测试路由插件", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'lib_ui_test_list_view',
                    path: 'assets/fair/lib_ui_test_list_view.fair.json',
                  ),
                ),
              ).then((value) {
                if (value is String) {
                  Fluttertoast.showToast(msg: value);
                }
              });
            }),
            addItem("测试路由2-native包裹fair-获取pop返回值", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FairNativePage()),
              ).then((value) {
                if (value is String) {
                  Fluttertoast.showToast(msg: value);
                }
              });
            }),
            addItem("测试 appinfo插件", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'lib_ui_test_basic_info',
                    path: 'assets/fair/lib_ui_test_basic_info.fair.json',
                  ),
                ),
              );
            }),
            addItem("测试data获取 debug参数", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'lib_ui_test_debug_arg',
                    path: 'assets/fair/lib_ui_test_debug_arg.fair.json',
                    data: {
                      'fairProps': jsonEncode(
                          {'debug': BasicConfig.getInstance().appIsDebug})
                    },
                  ),
                ),
              );
            }),
            addItem("测试 input decoration", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'lib_ui_test_decoration',
                    path: 'assets/fair/lib_ui_test_decoration.fair.json',
                  ),
                ),
              );
            }),
            addItem("测试dialog delegate", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'test_dialog',
                    path: 'assets/fair/lib_ui_test_dialog.fair.json',
                    delegate: TestDelegate(),
                    data: {
                      'fairProps': jsonEncode({
                        'password': '1234',
                        'loginName': 'admin',
                        'type': 100
                      })
                    },
                  ),
                ),
              );
            }),
            addItem("测试@ method arg", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairWidget(
                    name: 'lib_ui_test_method_arg',
                    path: 'assets/fair/lib_ui_test_method_arg.fair.json',
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget addItem(String itemName, dynamic onPress) {
  return GestureDetector(
      onTap: onPress,
      child: Container(
          alignment: Alignment.centerLeft,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 0.5))),
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            itemName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.left,
          )));
}
