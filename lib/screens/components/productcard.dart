import 'package:bleslive/models/products/products.dart';
import 'package:bleslive/utils/buttons.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';

class PhoneActive extends StatefulWidget {
  final Products product;
  const PhoneActive({super.key, required this.product});

  @override
  State<PhoneActive> createState() => _PhoneActiveState();
}

class _PhoneActiveState extends State<PhoneActive> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 159,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              left: 112.24,
              top: 198.51,
              child: SizedBox(
                width: 159,
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        'KSH',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.58,
                      top: 0,
                      child: Text(
                        '${widget.product.variation?.first.price}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 4.68,
              top: 198.51,
              child: Text(
                '${widget.product.productName } \n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 159,
                height: 185.01,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${widget.product.originalImage}"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 0,
                top: 234.24,
                child: SizedBox(
                    width: 158.06,
                    height: 31.76,
                    child: BlesLiveButton(
                      callback: () {},
                      child: Text('Buy Now'),
                      type: outlineButtonDefault,
                    ))),
          ],
        ),
      ),
    );
  }
}
