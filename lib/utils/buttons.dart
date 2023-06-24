
import 'package:flutter/material.dart';

class BlesLiveButton extends TextButton {
  final Function callback;
  final ButtonStyle type;
  // @override
  @override
  final Widget child;
  BlesLiveButton({
    super.key,
    required this.callback,
    required this.child,
    required this.type,
  }) : super(onPressed: () => callback(), child: child, style: type);
}
