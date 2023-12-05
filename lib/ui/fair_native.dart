import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

class FairNativePage extends StatelessWidget {
  const FairNativePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FairWidget(
        name: 'lib_ui_test_list_view',
        path: 'assets/fair/lib_ui_test_list_view.fair.json',
      ),
    );
  }
}
