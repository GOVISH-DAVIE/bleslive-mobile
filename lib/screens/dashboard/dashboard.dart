import 'package:bleslive/main.dart';
import 'package:bleslive/screens/cart/cart.dart';
import 'package:bleslive/screens/components/homescreens.dart';
import 'package:bleslive/state/product.dart';
import 'package:bleslive/state/socket.dart';
import 'package:bleslive/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static String route = '/';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {



@override
void initState() { 
  super.initState();
  context.read<ProductController>()
  ..getProducts()
  ..getSessions(context: context)
  ;
 
}


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
    Home(),
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
