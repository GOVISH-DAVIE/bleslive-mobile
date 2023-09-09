import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/signin/signin.dart';
import 'package:bleslive/screens/userType/widget/body.dart';

class UserType extends StatefulWidget {
  static String route = 'usertype';
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
   return const UserTypeBody();
  }
}
