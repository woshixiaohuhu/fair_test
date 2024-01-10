import 'package:example/ui/some_widget.dart';
import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestSomeWidget extends StatelessWidget {
  const TestSomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SomeWidget(
                //支持1个参数
                block1: getBlock1,
              ),
              SomeWidget(
                block1: getBlock1,
                /*The following _TypeError was thrown while parsing widget of SomeWidget, Closure: (dynamic) => SomeWidget:
                type '([dynamic]) => dynamic' is not a subtype of type '((String, String) => void)?'
                  */
                /*不支持2个和2个以上参数*/
                block2: getBlock2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getBlock1(String str) {
    print('str=$str');
  }

/*The following _TypeError was thrown while parsing widget of SomeWidget, Closure: (dynamic) => SomeWidget:
type '([dynamic]) => dynamic' is not a subtype of type '((String, String) => void)?'
*/
  void getBlock2(String str, String str2) {
    print('str=$str,str2=$str2');
  }
}
