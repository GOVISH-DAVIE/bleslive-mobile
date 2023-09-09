import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart'; 
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/signin/signin.dart';

class reset extends StatelessWidget {

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
                                  "Update password",
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
                            height:70,
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            child: Text(
                              "Please enter a new password",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: grayshade),
                            ),
                          ),
                        ],
                      ),
                      // InputField(headerText: " Email Address",
                      //     hintTexti: "joe.doe@gmail.com",
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      InputFieldPassword(
                          headerText: "New Password",
                          hintTexti: "Enter New Password"),
                      const SizedBox(
                        height: 20,
                      ),
                      InputFieldPassword(
                          headerText: "Confirm New Password",
                          hintTexti: "Confirm New Password"),
                      const SizedBox(
                        height: 20,
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
                                        color: grayshade.withOpacity(0.8), fontSize: 17),
                                    children: [
                                      TextSpan(
                                          text: "Login Now",
                                          style: TextStyle(color: greenshade, fontSize: 17, ),
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
                        height: 30,
                      ),


                      InkWell(
                        onTap: () {
                          AnimatedSnackBar.material(
                            'Password Changed Successfully. Now Login!',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition: MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
                          ).show(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signin()));
                          print("Reset PWd click");

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
                              "Change Password",
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

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;

  InputFieldPassword(
      {Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

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
          Text.rich(
            TextSpan(
                text: "* ",
                style: TextStyle(
                    color: Colors.red, fontSize: 19),
                children: [
                  TextSpan(
                      text: widget.headerText,
                      style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                ]),
          ),

          // Text(
          //   widget.headerText,
          //   style: const TextStyle(
          //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          // ),
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
              obscureText: _visible,
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}
