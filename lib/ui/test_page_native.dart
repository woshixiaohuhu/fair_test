import 'package:flutter/material.dart';

class TestNativePage extends StatefulWidget {
  TestNativePage();

  @override
  State<TestNativePage> createState() => _TestNativePageState();
}

class _TestNativePageState extends State<TestNativePage> {
  String? tag;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      tag = _getParams(context, 'tag').toString();
      setState(() {});
    });
  }

  dynamic _getParams(BuildContext context, String key) {
    var arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is Map) {
      return arg[key];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Text('获取到的参数:$tag'),
        ),
      ),
    );
  }
}
