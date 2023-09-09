import 'package:bleslive/core/locator.dart';
import 'package:bleslive/core/provider.dart';
import 'package:flutter/material.dart'; 
import 'package:bleslive/core/routes.dart';
import 'package:bleslive/screens/splashscreen/splash.dart'; 
import 'package:camera/camera.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:provider/provider.dart';

List<CameraDescription> cameras = [];


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) { 
  } 
  setupLocator();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blesket App',
      theme: themeData(),
      routes: routes,
      initialRoute: SplashScreen.route, 
    );
  }
}
