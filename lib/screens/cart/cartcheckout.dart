import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartCheckout extends StatefulWidget {
  const CartCheckout({super.key});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * .25,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/mpesa.png'),
                      const Text(
                        'MPESA',
                        style: TextStyle(
                          color: Color(0xFF595959),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * .25,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/card.svg',
                          semanticsLabel: 'Acme Logo'),
                      const Text(
                        'Card',
                        style: TextStyle(
                          color: Color(0xFF595959),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
