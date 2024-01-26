import 'package:flutter/material.dart';
import 'package:test_flutter_plugin/message.dart';

class TestPigeon extends StatefulWidget {
  const TestPigeon({super.key});

  @override
  State<TestPigeon> createState() => _TestPigeonState();
}

class _TestPigeonState extends State<TestPigeon> {
  String? host;
  String? brokerId;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    brokerId = await AppNativeApi().getBrokerId();
    setState(() {});

    host = await AppNativeApi().getHost();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('$brokerId'),
          Text('$host'),
        ],
      ),
    );
  }
}
