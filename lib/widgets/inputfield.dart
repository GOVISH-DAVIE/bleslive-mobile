import 'package:flutter/material.dart';

class BlesketInputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  BlesketInputField({Key? key, required this.headerText, required this.hintTexti})
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
          child:  const Text.rich(
            TextSpan(
                text: "*",
                style: TextStyle(color: Colors.red, fontSize: 18),
                children: [
                  TextSpan(
                      text: " Username",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ]),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: hintTexti,
                ),
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}
