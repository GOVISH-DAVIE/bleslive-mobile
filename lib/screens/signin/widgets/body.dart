import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/state/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:bleslive/screens/navBar/navbar.dart';
import 'package:bleslive/screens/password/forgot.dart';
import 'package:bleslive/screens/signup/signup.dart';
import 'package:bleslive/utils/colors.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:bleslive/widgets/formErrors.dart';
import 'package:provider/provider.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  bool isChecked = false;
  String? userName;
  String? password;
  final _formKey = GlobalKey<FormState>();

  bool visibility = true;
  bool remember = false;
  bool busy = false;
  bool error = false;
  final List<String> errors = [];
  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder:(context, authProvider, child) =>  Scaffold(
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: whiteshade,
              ),
              // const TopSginin(),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.10,
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
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            child: Text("Enter Your Credentials",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(fontSize: 16)),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Text.rich(
                          TextSpan(
                              text: "*",
                              style: TextStyle(color: Colors.red, fontSize: 18),
                              children: [
                                TextSpan(
                                    text: " Username",
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter phone number/ email address"),
                          onSaved: (newValue) => userName = newValue,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kAddressNullError);
                            }
    
                            return;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kAddressNullError);
    
                              return "";
                            }
                            logger.d(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value));
                            logger.d(value);
                            if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              logger.d('invalid email');
                              addError(error: kInvalidEmailError);
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Text.rich(
                          TextSpan(
                              text: "*",
                              style: TextStyle(color: Colors.red, fontSize: 18),
                              children: [
                                TextSpan(
                                    text: " Password",
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextFormField(
                          onSaved: (newValue) => password = newValue,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kPassNullError);
                            }
                            return;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kPassNullError);
    
                              return "";
                            }
                            return null;
                          },
                          obscureText: visibility,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                                color: textThemeGrey,
                                onPressed: () {
                                  setState(() {
                                    visibility = !visibility;
                                  });
                                },
                                icon: Icon(!visibility
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        ),
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                           const   Text('Remmember Me')
                            ],
                          ),
                          Container(
                            margin:const EdgeInsets.only(right: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => forgot()));
                                
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: blue.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
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
                                    text: "Don't Have an account? ",
                                    style: TextStyle(
                                        color: grayshade.withOpacity(0.8),
                                        fontSize: 18),
                                    children: [
                                      TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(
                                            color: greenshade,
                                            fontSize: 18,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print("Sign Up click");
                                            }),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      FormError(errors: errors),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            setState(() {
                              errors.clear();
                            });
                          authProvider.login(email: userName!, password: password!);
                                AnimatedSnackBar.material(
                            'Sign In Success!',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition: MobileSnackBarPosition
                                .bottom, // Position of snackbar on mobile devices
                            desktopSnackBarPosition: DesktopSnackBarPosition
                                .topRight, // Position of snackbar on desktop devices
                          ).show(context);
                          }
    
                      
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
                              "Sign in",
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
          ),
        )),
      ),
    );
  }
}
