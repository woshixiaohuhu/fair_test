import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestImagePage extends StatefulWidget {
  const TestImagePage({super.key});

  @override
  State<TestImagePage> createState() => _TestImagePageState();
}

class _TestImagePageState extends State<TestImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const ListTile(
              title: Text('123'),
            ),
            Image.asset('assets/images/11.png'),
            Image.network(
                'https://img0.baidu.com/it/u=3859522405,494432625&fm=253&fmt=auto&app=120&f=JPEG?w=1000&h=500'),
          ],
        ),
      ),
    );
  }
}
