 
import 'package:bleslive/screens/dashboard/dashboard.dart';
import 'package:bleslive/screens/login/login.dart';
import 'package:bleslive/screens/signup/signup.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Login.route: (context) => const Login(),
  Dashboard.route: (context) => const Dashboard(),
  Signup.route:(context)=> const Signup()

};
