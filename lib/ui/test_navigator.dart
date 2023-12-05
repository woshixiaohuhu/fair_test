import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestNavigator extends StatelessWidget {
  TestNavigator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/NativePage',
                    arguments: {'tag': '123'}),
                child: const Text('点击跳转注册的页面,页面参数123')),
            /*不支持 builder这种闭包 不支持匿名函数： {
                        "className": "MaterialPageRoute",
                        "na": {
                          "builder": {
                            "className": "FairWidget",
                            "na": {
                              "name": "lib_ui_test_navigator.fair",
                              "path": "assets/fair/lib_ui_test_navigator.fair.json"
                            },
                            "functionParameters": {
                              "pa": [
                                "context"
                              ]
                            }
                          }
                        }
                      }*/
            // GestureDetector(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => FairWidget(
            //         name: 'lib_ui_test_navigator.fair',
            //         path: 'assets/fair/lib_ui_test_navigator.fair.json',
            //       ),
            //     ),
            //   ),
            //   child: const Text('跳转动态页面'),
            // ),
            Sugar.listBuilder(
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: Sugar.switchCase(
                      index,
                      [
                        SugarSwitchCaseObj(
                            sugarCase: () => 0,
                            reValue: () => () => Navigator.pushNamed(
                                context, '/NativePage',
                                arguments: {'tag': 0})),
                        SugarSwitchCaseObj(
                            sugarCase: () => 1,
                            reValue: () => () => Navigator.pushNamed(
                                context, '/NativePage',
                                arguments: {'tag': 1})),
                      ],
                      () {}),
                  child: Text('点击跳转 参数$index'),
                );
              },
              shrinkWrap: true,
              itemCount: 2,
            ),
            Sugar.listBuilder(
              itemBuilder: (context, index) {
                return Sugar.switchCase(
                    index,
                    [
                      SugarSwitchCaseObj(
                          sugarCase: () => 0,
                          reValue: () => ElevatedButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/NativePage',
                                    arguments: {'tag': 1}),
                                child: const Text('点击跳转参数1'),
                              )),
                      SugarSwitchCaseObj(
                          sugarCase: () => 1,
                          reValue: () => TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/NativePage',
                                    arguments: {'tag': 2}),
                                child: const Text('点击跳转参数2'),
                              )),
                    ],
                    () => Container());
              },
              shrinkWrap: true,
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
