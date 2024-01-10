import 'package:example/ui/some_widget.dart';
import 'package:fair/fair.dart';

import 'package:flutter/material.dart';
import 'package:fair/src/type.dart';

class TestGeneraterModule extends GeneratedModule {
  static const double strokeAlignInside = -1.0;

  @override
  Map<String, dynamic> components() {
    return {
      'Key': (props) => Key(
            pa0(props),
          ),
      'SomeWidget': (props) => SomeWidget(
            //block 是一个参数的可以支持， block1对应的是一个这样的闭包方法
            // ([props]) =>  _functions?['runtimeInvokeMethod']?.call(funcName, false, props);
            block1: props['block1'],
            //不支持2个参数
            //type '([dynamic]) => dynamic' is not a subtype of type '((String, String) => void)?'
            block2: props['block2'],
          ),
      'AssetImage': (props) => AssetImage(
            // pa0(props),
            props['pa'][0],
          ),
      'BorderSide': (props) => BorderSide(
            color: props['color'] ?? const Color(0xFF000000),
            width: props['width'] ?? 1.0,
            style: props['style'] ?? BorderStyle.solid,
            strokeAlign: props['strokeAlign'] ?? StrokeAlign.inside,
          ),
      'OutlineInputBorder': (props) => OutlineInputBorder(
            borderRadius: props['borderRadius'] ??
                const BorderRadius.all(Radius.circular(4.0)),
            borderSide: props['borderSide'] ?? const BorderSide(),
            gapPadding: props['gapPadding'] ?? 4.0,
          ),
      'UnderlineInputBorder': (props) => UnderlineInputBorder(
            borderRadius: props['borderRadius'] ??
                const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
            borderSide: props['borderSide'] ?? const BorderSide(),
          ),
    };
  }

  @override
  Map<String, bool> mapping() {
    return const {
      'BorderSide': false,
      'Key': false,
      'OutlineInputBorder': true,
      'UnderlineInputBorder': false,
    };
  }
}
