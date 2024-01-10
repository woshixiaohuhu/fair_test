import 'dart:convert';

import 'package:example/ui/fair_basic_info_plugin.dart';
import 'package:fair/fair.dart';
import 'package:fair_extension/navigator/fair_navigator_plugin.dart';
import 'package:fair_extension/toast/fair_toast_plugin.dart';
import 'package:flutter/material.dart';

@FairPatch()
class ListViewTest extends StatefulWidget {
  ListViewTest({Key? key}) : super(key: key);

  @override
  State<ListViewTest> createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  void click1(int index) {
    FairToast.show(msg: '$index');
    FairBasicInfoPlugin()
        .sendEvent({'index': '$index', 'eventName': '_removeIssueTasks'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                widget1(),
                widget2(),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemBuilder:
                  Sugar.indexedWidgetBuilder((context, index) => Column(
                        children: [
                          Text('测试-》indexedWidgetBuilder$index'),
                          Container(
                            width: 100,
                            height: 40,
                            color: Colors.red,
                            child: IconButton(
                                onPressed: () => click1(index),
                                icon: Icon(
                                  Icons.close,
                                  size: 30,
                                )),
                          ),
                        ],
                      )),
              shrinkWrap: true,
              itemCount: 2,
            ),
            Sugar.listBuilder(
              itemBuilder: (context, index) {
                /*   "na": {
                      "onPressed": "@(click(^(index)))",//这里的index也能解析出来
                      "child": {
                        "className": "Text",
                        "pa": [
                          "#(点击跳转 参数$index)"//这里的index能解析出来
                        ]
                      }
                    },*/
                return ElevatedButton(
                  ///将以int类型传递
                  onPressed: () => click(index),
                  /**/
                  child: Text('点击跳转 参数$index'),
                );
              },
              shrinkWrap: true,
              itemCount: 2,
            ),
            const SizedBox(height: 20),
            Sugar.listBuilder(
              itemBuilder: (context, index) {
                //var item = listData[index];
                //item.xx
                return ElevatedButton(
                  ///将以int类型传递
                  ///    "na": {
                  //    "arguments": {
                  //      "tag": "#($index)" //这里的index解析不出来！
                  //     }
                  // onPressed: () => Navigator.pushNamed(context, '/NativePage',
                  //     arguments: {'tag': '$index'}),
                  /*   "na": {
                          "arguments": {
                            "tag": "^(index)" //也解析不出来
                          }
                        }*/
                  onPressed: () => Navigator.pushNamed(context, '/NativePage',
                      arguments: {'tag': index}), //这里的index解析不了
                  /*    "child": {
                        "className": "Text",
                        "pa": [
                          "#(点击跳转 参数$index)" //这里的index能解析出来
                        ]
                      }*/
                  child: Text('点击跳转 参数$index'), //可以解析
                  //child: Text('点击跳转 参数${index}'),//写成这种不行
                );
              },
              shrinkWrap: true,
              itemCount: 2,
            ),
            Sugar.listBuilder(
              itemBuilder: (context, index) {
                //var item = listData[index];
                //item.xx
                return ElevatedButton(
                  ///将以int类型传递
                  ///    "na": {
                  //    "arguments": {
                  //      "tag": "#($index)" //这里的index解析不出来！
                  //     }
                  // onPressed: () => Navigator.pushNamed(context, '/NativePage',
                  //     arguments: {'tag': '$index'}),
                  /*   "na": {
                          "arguments": {
                            "tag": "^(index)" //也解析不出来
                          }
                        }*/
                  onPressed: () => Navigator.pushNamed(context, '/NativePage',
                      arguments: index), //这里的index解析不了
                  /*    "child": {
                        "className": "Text",
                        "pa": [
                          "#(点击跳转 参数$index)" //这里的index能解析出来
                        ]
                      }*/
                  child: Text('点击跳转 参数$index--直接传index 解析 pa'), //可以解析
                  //child: Text('点击跳转 参数${index}'),//写成这种不行
                );
              },
              shrinkWrap: true,
              itemCount: 2,
            ),
            const SizedBox(height: 20),
            Sugar.listBuilder(
              itemBuilder: (context, index) {
                return ElevatedButton(
                  /*error: 调用自定义方法 不支持可选参数调用
                  type 'NamedExpression' is not a subtype of type 'MethodInvocation' in type cast*/
                  // onPressed: () => aa2(arguments: {'a': '213'}),
                  // onPressed: () => otherMethod(context, '/NativePage',
                  //     arguments: {'tag': '$index'}),
                  //onPressed: () => aaa(),

                  //onPressed: () => aa3({'a': '213'}),
                  /*调用系统方法 支持可选参数*/

                  /*"tag" -> "#($index)"
                  *
                  * "onPressed": {
                        "className": "Navigator.pushNamed",
                        "pa": [
                          "^(context)",
                          "/NativePage"
                        ],
                        "na": {
                          "arguments": {
                            "tag": "#($index)"
                          }
                        }
                      }, 不支持解析index*/
                  // onPressed: () => Navigator.pushNamed(context, '/NativePage',
                  //     arguments: {'tag': '$index'}),

                  /*"onPressed": {
                        "className": "Navigator.pushNamed",
                        "pa": [
                          "^(context)",
                          "/NativePage"
                        ],
                        "na": {
                          "arguments": {
                            "tag": "^(index)" //不支持解析^(index)
                          }
                        }
                      },
                    */
                  // onPressed: () => Navigator.pushNamed(context, '/NativePage',
                  //     arguments: {'tag': index}),

                  /*"onPressed": {
                        "className": "Sugar.switchCase",
                        "pa": [
                          "^(index)",
                          [
                            {
                              "className": "SugarSwitchCaseObj",
                              "na": {
                                "sugarCase": 0,
                                "reValue": {
                                  "className": "Navigator.pushNamed",
                                  "pa": [
                                    "^(context)",
                                    "/NativePage"
                                  ],
                                  "na": {
                                    "arguments": {
                                      "tag": 0
                                    }
                                  }
                                }
                              }
                            }
                          ],
                          null
                        ]*/
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
                            reValue: () => () => Navigator.popAndPushNamed(
                                context, '/NativePage',
                                result: {'result': 'popAndPushNamed-pop返回结果'},
                                arguments: {'tag': 1})),
                        /* {
                              "className": "SugarSwitchCaseObj",
                              "na": {
                                "sugarCase": 2,
                                "reValue": {
                                  "className": "Navigator.pop",
                                  "pa": [
                                    "^(context)"
                                  ]
                                }
                              }
                            }*/
                        /*fair 有bug，全局搜索avigator.pop': 需要修改为以下才可以使用：
            'Navigator.pop': (props) => () {
                    Navigator.pop(
                      //props['pa'][0],
                      //$(props),
                      props['\$'],
                      props['pa'].length >= 2 ? props['pa'][1] : null,
                    );
                  },*/
                        // SugarSwitchCaseObj(
                        //   sugarCase: () => 2,
                        //   reValue: () => () => Navigator.pop(
                        //         context,
                        //       ),
                        // ),
                        /*{
                              "className": "SugarSwitchCaseObj",
                              "na": {
                                "sugarCase": 3,
                                "reValue": {
                                  "className": "Navigator.pop",
                                  "pa": [
                                    "^(context)",
                                    {
                                      "result": "pop返回结果" //不支持这个字典参数
                                    }
                                  ]
                                }
                              }*/
                        // SugarSwitchCaseObj(
                        //   sugarCase: () => 3,
                        //   reValue: () =>
                        //       () =>
                        //       Navigator.pop(context, {'result': 'pop返回结果'}),
                        // ),
                        // SugarSwitchCaseObj(
                        //   sugarCase: () => 3,
                        //   reValue: () => () => Navigator.pop(
                        //       context, getParmas()), //  "%(getParmas)"
                        // ),
                        // SugarSwitchCaseObj(
                        //   sugarCase: () => 3,
                        //   reValue: () => () => Navigator.pop(
                        //       context, getParmas3()), //  "%(getParmas3)"
                        // ),
                      ],
                      /*[Fair] 警告: 不识别的语法节点类型 NullLiteralImpl package:example/ui/test_list_view.dart:145:29: null*/
                      //() => null, //转化成 null
                      /*[Fair] 警告: 不识别的语法节点类型 NullLiteralImpl package:example/ui/test_list_view.dart:147:32: null*/
                      //     () {
                      //   return null;
                      // })
                      () {} //转化成：  ""
                      ),
                  /* "child": {
                        "className": "Text",
                        "pa": [
                          "#(点击跳转 参数$index)"////这里的index能解析出来
                        ]
                      }*/
                  child: Text('点击跳转 参数$index'),
                );
              },
              shrinkWrap: true,
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }

  /*  getParmas: function getParmas() {
                    const __thiz__ = this;
                    with(__thiz__) {
                        return convertObjectLiteralToSetOrMap({
                            ['result']: '12312312',
                        });
                    }
                },

   {\"pageName\":\"lib_ui_test_list_view#0\",\"result\":{\"result\":{}}}
        var value = jsonDecode(result); //result获取不到
        return value['result']['result'];
                */
  Map<String, dynamic> getParmas() {
    return {'result': '12312312'};
  }

  /*   不支持的返回类型： getParmas2: function getParmas2() {
                    const __thiz__ = this;
                    with(__thiz__) {
                        return jsonEncode(convertObjectLiteralToSetOrMap({
                            ['result']: '12312312',
                        }));
                    }*/
  String getParmas2() {
    return jsonEncode({'result': '12312312'});
  }

  /* getParmas3: function getParmas3() {
                    const __thiz__ = this;
                    with(__thiz__) {
                        return '1234';
                    }
                },*/
  String getParmas3() {
    return '1234';
  }

  void otherMethod(BuildContext context, String rootName,
      {Object? arguments}) {}

  void aaa() {}

/*  aa2: function aa2({
                    arguments
                } = {}) {
                    const __thiz__ = this;
                    const __arg_ctx__ = {
                        arguments,
                    };
                    with(__thiz__) {
                        with(__arg_ctx__) {}
                    }
                }, 函数支持可选参数*/
  void aa2({Object? arguments}) {}

  void aa3(Object? arguments) {}

  Widget widget1() {
    return ElevatedButton(
      onPressed: () {
        ///@(click(1))---将以字符串类型传递
        click(1); //
      },
      child: const Text('点击跳转 参数1'),
    );
  }

  void aa() {}

  Widget widget2() {
    return ElevatedButton(
      onPressed: () {
        click(2);
      },
      child: const Text('点击跳转 参数2'),
    );
  }

  /*  转化为js方法 参数可以传int或字符串    click: function click(tag) {
                    const __thiz__ = this;
                    const __arg_ctx__ = {
                        tag,
                    };
                    with(__thiz__) {
                        with(__arg_ctx__) {
                            FairNavigator.pushNamed({
                                routeName: '/NativePage',
                                arguments: convertObjectLiteralToSetOrMap({
                                    ['tag']: tag,
                                })
                            });
                        }
                    }
                },*/
  void click(int tag) {
    FairNavigator.pushNamed(
        routeName: '/NativePage', arguments: {'tag': '$tag'});
  }
}
