import 'package:example/ui/fair_basic_info_plugin.dart';
import 'package:fair/fair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestListViewGetIndexTitle extends StatefulWidget {
  const TestListViewGetIndexTitle({super.key});

  @override
  State<TestListViewGetIndexTitle> createState() =>
      _TestListViewGetIndexTitleState();
}

class _TestListViewGetIndexTitleState extends State<TestListViewGetIndexTitle> {
  var issueTasks = [];

  var title1;
  var title2;
  var title3;
  var title4;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemBuilder: Sugar.indexedWidgetBuilder((context, index) {
    //     return Text(getTitle2(index));
    //   }),
    //   itemCount: issueTaskCount(),
    // );
    return Scaffold(
      appBar: AppBar(),
      body: Sugar.listBuilder(
        itemBuilder: (context, index) {
          return Text(
            getTitle3(index),
            style: const TextStyle(color: Colors.red),
          );
        },
        itemCount: issueTaskCount(),
      ),
    );
  }

  issueTaskCount() {}

  //js端执行      "%(getTitle(^(index)))"会立即返回
  /*        methodResult = func.apply(mClass, args); //如果这里是async方法方法会立即返回，因为这里没有await。
   不会因为方法里面await了，这里也能await    }
    let result = {
        pageName: pageName,
        result: {
            result: methodResult
        }
    };
    return JSON.stringify(result);*/
  getTitle(int index) async {
    String title = await FairBasicInfoPlugin().getTitle(index: index);
    print('title:$title');
    return title;
  }

  ///同步方法可以的
  getTitle2(int index) {
    String title = "同步方法可以的$index";
    print('title:$title');
    return title;
  }

  getTitle3(int index) async {
    FairBasicInfoPlugin().getTitle(index: index).then((value) {
      print('title:$value');
      setState(() {});
    });
    return '';
  }
}
