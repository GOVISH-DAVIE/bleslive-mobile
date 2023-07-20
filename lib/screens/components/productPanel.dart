import 'package:bleslive/screens/components/productcard.dart';
import 'package:bleslive/state/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;

    final double itemWidth = size.width / 2;
    return Consumer<ProductController>(
      builder:(context, value, child) =>  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width * .2,
              margin: const EdgeInsets.only(top: 10, bottom: 40),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(119, 108, 108, 108),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.read<ProductController>().session == null
                    ? const SizedBox()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GridView.count(
                          
                          shrinkWrap: false,
                          padding: const EdgeInsets.all(10),
                          crossAxisCount: 2,
                          childAspectRatio: itemWidth > itemHeight
                              ? (itemWidth / itemHeight) / 2
                              : (itemWidth / itemHeight),
                          children: [
                            ...context
                                .read<ProductController>()
                                .session!
                                .product!
                                .map((e) => PhoneActive(product: value.products.where((element) => 
                                element.id==e.variationId).first,)
                                 
                                // PhoneActive())
                                
                                 )
                                .toList()
                          ],
                        ),
                      ), 
      
      
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
