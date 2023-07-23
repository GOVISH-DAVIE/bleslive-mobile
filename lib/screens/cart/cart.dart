import 'package:bleslive/screens/cart/cartcheckout.dart';
import 'package:bleslive/state/product.dart';
import 'package:bleslive/utils/buttons.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductController>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'My Cart',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [ 
                    if (value.sortedCart != null)
                      ...value.sortedCart!.keys.map(
                        (e) =>  
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 107,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 120,
                              height: 107,
                              decoration: ShapeDecoration(
                                image:const DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/120x107"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                            Positioned(
                            left: 130,
                            top: 10,
                            child: Text(
                              '${value.products.where((product) => product.id == value.sortedCart?[e]?.first.product).first.productName}',
                              style:const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                           Positioned(
                            left: 298,
                            top: 45,
                            child: Text(
                              'KSH ${ value.products.where((product) => product.id == value.sortedCart?[e]?.first.product).first.variation?.where((variation) => variation.id ==value.sortedCart?[e]?.first.variations).first.price
                              }',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 129,
                            top: 48,
                            child: Container(
                              width: 96,
                              height: 23,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 43,
                                    top: 2,
                                    child: Text(
                                      '${value.sortedCart?[e]?.length}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 24,
                                      height: 23,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 24,
                                              height: 23,
                                              child: Icon(Icons.add),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 72,
                                    top: 0,
                                    child: Container(
                                      width: 24,
                                      height: 23,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 24,
                                              height: 23,
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        
                        ),
                      
                                      ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Totals',style: Theme.of(context).textTheme.headline5),
                  Text('KSH ${context.read<ProductController>().cartTotals}', style: Theme.of(context).textTheme.headline5,)
                ],
              ),
            ),

            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: BlesLiveButton(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const CartCheckout(),
                        ),
                      );
                    },
                    child: Text("Checkout"),
                    type: defaultButtonTheme))
          ],
        ),
      ),
    );
  }
}
