import 'package:flutter/material.dart';
import 'package:bleslive/utils/colors.dart';

class BlesketButton extends TextButton {
  final Function callback;
  final ButtonStyle type;
  // @override
  @override
  final Widget child;
  BlesketButton({
    super.key,
    required this.callback,
    required this.type,
    required this.child,
  }) : super(onPressed: () => callback(), style: type, child: child,);
}

Container defaultButton(
    {required Function callBack,
    required String title,
    required double height,
    required double width,
    Color? backgroundColor}) {
  return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(backgroundColor ?? themeGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: themeGrey)))),
        child: Text(title),
        onPressed: () => callBack(),
      ));
}
