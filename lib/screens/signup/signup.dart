import 'package:bleslive/screens/login/components/loginbody.dart';
import 'package:bleslive/screens/signup/components/body.dart';
import 'package:bleslive/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Signup extends StatelessWidget {
  static String route = 'signup';
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: SignupBody());
  }
}
