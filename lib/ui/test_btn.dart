import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _testIconBtn(),
            //Flutter 2.x 的版本，你会发现之前的一些按钮 Widget 被废弃了：
            /*
              Flutter 1.x 中的按钮 WidgetFlutter 2.x 中的按钮
               RaisedButton 凸起按钮 ElevatedButton 凸起按钮
               FlatButton 扁平按钮 TextButton 扁平按钮
               OutlinedButton 线框按钮 OutlinedButton 线框按钮
            */

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
            ElevatedButton(
              onPressed: () {},
              child: const Text('凸起按钮-带圆角-NoSplash.splashFactory'),
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: Colors.red,
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
              child: Text('让突起按钮使用elevation变成扁平按钮，按下效果还是会保持凸起的效果'),
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
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 5,
                      color: Colors.black,
                      strokeAlign: StrokeAlign.outside),
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
            OutlinedButton(
                onPressed: () {}, child: const Icon(Icons.arrow_back)),
            BottomNavigationBar(
                iconSize: 35, //图标大小 35
                fixedColor: Colors.green, //图片颜色绿色
                type: BottomNavigationBarType.fixed, //item 固定显示
                items: const [
                  //设置了 3 个 子 item
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: "分类"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "设置")
                ]),
          ],
        ),
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
}
