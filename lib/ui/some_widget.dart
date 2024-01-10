import 'package:flutter/cupertino.dart';

class SomeWidget extends StatefulWidget {
  final void Function(String str)? block1;
  final void Function(String str,String str2)? block2;
  //final void Function(String str,int index)? block3;

  const SomeWidget({Key? key, this.block1,this.block2}) : super(key: key);

  @override
  State<SomeWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.block1?.call('123');
          },
          child: Text('1个参数'),
        ),
        GestureDetector(
          onTap: () {
            widget.block2?.call('123','1234');
          },
          child: Text('2个参数'),
        ),
      ],
    );
  }
}
