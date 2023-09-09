
import 'package:flutter/material.dart';
import 'package:bleslive/screens/signin/signin.dart';
import 'package:bleslive/screens/signup/signup.dart';
import 'package:bleslive/screens/splashscreen/splash.dart';
import 'package:bleslive/screens/userType/userType.dart';

final Map<String, WidgetBuilder> routes ={
  SignUp.route :(context) =>const SignUp(),
  Signin.route :(context) =>const Signin(),
  SplashScreen.route:(context) => const SplashScreen(title: 'Blesket App'),
  UserType.route:(context) => const UserType(),

};