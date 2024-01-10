import 'package:example/ui/f_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class _ElevatedButtonDefaultElevation extends MaterialStateProperty<double>
    with Diagnosticable {
  _ElevatedButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return 0;
    }
    if (states.contains(MaterialState.hovered)) {
      return elevation + 2;
    }
    if (states.contains(MaterialState.focused)) {
      return elevation + 2;
    }
    if (states.contains(MaterialState.pressed)) {
      return elevation + 6;
    }
    return elevation;
  }
}

class Testbtn extends StatelessWidget {
  Testbtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            print('123');
            Navigator.of(context).pop();
          },
        ),
      ),
      // body: test1(),
      body: test12(),
    );
  }

  SingleChildScrollView test12() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FButton4(
            title: '123',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  SingleChildScrollView test1() {
    return SingleChildScrollView(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FButton4(
            title: 'button4',
          ),
          // Flexible(
          //   child: FButton3(
          //     child: Text('123'),
          //     backgroundColor: Colors.red,
          //   ),
          // ),
          // FButton3(
          //   onPressed: () {},
          //   child: Text('123'),
          // ),
          OutlinedButton(
            onPressed: () {},
            child: Text('红色背景白色文字按钮'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              // textStyle: TextStyle(color: Colors.white),
              foregroundColor: Colors.white,
              splashFactory: NoSplash.splashFactory,
              side: const BorderSide(width: 1, color: Colors.red), //不需要边框
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('红色边框白色背景'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              // textStyle: TextStyle(color: Colors.white),
              foregroundColor: Colors.red,
              splashFactory: NoSplash.splashFactory,
              side: const BorderSide(width: 1, color: Colors.red),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('测试3测试3测试3测试3测试3测试3测试3'),
            style: OutlinedButton.styleFrom(
              // fixedSize: Size(100, 50),
              backgroundColor: Colors.white,
              // textStyle: TextStyle(color: Colors.white),
              foregroundColor: Colors.red,
              splashFactory: NoSplash.splashFactory,
              side: const BorderSide(width: 1, color: Colors.red),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('测试3'),
            style: OutlinedButton.styleFrom(
              // fixedSize: Size(100, 50),
              backgroundColor: Colors.white,
              // textStyle: TextStyle(color: Colors.white),
              foregroundColor: Colors.red,
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.all(30),
              side: const BorderSide(width: 1, color: Colors.red),
              shape: CircleBorder(),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('测试4'),
            style: OutlinedButton.styleFrom(
              // fixedSize: Size(100, 50),
              backgroundColor: Colors.red,
              textStyle: TextStyle(color: Colors.blue),
              foregroundColor: Colors.white,
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.all(30),
              side: const BorderSide(width: 1, color: Colors.red),
              shape: CircleBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('测试4'),
            style: ElevatedButton.styleFrom(
              // fixedSize: Size(100, 50),
              backgroundColor: Colors.red,
              textStyle: TextStyle(color: Colors.blue),
              foregroundColor: Colors.white,
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.all(30),
              side: const BorderSide(width: 1, color: Colors.red),
              shape: CircleBorder(),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('ElevatedButton elevation =0,彻底不凸起'),
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll<double?>(0),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //     elevation: 0, //这里只能控制普通状态是0
                    //     padding: EdgeInsets.zero,
                    //     //foregroundColor: ,
                    //     visualDensity:
                    //         VisualDensity(horizontal: 0, vertical: 0),
                    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap)
                    //   ..elevation = MaterialStatePropertyAll<double?>(0),
                  ),
                ),
                Container(
                  height: 48,
                  width: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('TextButton'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.red, fontSize: 30)),
            child: Text('TextButton---text style'), //为什么能够获取到style中的text style
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  textStyle: TextStyle(color: Colors.red, fontSize: 30)),
              child: Column(
                children: [
                  Text('123text style--随便套多少个子widget，都能够从父节点获取到style'),
                  Text('123---所有子Text都能获取父节点相同style值，并且不论套了多少层')
                ],
              )),

          FButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              icon: Icon(Icons.dark_mode),
              label: Text('123')),
          _testSemantics(),
          _testFoucsBtn(),
          _testIconBtn(),

          FButton3(
            child: Text('123'),
            onPressed: () {},
          ),
          //Flutter 2.x 的版本，你会发现之前的一些按钮 Widget 被废弃了：
          /*
            Flutter 1.x 中的按钮 WidgetFlutter 2.x 中的按钮
             RaisedButton 凸起按钮 ElevatedButton 凸起按钮
             FlatButton 扁平按钮 TextButton 扁平按钮
             OutlinedButton 线框按钮 OutlinedButton 线框按钮
          */
          /*
        * class TextButton extends ButtonStyleButton 扁平按钮
        *class ElevatedButton extends ButtonStyleButton 凸起按钮
        * class OutlinedButton extends ButtonStyleButton 线框按钮
        * */
          /*class TextButton extends ButtonStyleButton 扁平按钮
            外观： TextButton是一个扁平的按钮，通常只包含文本而没有背景。
            使用场景： 适用于简单的文本按钮，或者在需要轻松可点击的文本区域的情况下。

            class ElevatedButton extends ButtonStyleButton 凸起按钮
            外观： ElevatedButton有一个凸起的外观，通常有背景颜色。
            使用场景： 适用于需要强调的主要操作按钮。



            class OutlinedButton extends ButtonStyleButton 线框按钮
            外观： OutlinedButton有一个轮廓，通常没有填充背景，只有边框。
            使用场景： 适用于次要操作按钮，或者在需要一个离散的按钮时。

            这三个按钮都继承自ButtonStyleButton，这意味着它们共享一些通用的按钮行为和特性，
            例如onPressed回调、child属性等。然而，它们分别通过style属性提供了不同的ButtonStyle，
            以控制按钮的外观和样式。你可以使用style属性来自定义这些按钮的外观，包括背景颜色、文本样式、边框样式等。*/
          //RaisedButton()
          //FlatButton()
          ElevatedButton(onPressed: () {}, child: const Text('凸起按钮')),
          ElevatedButton(
            onPressed: () {},
            child: const Text('凸起按钮-InkSplash.splashFactory'),
            style: ElevatedButton.styleFrom(
              splashFactory: InkSplash.splashFactory,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('凸起按钮-InkRipple.splashFactory'),
            style: ElevatedButton.styleFrom(
              //splashFactory: InkHighlight.splashFactory,
              splashFactory: InkRipple.splashFactory,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('凸起按钮-InkSparkle.splashFactory'),
            style: ElevatedButton.styleFrom(
              splashFactory: InkSparkle.splashFactory,
            ),
          ),
          //凸起按钮也是可以带线框的
          ElevatedButton(
            onPressed: () {},
            child: const Text('凸起按钮-带圆角和线框-NoSplash.splashFactory'),
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              backgroundColor: Colors.red,
              side: const BorderSide(width: 5, color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            // style: ButtonStyle(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(100)),
            // ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('凸起按钮-带圆角'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
          ),

          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc_sharp),
              label: Text('凸起按钮也有icon方法创建实例')),
          TextButton(onPressed: () {}, child: const Text('扁平按钮')),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text(
              '扁平按钮-带样式',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text(
              '扁平按钮-带样式',
              // style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text('带icon和label的扁平按钮')),
          TextButton(
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: Icon(Icons.abc_sharp),
                  height: 50,
                ),
                SizedBox(
                  child: Text(
                      'icon text上下布局,\n并且可以通过st\nyle加边框\n跟outlineButt\non边框一样'),
                )
              ],
            ),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              //surfaceTintColor: Colors.red,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('使用elevation属性也可以让扁平按钮变成凸起按钮,按下效果不会有凸起按钮的效果'),
            style: TextButton.styleFrom(
              //primary: Colors.blue, // 按钮文本颜色
              foregroundColor: Colors.blue,
              backgroundColor: Colors.grey[200], // 按钮背景颜色
              // onSurface: Colors.red, // 按钮被按下时的颜色
              surfaceTintColor: Colors.red,
              elevation: 3, //使用elevation属性也可以让扁平按钮变成凸起按钮
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('让突起按钮使用elevation变成扁平按钮，按下效果还是会有凸起的效果'),
            style: ElevatedButton.styleFrom(elevation: 0),
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Icon(Icons.abc_sharp)),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('带icon和label的扁平按钮')),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('文本1'),
                  Text('文本1'),
                  Text('文本1'),
                  Text('文本1'),
                  Column(
                    children: [
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                    ],
                  )
                ],
              )),
          //icon和text是一个左右布局
          TextButton.icon(
              onPressed: () {},
              icon: Column(
                children: [
                  const Icon(Icons.add),
                  Text('icon text'),
                  Text('icon text'),
                  Text('icon text'),
                ],
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('文本1'),
                  Text('文本1'),
                  Text('文本1'),
                  Text('文本1'),
                  Column(
                    children: [
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                      Text('文本2'),
                    ],
                  )
                ],
              )),

          OutlinedButton(onPressed: () {}, child: const Text('线框按钮')),
          OutlinedButtonTheme(
            data: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue), // 设置按钮边框颜色
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0), // 设置按钮内边距
              ),
            ),
            child: OutlinedButton(
                onPressed: () {},
                child: const Text('线框按钮--OutlinedButtonTheme')),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(color: Colors.blue),
              side: const BorderSide(
                  width: 5,
                  color: Colors.black,
                  strokeAlign: StrokeAlign.outside),
              shape: RoundedRectangleBorder(
                //这里的side不会读取，不管外层是否传递了side
                side: const BorderSide(
                    width: 5,
                    color: Colors.black,
                    strokeAlign: StrokeAlign.outside),
                //radius有效果
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('线框按钮-带样式--shape'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              // backgroundColor: Colors.blue,
              // foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.blue),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text('线框按钮-带样式'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              // backgroundColor: Colors.blue,
              // foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.blue),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text('线框按钮-带样式'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              // backgroundColor: Colors.blue,
              // foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.blue),
              shape: const ContinuousRectangleBorder(),
            ),
            child: const Text('线框按钮-带样式'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              // backgroundColor: Colors.blue,
              // foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.blue),
              shape: const StadiumBorder(),
            ),
            child: const Text('线框按钮-带样式'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              // backgroundColor: Colors.blue,
              // foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.blue),
              shape: const CircleBorder(),
            ),
            child: const Text('线框按钮-带样式'),
          ),
          OutlinedButton(onPressed: () {}, child: const Icon(Icons.arrow_back)),
          BottomNavigationBar(
              iconSize: 35, //图标大小 35
              fixedColor: Colors.green, //图片颜色绿色
              type: BottomNavigationBarType.fixed, //item 固定显示
              items: const [
                //设置了 3 个 子 item
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "分类"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
              ]),
        ],
      ),
    );
  }

  _testIconBtn() {
    return Row(
      children: [
        BackButton(
          onPressed: () {},
        ),
        const BackButton(),
        CloseButton(
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          icon: const BackButtonIcon(),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_rounded),
          splashRadius: 20,
        ),
      ],
    );
  }

  _testFoucsBtn() {
    return MyButtonWidget();
  }

  _testSemantics() {
    return Semantics(
      button: true,
      enabled: true,
      onTap: () {
        // 按钮点击事件
      },
      child: ElevatedButton(
        onPressed: () {
          // 按钮点击事件
        },
        child: Text('Click me-_testSemantics'),
      ),
    );
  }

  String getStr(String Function(String a) getStr1) {
    String result = getStr1('123');
    return result;
  }

  void aa() {
    var r = getStr((a) => a);
    print(r);
  }
}

class MyButtonWidget extends StatefulWidget {
  @override
  _MyButtonWidgetState createState() => _MyButtonWidgetState();
}

class _MyButtonWidgetState extends State<MyButtonWidget> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleButtonTap() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus(); // 失去焦点
    } else {
      _focusNode.requestFocus(); // 获取焦点
    }
  }

  void _onHover(bool hover) {
    if (hover) {
      _focusNode.requestFocus(); // 获取焦点
    } else {
      _focusNode.unfocus(); // 失去焦点
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: ElevatedButton(
        onPressed: () {
          //_handleButtonTap();
        },
        onHover: (bool hover) {
          _onHover(hover);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(_hasFocus ? 20.0 : 15.0),
          backgroundColor: _hasFocus ? Colors.blue : Colors.green,
        ),
        child: Text('Click me'),
      ),
    );
  }
}

//T? resolve<T>(MaterialStateProperty<T>? Function(ButtonStyle? style) getProperty) {

//effectiveValue方法：参数是一个函数 getProperty
// T? effectiveValue<T>(T? Function(ButtonStyle? style) getProperty) {
//   // final T? widgetValue  = getProperty(widgetStyle);
//   // final T? themeValue   = getProperty(themeStyle);
//   // final T? defaultValue = getProperty(defaultStyle);
//   // return widgetValue ?? themeValue ?? defaultValue;
// }
// 参数是一个函数getProperty
// T? resolve<T>(MaterialStateProperty<T>? Function(ButtonStyle? style) getProperty) {
//调getProperty 在包一层函数effectiveValue
//   return effectiveValue(
//         (ButtonStyle? style) {
//       return getProperty(style)?.resolve(statesController.value);
//     },
//   );
// }
