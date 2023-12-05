import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestDebugData extends StatefulWidget {
  @override
  State<TestDebugData> createState() => _TestDebugDataState();
}

class _TestDebugDataState extends State<TestDebugData> {
  @FairProps()
  var data;

  var debug;

  onLoad() {
    debug = data['debug'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Sugar.ifEqualBool(debug,
                trueValue: () => const Text('debug'),
                falseValue: () => const Text('release')),
          ),
        ));
  }
}
