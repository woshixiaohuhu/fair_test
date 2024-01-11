import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestFuture extends StatefulWidget {
  const TestFuture({super.key});

  @override
  State<TestFuture> createState() => _TestFutureState();
}

class _TestFutureState extends State<TestFuture> {
  String? result;

  /*

     onLoad: async function onLoad() {
                    const __thiz__ = this;
                    with(__thiz__) {
                        result = '100';
                        await Future.delayed(Duration({
                            seconds: 1
                        }));
                        result = '300';
                        setState('#FairKey#', function dummy() {});
                    }
                },




  result: ReferenceError: Can't find variable: Future

column: 616

line: 1

message: "Can't find variable: Future"

stack: "@↵asyncFunctionResume@[native code]↵onLoad@↵_invokeMethod@↵invokeJSFunc@"

“ReferenceError”原型

status: "rejected"*/
  Future<void> onLoad() async {
    result = '100';
    await Future.delayed(Duration(seconds: 1));
    result = '300';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(result ?? ''),
      ),
    );
  }
}
