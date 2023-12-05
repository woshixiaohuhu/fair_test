import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class TestInputDecoration extends StatelessWidget {
  TestInputDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(children: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              key: Key('123'),
              decoration: InputDecoration(
                prefixText: '￥',
                prefixStyle: TextStyle(fontSize: 24, color: Colors.red),
                hintText: '不得低于3000元',
                hintStyle: TextStyle(fontSize: 24, color: Colors.blue),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                prefixText: '￥',
                prefixStyle: TextStyle(fontSize: 24, color: Colors.red),
                hintText: '不得低于3000元',
                hintStyle: TextStyle(fontSize: 24, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
        ]),
      ),
    );
  }
}
