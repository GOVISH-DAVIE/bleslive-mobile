import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/archieves/archieves.dart';
import 'package:bleslive/screens/dashboard/dashboard.dart';
import 'package:bleslive/screens/profile/profile.dart'; 
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart'; 


class Dashboard extends StatefulWidget {
  static String  route = 'dashboard';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _NavBarState();
}

class _NavBarState extends State<Dashboard> {


  PersistentTabController? _controller;
  int? selectedIndex;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    _controller = PersistentTabController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar:  AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.amberAccent,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Builder(
            builder: (context) {
              return InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Icon(Icons.notifications_none_outlined,
                        color: Colors.grey),
                  ));
            },
          )
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        navBarHeight: kSizeBottomNavigationBarHeight,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: kColorBNBBackground,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.once,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 100),
          curve: Curves.decelerate,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: false,
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 400),
        ),
        navBarStyle: NavBarStyle.style13,
        onItemSelected: (final index) {
          setState(() {
            _controller?.index = index; // THIS IS CRITICAL!! Don't miss it!
            if (index == 1) {}
          });
        },
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
       Dashbord(),
       Archieves(),
       Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: kSizeBottomNavigationBarIconHeight,
              child: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Color(0xff3B7425),
                    size: 35,
                  ),
                  Text("Home", style: const TextStyle(fontSize: 20, color: Color(0xff4B5D74), fontWeight:FontWeight.w700 )),
                ],
              ),
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            SizedBox(
              height: kSizeBottomNavigationBarIconHeight,
              child: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Color(0xff3B7425),
                    size: 30,
                  ),
                  Text("Home", style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 )),
                ],
              ),
            ),
          ],
        ),
        title: ('Home'),
        activeColorPrimary: kColorBNBActiveTitleColor,
        inactiveColorPrimary: kColorBNBDeactiveTitleColor,
      ),



      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: kSizeBottomNavigationBarIconHeight,
              child: Column(
                children: [
                  Icon(
                    Icons.video_call_rounded,
                    color: Color(0xff3B7425),
                    size: 35,
                  ),
                  Text("Archieves", style: const TextStyle(fontSize: 20, color: Color(0xff4B5D74), fontWeight:FontWeight.w700 )),
                ],
              ),
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            SizedBox(
              height: kSizeBottomNavigationBarIconHeight,
              child: Column(
                children: [
                  Icon(
                    Icons.video_call_rounded,
                    color: Color(0xff3B7425),
                    size: 30,
                  ),
                  Text("Archieves", style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 )),
                ],
              ),
            ),
          ],
        ),
        title: ('Archieves'),
        activeColorPrimary: kColorBNBActiveTitleColor,
        inactiveColorPrimary: kColorBNBDeactiveTitleColor,
      ),


      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: kSizeBottomNavigationBarIconHeight,
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xff3B7425),
                    size: 35,
                  ),
                  Text("Profile", style: const TextStyle(fontSize: 20, color: Color(0xff4B5D74), fontWeight:FontWeight.w700 )),
                ],
              ),
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            SizedBox(
              height: kSizeBottomNavigationBarIconHeight,
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xff3B7425),
                    size: 30,
                  ),
                  Text("Profile", style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 )),
                ],
              ),
            ),
          ],
        ),
        title: ('Profile'),
        activeColorPrimary: kColorBNBActiveTitleColor,
        inactiveColorPrimary: kColorBNBDeactiveTitleColor,
      ),
    ];
  }
}
