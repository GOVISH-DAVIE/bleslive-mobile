import 'package:bleslive/core/locator.dart';
import 'package:bleslive/state/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  
  ChangeNotifierProvider(create: (context) => locator.get<AuthProvider>()),
];