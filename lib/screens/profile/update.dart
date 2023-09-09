import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:flutter/gestures.dart'; 
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:bleslive/screens/profile/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: whiteshade,
              ),
              // const TopSginin(),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.03,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteshade,

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [



                      Row(
                        children: [
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: Profile(),pageTransitionAnimation:PageTransitionAnimation.scale);
                                    },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: blackshade,
                                    size: 26,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Update profile",
                                  style: TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.w500,
                                      color: blackshade),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width,
                        child: Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Card(
                                    margin:
                                    const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                                    child:  ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Color(0xFF3B7425),
                                      ),
                                      title: Text(
                                        'Avatar',
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w500),
                                      ),
                                      trailing: Text(
                                        'Upload photo',
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                              ],
                            )),
                      ),

                      const SizedBox(
                        height: 0,
                      ),


                      InputField(headerText: " Full Name", hintTexti: "Joe Doe"),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(headerText: " Bio", hintTexti: "Product Promoter"),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child:  Text.rich(
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 19),
                                  children: [
                                    TextSpan(
                                        text: " Phone number",
                                        style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                                  ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child:  IntlPhoneField(
                              decoration: InputDecoration(
                                labelText: ' 700 000 000',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'KE',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            //IntrinsicHeight
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      InputField(headerText: " Email Address", hintTexti: "Joe.doe@gmail.com"),
                      const SizedBox(
                        height: 10,
                      ),


                      const SizedBox(
                        height: 40,
                      ),

                      InkWell(
                        onTap: () {
                          AnimatedSnackBar.material(
                            'Instructions Sent',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition: MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
                          ).show(context);
                          PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: Profile(),pageTransitionAnimation:PageTransitionAnimation.scale);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: greenshade,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                          child: Center(
                            child: Text(
                              "Update Profile",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: whiteshade),
                            ),
                          ),
                        ),

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



// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputField({Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child:
          // Text(
          //   "",
          //   style: const TextStyle(
          //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          // ),
          Text.rich(
            TextSpan(
                text: "*",
                style: TextStyle(
                    color: Colors.red, fontSize: 19),
                children: [
                  TextSpan(
                      text: headerText,
                      style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                ]),
          ),

        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: grayshade.withOpacity(0.1),
              border: Border.all(
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
          //IntrinsicHeight

        ),
      ],
    );
  }
}
