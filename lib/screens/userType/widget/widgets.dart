
import 'package:flutter/material.dart';
import 'package:bleslive/utils/colors.dart';

class TopSigninWidget extends StatelessWidget {
  String headerText;
  TopSigninWidget({Key? key, required this.headerText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style: TextStyle(
              color: Color(0xff7E848C),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

Widget buildBaslik({required String title,required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0, left: 26, bottom: 8),
    child: Text(
      title,
      style:Theme.of(context).textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w500
      ),
    ),
  );
}

Widget buildBaslik2({required String title,required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0, left: 26, bottom: 40),
    child: Text(
      title,
      style: Theme.of(context).textTheme.caption?.copyWith(
        fontSize: 18,
        color: textThemeGrey.withOpacity(.8)
      ),
    ),
  );
}
