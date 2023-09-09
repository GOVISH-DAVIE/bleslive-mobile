import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart'; 
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/signin/widgets/body.dart'; 
import 'package:bleslive/utils/colors.dart';
import 'package:bleslive/widgets/sizeconfig.dart';

class Signin extends StatelessWidget {
static String route = 'signin';
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return const SigninBody();
  }

 
}

 
// ignore: must_be_immutable 
 