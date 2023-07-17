import 'package:bleslive/core/locator.dart';
import 'package:bleslive/core/providers.dart';
import 'package:bleslive/core/router.dart';
import 'package:bleslive/screens/cart/cart.dart';
import 'package:bleslive/screens/components/homescreens.dart';
import 'package:bleslive/screens/components/messagePanel.dart';
import 'package:bleslive/screens/components/productPanel.dart';
import 'package:bleslive/screens/components/productcard.dart';
import 'package:bleslive/screens/login/login.dart';
import 'package:bleslive/utils/color.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum Chatproduct { Chat, Product }

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MultiProvider( providers: providers,  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bleslive ',
      theme: themeData(),
   
      initialRoute: Login.route,
      routes: routes,
        );
  }
}
 