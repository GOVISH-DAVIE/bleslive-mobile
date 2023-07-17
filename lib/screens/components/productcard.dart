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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.product.originalImage!),
          Text(
            widget.product.productName!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          BlesLiveButton(
              callback: () {},
              type: defaultButtonTheme,
              child: Text(
                  "Buy Now \t KSH ${widget.product.variation?.first.price}"))
        ],
      ),
    ));
  }
}
