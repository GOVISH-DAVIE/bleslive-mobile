import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:bleslive/screens/navBar/navbar.dart';
import 'package:bleslive/screens/signin/signin.dart'; 
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; 


class SignUp extends StatelessWidget {
  static String route = 'signup';
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Text(
                      "Create account",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: blackshade),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height:55,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: grayshade),
                    ),
                  ),
                ],
              ),

              InputField(headerText: " Full Name", hintTexti: "Enter full name"),
              const SizedBox(
                height: 20,
              ),
              InputField(headerText: " Email Address", hintTexti: "Enter email address"),
              const SizedBox(
                height: 20,
              ),
              // InputField(headerText: " Phone Number", hintTexti: "700 000 000"),


            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: const Text.rich(
                TextSpan(
                    text: "*",
                    style: TextStyle(
                        color: Colors.red, fontSize: 19),
                    children: [
                      TextSpan(
                          text: " Phone Number",
                          style: TextStyle( color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500)),
                    ]),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child:  IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: ' Phone Number',
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
                height: 8,
              ),
              InputFieldPassword(
                  headerText: "Password",
                  hintTexti: "Password"),
              const SizedBox(
                height: 20,
              ),
              InputFieldPassword(
                  headerText: "Confirm Password",
                  hintTexti: "Confirm Password"),

              const SizedBox(
                height: 10,
              ),
              const CheckerBox(),

              const SizedBox(
                height: 10,
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
                            text: "Already have an account, ",
                            style: TextStyle(
                                color: grayshade.withOpacity(0.8), fontSize: 20),
                            children: [
                              TextSpan(
                                  text: "Login ",
                                  style: TextStyle(color: greenshade, fontSize: 20, ),
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
                height: 40,
              ),

              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, Dashboard.route);
                  AnimatedSnackBar.material(
                    'Registration Success!',
                    type: AnimatedSnackBarType.success,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
                    desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
                  ).show(context);
                  print("Sign up click");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: greenshade,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "Sign up",
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
        ],
      )),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade, // color of tick Mark
              activeColor: greenshade,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
                text: "I agree with ",
                style:
                    TextStyle(color: grayshade.withOpacity(0.8), fontSize: 16),
                children: [
                  TextSpan(
                      text: "Terms ",
                      style: TextStyle(color: blackshade, fontSize: 16)),
                  const TextSpan(text: "and "),
                  TextSpan(
                      text: "Conditions",
                      style: TextStyle(color: blackshade, fontSize: 16)),
                ]),
          ),
        ],
      ),
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
          child:  Text.rich(
            TextSpan(
                text: "*",
                style: TextStyle(
                    color: Colors.red, fontSize: 19),
                children: [
                  TextSpan(
                      text: headerText,
                      style:Theme.of(context).textTheme.titleMedium),
                ]),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            
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

class TopSginup extends StatelessWidget {
  const TopSginup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_sharp,
            color: whiteshade,
            size: 40,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Sign up",
            style: TextStyle(color: whiteshade, fontSize: 25),
          )
        ],
      ),
    );
  }
}
