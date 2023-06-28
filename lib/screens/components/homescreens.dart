import 'package:bleslive/main.dart';
import 'package:bleslive/screens/components/messagePanel.dart';
import 'package:bleslive/screens/components/productPanel.dart';
import 'package:bleslive/state/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  final Chatproduct type;
  const Home({super.key, required this.type});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder:(context, value, child) =>  SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height * .7,
        minHeight: MediaQuery.of(context).size.height * .3,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28.0), topRight: Radius.circular(28.0)),
        panel: widget.type == Chatproduct.Chat
            ? const MessagingPannel()
            : const ProductList(),
        body: Column(
          children: [
            Text(context.read<ProductController>().products.length.toString()),
            Text(context.read<ProductController>().session.toString()),
            
            Center(
              child: Text("This is the Widget behind the sliding panel"),
            ),
          ],
        ),
      ),
    );
  }
}
