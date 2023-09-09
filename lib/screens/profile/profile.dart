import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/profile/update.dart';
import 'package:bleslive/screens/signin/signin.dart'; 



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 80, left: 30, right: 20, bottom: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My profile",
                        style: TextStyle(
                          color: blackshade,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffDBDBDB),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffE9F2E6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'https://davee.co.ke/toa.jpg', // Replace with the actual image URL
                                width: 50, // Adjust the width as needed
                                height: 50, // Adjust the height as needed
                                fit: BoxFit
                                    .cover, // Adjust the image fit mode as needed
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                'Joe Doe',
                                style: const TextStyle(
                                    fontSize: 28, color: Color(0xff000000)),
                              ),
                              Text(
                                textAlign: TextAlign.start,
                                'Product promoter',
                                style: const TextStyle(
                                    fontSize: 18, color: Color(0xff7E848C)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const SizedBox(height: 10),
                          const SizedBox(height: 15),
                          const SizedBox(height: 10),
                          const SizedBox(height: 15),
                          const SizedBox(height: 10),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF2F2F2),
                              ),
                              width: (screenwidth - 60) * 0.5,
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 12, bottom: 21),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    textAlign: TextAlign.start,
                                    'Avg. users',
                                    style: const TextStyle(
                                        fontSize: 18, color: Color(0xff7E848C)),
                                  ),
                                  const SizedBox(height: 15),
                                  Text.rich(
                                    TextSpan(
                                        text: "210",
                                        style: TextStyle(
                                            color: Color(0xff241872),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                              text: " per session",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: (screenwidth - 60) * 0.5,
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 12, bottom: 21),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF2F2F2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    textAlign: TextAlign.start,
                                    'Avg. views',
                                    style: const TextStyle(
                                        fontSize: 18, color: Color(0xff7E848C)),
                                  ),
                                  const SizedBox(height: 15),
                                  Text.rich(
                                    TextSpan(
                                        text: "200",
                                        style: TextStyle(
                                            color: Color(0xff241872),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                              text: " per session",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF2F2F2),
                              ),
                              width: (screenwidth - 60) * 0.5,
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 12, bottom: 21),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    textAlign: TextAlign.start,
                                    'Avg. sales',
                                    style: const TextStyle(
                                        fontSize: 18, color: Color(0xff7E848C)),
                                  ),
                                  const SizedBox(height: 15),
                                  Text.rich(
                                    TextSpan(
                                        text: "20,000",
                                        style: TextStyle(
                                            color: Color(0xff241872),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                              text: " per session",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: (screenwidth - 60) * 0.5,
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 12, bottom: 21),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF2F2F2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    textAlign: TextAlign.start,
                                    'Avg. watch time',
                                    style: const TextStyle(
                                        fontSize: 18, color: Color(0xff7E848C)),
                                  ),
                                  const SizedBox(height: 15),
                                  Text.rich(
                                    TextSpan(
                                        text: "25 min",
                                        style: TextStyle(
                                            color: Color(0xff241872),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                              text: " per session",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500)),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "UPDATE",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color(0xFF3C3C43),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffDBDBDB),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProfile()));
                          print("Back to Sign In");
                        },
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: const ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Color(0xFF3B7425),
                            ),
                            title: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF3C3C43),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          AnimatedSnackBar.material(
                            'Coming soon!',
                            type: AnimatedSnackBarType.info,
                            mobileSnackBarPosition: MobileSnackBarPosition
                                .bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition
                                .topRight, // Position of snackbar on desktop devices
                          ).show(context);
                        },
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: const ListTile(
                            leading: Icon(
                              Icons.lock,
                              color: Color(0xFF3B7425),
                            ),
                            title: Text(
                              'Change Password',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF3C3C43),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signin()));
                          print("Back to Sign In");
                        },
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: const ListTile(
                            leading: Icon(
                              Icons.login_outlined,
                              color: Color(0xFF3B7425),
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF3C3C43),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
