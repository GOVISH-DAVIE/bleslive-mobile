import 'package:bleslive/screens/components/productcard.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width * .2,
          margin: EdgeInsets.only(top: 10, bottom: 40),
          decoration: BoxDecoration(
              color: Color.fromARGB(119, 108, 108, 108),
              borderRadius: BorderRadius.circular(20)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PhoneActive(),
            PhoneActive(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PhoneActive(),
            PhoneActive(),
          ],
        ),
      ],
    );
  }
}
