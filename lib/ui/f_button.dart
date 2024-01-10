import 'package:flutter/material.dart';

class FButton4 extends StatelessWidget {
  String title;
  Color? titleColor;
  Color? backgroundColor;

  double? fontSize;
  Color? borderColor;
  double? borderWidth;
  final double? radius; //圆角
  final bool? noSplash; //按下水波纹效果
  EdgeInsets? padding;

  double? elevation; //大于0 凸起
  Color? shadowColor; //投影颜色
  final VoidCallback? onPressed;

  FButton4({
    super.key,
    required this.title,
    this.titleColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.radius = 0,
    this.fontSize,
    this.borderColor = const Color(0xFF000000),
    this.borderWidth,
    this.noSplash = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ((borderWidth ?? 0) > 0) || (elevation ?? 0) <= 0
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: backgroundColor,
              splashFactory: noSplash == true
                  ? NoSplash.splashFactory
                  : InkRipple.splashFactory,
              padding: padding,
              side: BorderSide(
                  color: borderColor ?? const Color(0xFF000000),
                  width: borderWidth ?? 0),
              shape: (radius ?? 0) > 0
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                      Radius.circular(radius!),
                    ))
                  : null,
            ),
            child: Text(
              title,
              style: TextStyle(color: titleColor, fontSize: fontSize),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              splashFactory: noSplash == true
                  ? NoSplash.splashFactory
                  : InkRipple.splashFactory,
              padding: padding,
              side: ((borderWidth ?? 0) > 0)
                  ? BorderSide(
                      color: borderColor ?? const Color(0xFF000000),
                      width: borderWidth!)
                  : null,
              shape: (radius ?? 0) > 0
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                      Radius.circular(radius!),
                    ))
                  : null,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: fontSize,
              ),
            ),
          );
  }
}

class FButton3 extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? disabledForegroundColor;
  final Color? disabledBackgroundColor;
  final TextStyle? textStyle;

  final bool? noSplash; //按下水波纹效果
  final double? radius; //圆角
  final Color? borderColor; //边框颜色
  final double? borderWidth; //边框宽度

  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final Size? fixedSize;
  final Size? maximumSize;

  FButton3({
    super.key,
    this.onPressed,
    required this.child,
    this.foregroundColor,
    this.backgroundColor,
    this.disabledForegroundColor,
    this.disabledBackgroundColor,
    this.elevation,
    this.noSplash = true,
    this.radius,
    this.borderColor,
    this.borderWidth,
    this.textStyle,
    this.padding,
    this.minimumSize,
    this.fixedSize,
    this.maximumSize,
  });

  @override
  Widget build(BuildContext context) {
    if ((elevation ?? 0) > 0) {
      //凸起按钮
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          textStyle: textStyle,
          elevation: elevation,
          side: BorderSide(
              width: borderWidth ?? 5, color: borderColor ?? Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 4)),
          splashFactory: noSplash == true ? NoSplash.splashFactory : null,
          padding: padding,
          minimumSize: minimumSize,
          fixedSize: fixedSize,
          maximumSize: maximumSize,
        ),
        child: child,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          textStyle: textStyle,
          elevation: elevation,
          side: BorderSide(
              width: borderWidth ?? 5, color: borderColor ?? Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 4)),
          splashFactory: noSplash == true ? NoSplash.splashFactory : null,
          padding: padding,
          minimumSize: minimumSize,
          fixedSize: fixedSize,
          maximumSize: maximumSize,
        ),
        child: child,
      );
    }
  }
}

class FButton extends ElevatedButton {
  //写法1:
  // const FButton(
  //     {Key? key, required Widget child, required VoidCallback? pressed})
  //     : super(
  //         key: key,
  //         child: child,
  //         onPressed: pressed,
  //       );
  //写法2:
  const FButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  });

  factory FButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget icon,
    required Widget label,
  }) = _ElevatedButtonWithIcon1;
}

class _ElevatedButtonWithIcon1 extends FButton {
  _ElevatedButtonWithIcon1({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget icon,
    required Widget label,
  })  : assert(icon != null),
        assert(label != null),
        super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _ElevatedButtonWithIconChild1(icon: icon, label: label),
        );
}

class _ElevatedButtonWithIconChild1 extends StatelessWidget {
  const _ElevatedButtonWithIconChild1(
      {required this.label, required this.icon});

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    // final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: 1), Flexible(child: label)],
    );
  }
}

class FButton2 extends ButtonStyleButton {
  final String? otherTag;

  //写法1:
  //This requires the 'super-parameters' language feature to be enabled.
  const FButton2({
    super.key,
    /*只要调用this或者super就是在初始化*/
    //Fields can't be initialized in both the parameter list and the initializers.
    //this.otherTag = '123',
    //Fields can't be initialized in both the parameter list and the initializers.
    // this.otherTag,
    String? otherTag,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  }) : otherTag = otherTag ?? '123'; //冒号后面也可以初始化

  //写法2:
  // FButton2(
  //     {required VoidCallback? onPressed,
  //     required VoidCallback? onLongPress,
  //     required ValueChanged<bool>? onHover,
  //     required ValueChanged<bool>? onFocusChange,
  //     required ButtonStyle? style,
  //     required FocusNode? focusNode,
  //     required bool autofocus,
  //     required Clip clipBehavior,
  //     required Widget? child})
  //     : super(
  //           onPressed: onPressed,
  //           onLongPress: onLongPress,
  //           onHover: onHover,
  //           onFocusChange: onFocusChange,
  //           style: style,
  //           focusNode: focusNode,
  //           autofocus: autofocus,
  //           clipBehavior: clipBehavior,
  //           child: child);

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    // TODO: implement defaultStyleOf
    throw UnimplementedError();
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // TODO: implement themeStyleOf
    throw UnimplementedError();
  }
}
