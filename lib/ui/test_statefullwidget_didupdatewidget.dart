import 'package:flutter/material.dart';

class TestStatefullupdatePage extends StatefulWidget {
  @override
  State<TestStatefullupdatePage> createState() =>
      _TestStatefullupdatePageState();
}

class _TestStatefullupdatePageState extends State<TestStatefullupdatePage> {
  String str1 = '123';
  var str2 = '123';
  MaterialStatesController? statesController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*如果statefullwidget key没变，则调用顺序如下：

          didUpdateWidget
          build

        runtimetype相同但是key发生修改，在inflateWidget中创建新的element ，整体的执行顺序如下：

          createElement
          createState
          initState
          didChangeDependencies
          build
 */
    //initstate里面存储的内容，如果发生修改了，需要移除在didupdatewidget里面判断进行
    statesController = MaterialStatesController();
    statesController?.addListener(() {
      DateTime now = DateTime.now();
      str1 = "Current DateTime: $now";
      print('$str1:${statesController?.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              DateTime now = DateTime.now();
              str1 = "Current DateTime: $now";
              setState(() {});
            },
            child: const Icon(
              Icons.abc_sharp,
              size: 50,
            ),
          ),
          GestureDetector(
            onTap: () {
              statesController = MaterialStatesController();
              //
              statesController?.addListener(() {
                DateTime now = DateTime.now();
                str1 = "Current DateTime: $now";
                print('$str1:${statesController?.value}');
              });
              setState(() {});
            },
            child: const Text('修改controller'),
          ),
          GestureDetector(
            onTap: () {
              DateTime now = DateTime.now();
              str2 = "Current DateTime: $now";
              setState(() {});
            },
            child: const Text('刷新TestInheritWidget'),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min, //默认max沾满全屏幕。min则为子widget大小
              children: [
                TestStatefullupdate(
                  text: '$str1',
                ),
                OutlinedButton(
                    onPressed: () {},
                    //
                    statesController: statesController,
                    child: Text(
                      'outlinebutton ',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )),
                TestInheritWidget(
                  //主要就是用来保存数据的
                  someData: '123--->$str2',
                  /*在child的widget中通过 context.dependOnInheritedWidgetOfExactType
                        获取父widget中的InheritedWidget，从而拿到data数据,
                  这么就可以保证所有的子child widget都能使用同一个someData*/
                  child: Column(
                    children: [
                      GetdataWidget(),
                      GetdataWidget(),
                      GetdataWidget(),
                      GetdataWidget(),
                      GetdataWidget(),
                    ],
                  ),
                ),
                Text('没有 materical  '),

                /*
           ///1、
              final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

           ///2、
              static DefaultTextStyle of(BuildContext context) {
              return context.dependOnInheritedWidgetOfExactType<DefaultTextStyle>() ?? const DefaultTextStyle.fallback();
            }

          ///3、
                  @override
                  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>({Object? aspect}) {
                    assert(_debugCheckStateIsActiveForAncestorLookup());
                    final InheritedElement? ancestor = _inheritedWidgets == null ? null : _inheritedWidgets![T];
                    if (ancestor != null) { //为什么这里能拿到这个 TextStyle(fontSize: 31, color: Colors.red),
                      return dependOnInheritedElement(ancestor, aspect: aspect) as T;
                    }
                    _hadUnsatisfiedDependencies = true;
                    return null;
                  }
              */
                const Material(
                  textStyle: TextStyle(
                      fontSize: 31,
                      color: Colors.red,
                      backgroundColor: Colors.blue),
                  child: Text(
                    'materical 中的style',
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                ),

                RichText(
                  text: const TextSpan(
                    text: 'Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.green),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Flutter 颜色是红色 本层设置了颜色，使用本岑高度，没设置的使用上层的',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          inherit: false, //这里没用，还是上层的fontsize50字体
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TestStatefullupdate extends StatefulWidget {
  final String? text;

  TestStatefullupdate({super.key, this.text});

  @override
  State<TestStatefullupdate> createState() => _TestStatefullupdateState();
}

class _TestStatefullupdateState extends State<TestStatefullupdate> {
  String? stateStr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateStr = '123';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text ?? '',
          style: const TextStyle(color: Colors.red, fontSize: 20),
        ),
        Text(
          stateStr ?? '',
          style: const TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant TestStatefullupdate oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    DateTime now = DateTime.now();
    String str1 = "Current DateTime: $now";
    print('$str1 ');
    //会不会死循环？---不会
    setState(() {});
    // if (oldWidget.text != widget.text) {
    //   setState(() {});
    // }
  }

// MaterialStatesController? internalStatesController;
//
// void handleStatesControllerChange() {
//   // Force a rebuild to resolve MaterialStateProperty properties
//   setState(() { });
// }
//
// MaterialStatesController get statesController => widget.statesController ?? internalStatesController!;
//
// void initStatesController() {
//   if (widget.statesController == null) {
//     internalStatesController = MaterialStatesController();
//   }
//   statesController.update(MaterialState.disabled, !widget.enabled);
//   statesController.addListener(handleStatesControllerChange);
// }
//
// @override
// void initState() {
//   super.initState();
//   initStatesController();
// }

// @override
// void didUpdateWidget(ButtonStyleButton oldWidget) {
//   super.didUpdateWidget(oldWidget);
//   if (widget.statesController != oldWidget.statesController) {
//     oldWidget.statesController?.removeListener(handleStatesControllerChange);
//     if (widget.statesController != null) {
//       internalStatesController?.dispose();
//       internalStatesController = null;
//     }
//     initStatesController();
//   }
//   if (widget.enabled != oldWidget.enabled) {
//     statesController.update(MaterialState.disabled, !widget.enabled);
//     if (!widget.enabled) {
//       // The button may have been disabled while a press gesture is currently underway.
//       statesController.update(MaterialState.pressed, false);
//     }
//   }
// }
}

class TestInheritWidget extends InheritedWidget {
  String? someData;

  TestInheritWidget({super.key, required super.child, this.someData});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static String? of(BuildContext context) {
    final TestInheritWidget? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<TestInheritWidget>();
    return buttonTheme?.someData ?? '';
  }
}

class GetdataWidget extends StatefulWidget {
  @override
  State<GetdataWidget> createState() => _GetdataWidgetState();
}

class _GetdataWidgetState extends State<GetdataWidget> {
  @override
  Widget build(BuildContext context) {
    String data = TestInheritWidget.of(context) ?? '';
    return Text('get data: $data');
  }
}
