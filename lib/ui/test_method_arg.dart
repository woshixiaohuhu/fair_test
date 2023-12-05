import 'package:fair/fair.dart';
import 'package:fair_extension/toast/fair_toast_plugin.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestMethodArg extends StatelessWidget {
  TestMethodArg();

  var index1 = 1;
  var index2;

  void onLoad() {
    index2 = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Sugar.listBuilder(
                shrinkWrap: true,
                //itemBuilder: (context, ortherOrg) {
                //fair对index做了特殊处理。只能使用index命名 不支持其他名字命名
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                        //参数名字只可以是index，其他参数则会变成参数name自身
                        //"onPressed": "@(click2(^(ortherOrg)))"
                        //^(ortherOrg)这个参数先通过PropValueExpression实现的 binding?.bindRuntimeValueOf(expression ?? '');在js运行时没有定义所以是null
                        //然后通过ValueExpression实现的 binding?.bindDataOf(pre ?? '') ??调用纯dart也是从_values，data，_functions中dart都没有内置，所以也是null
                        //最后返回text自身： return W<dynamic>(text, false);即字符串“^(ortherOrg)”
                        child: const Text('传参数'),
                        //onPressed: () => click2(ortherOrg)),
                        //int类型传递
                        onPressed: () => click2(index)),
                  );
                },
                itemCount: 3),
            ElevatedButton(child: const Text('1'), onPressed: () => click()),
            ElevatedButton(child: const Text('a'), onPressed: () => click2(1)),
            //字符串类型传递
            ElevatedButton(child: const Text('b'), onPressed: () => click3(3)),

            ///int类型传递
            ElevatedButton(
                child: const Text('c'), onPressed: () => click3(index1)),
            ElevatedButton(
                child: const Text('click4'), onPressed: () => click4('click4')),
            ElevatedButton(child: const Text('2'), onPressed: () => click()),
            ElevatedButton(
                child: const Text('3'),
                onPressed: () {
                  click();
                }),
          ],
        ),
      ),
    );
  }

  void click() {}

/*    参数可能是int可能是字符类型   click2: function click2(index) {
                    const __thiz__ = this;
                    const __arg_ctx__ = {
                        index,
                    };
                    with(__thiz__) {
                        with(__arg_ctx__) {
                            print(index);
                        }
                    }
                },*/
  void click2(int index) {
    print(index);
    FairToast.show(msg: '$index');
  }

  void click3(int otherArg) {
    print(otherArg);
    /*  FairToast.show({
                                msg: `${otherArg}`
                            });*/
    FairToast.show(msg: '$otherArg');
  }

  void click4(String msg) {
    FairToast.show(msg: msg);
  }
}
