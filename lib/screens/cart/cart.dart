import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only( left: 8.0),
            child: Text('My Cart', style: Theme.of(context).textTheme.titleLarge,),
          ),
          Divider(),

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
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/120x107"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const Positioned(
                  left: 130,
                  top: 10,
                  child: Text(
                    'Milo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Positioned(
                  left: 298,
                  top: 45,
                  child: Text(
                    'KSH 100',
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
                            '2',
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
                                            BorderRadius.circular(20)),
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
          ),
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
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/120x107"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const Positioned(
                  left: 130,
                  top: 10,
                  child: Text(
                    'Milo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Positioned(
                  left: 298,
                  top: 45,
                  child: Text(
                    'KSH 100',
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
                            '2',
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
                                            BorderRadius.circular(20)),
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
        ],
      ),
    );
  }
}
