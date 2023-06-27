import 'package:bleslive/screens/cart/cart.dart';
import 'package:bleslive/screens/components/homescreens.dart';
import 'package:bleslive/screens/components/messagePanel.dart';
import 'package:bleslive/screens/components/productPanel.dart';
import 'package:bleslive/screens/components/productcard.dart';
import 'package:bleslive/utils/color.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum Chatproduct { Chat, Product }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var mm = Chatproduct.Product;

  var screens = [
    Home(type: Chatproduct.Product),
    CartScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bleslive "),
      ),
      floatingActionButton: _selectedIndex != 0
          ? null
          : FloatingActionButton(
              onPressed: () {
                if (mm == Chatproduct.Product) {
                  setState(() {
                    mm = Chatproduct.Chat;
                  });
                } else {
                  setState(() {
                    mm = Chatproduct.Product;
                  });
                }
              },
              child: mm == Chatproduct.Chat
                  ? const Icon(Icons.chat)
                  : const Icon(Icons.shop),
            ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: themePrimary,
        unselectedItemColor: textThemeGrey,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home.svg',
                color: _selectedIndex == 0 ? themePrimary : themeGrey,
                semanticsLabel: 'Acme Logo'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/cart.svg',
                color: _selectedIndex == 1 ? themePrimary : themeGrey,
                semanticsLabel: 'Acme Logo'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/history.svg',
                color: _selectedIndex == 2 ? themePrimary : themeGrey,
                semanticsLabel: 'Acme Logo'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg',
                color: _selectedIndex == 3 ? themePrimary : themeGrey,
                semanticsLabel: 'Acme Logo'),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: screens[_selectedIndex],
    );
  }
}
