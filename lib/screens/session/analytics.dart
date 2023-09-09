import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart'; 
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bleslive/screens/dashboard/dashboard.dart'; 
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class analytics extends StatefulWidget {
  const analytics({super.key,});

  @override
  State<analytics> createState() => _analyticsState();
}

class _analyticsState extends State<analytics> {

  PersistentTabController? _controller;
  int? selectedIndex;

  @override
  void initState() {
    _controller = PersistentTabController();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      margin: const EdgeInsets.only(top: 80, left: 30, right: 20, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  withNavBar: true,
                                  screen: Dashbord(),pageTransitionAnimation:PageTransitionAnimation.scale);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: blackshade,
                              size: 26,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text( "Session analytics",
                            style: TextStyle(color: blackshade, fontSize: 29,     fontWeight: FontWeight.w500,),
                          )
                        ],
                      ),
                    ),


                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 30, right: 20, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Text( "Session #234",
                            style: TextStyle(color: blackshade, fontSize: 25,     fontWeight: FontWeight.w500,),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffF6FFED),
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Ended',
                              style: const TextStyle(fontSize: 15, color: Color(0xff52C41A), fontWeight:FontWeight.w500 ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffDBDBDB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child:   Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 5),
                              Container(
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffE9F2E6),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    'https://davee.co.ke/toa.jpg', // Replace with the actual image URL
                                    width: 50, // Adjust the width as needed
                                    height: 50, // Adjust the height as needed
                                    fit: BoxFit.cover, // Adjust the image fit mode as needed
                                  ),
                                ),),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    'Joe Doe',
                                    style: const TextStyle(fontSize: 28, color: Color(0xff000000)),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    'Product promoter',
                                    style: const TextStyle(fontSize: 18, color: Color(0xff7E848C)),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),
                              const SizedBox(height: 10),
                              const SizedBox(height: 15),
                              const SizedBox(height: 10),
                              const SizedBox(height: 15),
                              const SizedBox(height: 10),
                            ],
                          ),



                          SizedBox(height: 20,),


                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              InkWell(

                                onTap: () {

                                },

                                child: Container(

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),

                                    color: const Color(0xffF2F2F2),

                                  ),

                                  width: (screenwidth - 60) * 0.5,

                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),

                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [

                                      const SizedBox(height: 10),

                                      Text(

                                        textAlign: TextAlign.start,

                                        'Users',

                                        style: const TextStyle(fontSize: 18, color: Color(0xff7E848C)),

                                      ),

                                      const SizedBox(height: 15),

                                      Text.rich(

                                        TextSpan(

                                            text: "210",

                                            style: TextStyle(

                                                color: Color(0xff241872), fontSize: 20, fontWeight: FontWeight.w600),

                                         ),

                                      ),

                                    ],

                                  ),

                                ),

                              ),

                              const SizedBox(width: 10),

                              InkWell(

                                onTap: () {

                                },

                                child: Container(

                                  width: (screenwidth - 60) * 0.5,

                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),

                                    color: const Color(0xffF2F2F2),

                                  ),

                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [

                                      const SizedBox(height: 10),

                                      Text(

                                        textAlign: TextAlign.start,

                                        'Views',

                                        style: const TextStyle(fontSize: 18, color: Color(0xff7E848C)),

                                      ),

                                      const SizedBox(height: 15),

                                      Text.rich(

                                        TextSpan(

                                            text: "200",

                                            style: TextStyle(

                                                color: Color(0xff241872), fontSize: 20, fontWeight: FontWeight.w600),

                                   ),

                                      ),

                                    ],

                                  ),

                                ),

                              )



                            ],

                          ),



                          SizedBox(height: 20,),



                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              InkWell(

                                onTap: () {

                                },

                                child: Container(

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),

                                    color: const Color(0xffF2F2F2),

                                  ),

                                  width: (screenwidth - 60) * 0.5,

                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),

                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [

                                      const SizedBox(height: 10),

                                      Text(

                                        textAlign: TextAlign.start,

                                        'Sales',

                                        style: const TextStyle(fontSize: 18, color: Color(0xff7E848C)),

                                      ),

                                      const SizedBox(height: 15),

                                      Text.rich(

                                        TextSpan(

                                            text: "20,000",

                                            style: TextStyle(

                                                color: Color(0xff241872), fontSize: 20, fontWeight: FontWeight.w600),

                                    ),

                                      ),

                                    ],

                                  ),

                                ),

                              ),

                              const SizedBox(width: 10),

                              InkWell(

                                onTap: () {

                                },

                                child: Container(

                                  width: (screenwidth - 60) * 0.5,

                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),

                                    color: const Color(0xffF2F2F2),

                                  ),

                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [

                                      const SizedBox(height: 10),

                                      Text(

                                        textAlign: TextAlign.start,

                                        'Watch time',

                                        style: const TextStyle(fontSize: 18, color: Color(0xff7E848C)),

                                      ),

                                      const SizedBox(height: 15),

                                      Text.rich(

                                        TextSpan(

                                            text: "1hr 25 min",

                                            style: TextStyle(

                                                color: Color(0xff241872), fontSize: 20, fontWeight: FontWeight.w600),

                           ),

                                      ),

                                    ],

                                  ),

                                ),

                              ),






                            ],

                          ),

                          const SizedBox(
                            height: 20,
                          ),


                        ],

                      ),



                    ),


                  ],
                ),
              ),
            ],
          )),
    );
  }
}
