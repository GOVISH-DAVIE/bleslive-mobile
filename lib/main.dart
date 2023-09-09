import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bleslive/core/routes.dart';
import 'package:bleslive/screens/splashscreen/splash.dart'; 
import 'package:camera/camera.dart';
import 'package:bleslive/utils/theme.dart';

List<CameraDescription> cameras = [];


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(const MyApp());
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
