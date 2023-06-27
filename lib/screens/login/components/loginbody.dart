import 'package:bleslive/state/auth.dart';
import 'package:bleslive/utils/FormError.dart';
import 'package:bleslive/utils/buttons.dart';
import 'package:bleslive/utils/color.dart';
import 'package:bleslive/utils/constants.dart';
import 'package:bleslive/utils/sizeconfig.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _BodyState();
}

class _BodyState extends State<LoginBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
      builder: (context, authProvider, child) => authProvider.isLoggedIn
          ? const Text('c')
          : Scaffold(
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .08,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Container(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                // alignment: Alignment.,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Welcome Back',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontWeight: FontWeight.w800),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                // alignment: Alignment.,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Sign in to your Blesket Account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 12),
                                )),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                controller: nameController,
                                onSaved: (newValue) => userName = newValue,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kNullError);
                                  }
                                  return;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    addError(error: kNullError);

                                    return "";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visibility = !visibility;
                                        });
                                      },
                                      icon: Icon(!visibility
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  hintText: 'Password',
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Row(
                                      children: const [
                                        Checkbox(
                                          value: true,
                                          onChanged: null,
                                        ),
                                        Text(
                                          'Remember me',
                                          style: TextStyle(color: black),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: themePrimary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            FormError(errors: errors),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 20,
                              ),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
                              child: busy
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : BlesLiveButton(
                                      callback: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          setState(() {
                                            busy = true;
                                          });

                                          logger.d(
                                              'validated $password $userName');

                                          authProvider
                                              .login(
                                                  password: password,
                                                  username: userName)
                                              .then((value) {
                                            // * successfull response
                                            // context
                                            //     .read<RoomProvider>()
                                            //     .roomsModel = value;
                                            //*assign to get rooms
                                            setState(() {
                                              busy = false;
                                            });

                                            // Navigator.pushReplacementNamed(
                                            //     context, Dashboard.route);
                                          }).catchError((onError) {
                                            //! invalid response ERROR HANDLING
                                            setState(() {
                                              busy = false;
                                            });

                                            addError(
                                                error: kInvalidCredentials);
                                          });
                                        }
                                        // Navigator.pushNamed(context, Dashboard.route);
                                        // });
                                      },
                                      type: defaultButtonTheme,
                                      child: const Text('Login'),
                                    ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
    );
  }
}
