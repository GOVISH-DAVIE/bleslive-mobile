import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart'; 
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/password/reset.dart';
import 'package:bleslive/screens/signin/signin.dart';

class forgot extends StatelessWidget {
  // const forgot({super.key});

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
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Signin()));
                  print("Back to Sign In");
                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: blackshade,
                                    size: 26,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Forgot Password",
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
                      Row(
                        children: [
                          Container(
                            height:100,
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            child: Text(
                              "Please enter your email address associated with your account and we will instructions to reset your password via email.",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: grayshade),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(headerText: " Email Address", hintTexti: "Enter email address"),
                      const SizedBox(
                        height: 30,
                      ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: InkWell(
                              onTap: () {},
                              child: Text.rich(
                                TextSpan(
                                    text: "Remember your password? ",
                                    style: TextStyle(
                                        color: grayshade.withOpacity(0.8), fontSize: 18),
                                    children: [
                                      TextSpan(
                                          text: "Login Now",
                                          style: TextStyle(color: greenshade, fontSize: 18, ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Signin()));
                                              print("Login click");
                                            }),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),



                      const SizedBox(
                        height: 50,
                      ),

                      InkWell(
                        onTap: () {
                          AnimatedSnackBar.material(
                            'Instructions Sent',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition: MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
                          ).show(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => reset()));
                              print("Reset click");
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
                              "Send Instructions",
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
                      text: " Email Address",
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
