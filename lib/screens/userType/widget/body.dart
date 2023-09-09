import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bleslive/screens/dashboard/dashboard.dart';
import 'package:bleslive/screens/signin/signin.dart';
import 'package:bleslive/screens/userType/widget/widgets.dart';
import 'package:bleslive/utils/colors.dart';

class UserTypeBody extends StatefulWidget {
  const UserTypeBody({super.key});

  @override
  State<UserTypeBody> createState() => _UserTypeBodyState();
}

class _UserTypeBodyState extends State<UserTypeBody> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, left: 25),
            child: SvgPicture.asset('assets/images/logo.svg',
                height: 40, semanticsLabel: 'Blesket'),
          ),
          Positioned(
            top: 150,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  buildBaslik(title: "Welcome to blesket", context: context),
                  buildBaslik2(
                      title: "Choose on how you wish to login",
                      context: context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Signin.route);
                          AnimatedSnackBar.material(
                            'Welcome streamer!',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition: MobileSnackBarPosition
                                .bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition
                                .topRight, // Position of snackbar on desktop devices
                          ).show(context);
                          print("Welcome Streamer");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff284D19),
                          ),
                          width: (screenwidth - 60) * 0.5,
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12, bottom: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                      'assets/images/VideoCameraOutlined.svg',
                                      height: 30,
                                      semanticsLabel: 'Blesket'),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                textAlign: TextAlign.start,
                                'Streamer',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xffFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          AnimatedSnackBar.material(
                            "Oops! Buyer's page coming soon!",
                            type: AnimatedSnackBarType.info,
                            mobileSnackBarPosition: MobileSnackBarPosition
                                .bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition
                                .topRight, // Position of snackbar on desktop devices
                          ).show(context);
                          print("Coming soon!");
                        },
                        child: Container(
                          width: (screenwidth - 60) * 0.5,
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12, bottom: 21),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffE6FA81),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                      'assets/images/shop.svg',
                                      height: 30,
                                      semanticsLabel: 'Blesket'),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.start,
                                'Buyer',
                                style: const TextStyle(
                                    fontSize: 18, color: Color(0xff000000)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
