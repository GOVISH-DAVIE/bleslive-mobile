import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../session/cameraScreen.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key,});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {

  PersistentTabController? _controller;
  int? selectedIndex;

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Text(
                    'Go Live!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.cancel,
                      color: Color(0xFF000000),
                      size: 54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  Icons.video_call,
                    color: Color(0xFF52C41A),
                    size: 54,
                  ),
              // SizedBox(width: 1),
              Icon(
                Icons.person,
                color: Color(0xFFE9F2E6),
                size: 54,
              ),
            ],
          ),
              SizedBox(height: 10),
              Text(
                'Your session is scheduled for today at 10:00AM - 12:00PM',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF8C8C8C),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _showBlurredModal(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: greenshade,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      "Let's go",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: whiteshade),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  void _showBlurredModal(BuildContext context) {
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return BackdropFilter(
  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
  // Adjust blur strength
  child: AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0), // Adjust border radius
    ),
  title: Text('"blesket live" Would Like to Access the Microphone',  style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: Colors.black)),
  content: Text('blesket live uses access to your microphone to do things like help you record audioand identify songs.You can always change this in your device settings', style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black)),
  actions: <Widget>[
  TextButton(
  onPressed: () {
  Navigator.of(context).pop();// Close the dialog
  },
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: Text("Don't Allow", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3B7425))),
      ),
      SizedBox(width: 10,),
      Container(
        height: 24,
        width: 1, // Adjust width as needed
        color: Colors.grey, // Adjust color as needed
      ),
      SizedBox(width: 10,),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: Text('OK', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3B7425))),
      ),

    ],
  ),
  ),
  ],
  ),
  );
  },
  );
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
            child: Stack(
              children: [

                   Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TopSginin(headerText: "My Dashboard"),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent, ),
                            color: Color(0xFF241872),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                            ),
                              boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                          ),

                          height: 220,
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.02),
                                      child: Text(
                                        "Ready to go live!",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500,
                                            color: whiteshade),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height:40,
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.02),
                                      child: Text(
                                        "Start/Schedule your session today",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFB0A8EC)),
                                      ),
                                    ),
                                  ],
                                ),


                                Row(
                                  children: [
                                    Container(
                                      height:43,
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.01),
                                      child:       FloatingActionButton.extended(
                                        label: Text('Create New', style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,),), // <-- Text
                                        backgroundColor: Color(0xFF897CE3),
                                        icon: Icon( // <-- Icon
                                          Icons.add,
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: CameraScreen(),
                                            withNavBar: false,
                                          );
                                        },
                                      ),

                                    ),
                                  ],
                                ),






                              ]
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),


                    Container(
                      margin: const EdgeInsets.only(top: 58, left: 30, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( "MY SESSIONS",
                            style: TextStyle(color: blackshade, fontSize: 24,     fontWeight: FontWeight.w500,),
                          )
                        ],
                      ),
                    ),

                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                              },
                              child: Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  // color: const Color(0xff284D19),
                                ),
                                width: (screenwidth - 10) * 0.9,
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 15),
                                    Icon(Icons.video_camera_back,
                                        size: 50,
                                        color: Color(0xffE9F2E6)
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      textAlign: TextAlign.start,
                                      'No Sessions added yet!',
                                      style: const TextStyle(fontSize: 28, color: Color(0xff333335), fontWeight:FontWeight.w600 ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      textAlign: TextAlign.start,
                                      'Create a new session to get started with blesket live commerce.',
                                      style: const TextStyle(fontSize: 20, color: Color(0xff7E848C)),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),


   Container(
     color: Colors.grey[200], // Background color of the column
     padding: EdgeInsets.all(16),
     margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
     child: Column(
           children: [ Container(
           padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Flexible(
                 child: Text(
                   textAlign: TextAlign.start,
                   'Mega deal - Candy lip balm ',
                   style: const TextStyle(fontSize: 20, color: Color(0xff333335), fontWeight:FontWeight.w600 ),
                 ),
               ),
               Container(
                 padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   color: const Color(0xffFF5050),
                 ),
                 child: Text(
                   textAlign: TextAlign.start,
                   'Live',
                   style: const TextStyle(fontSize: 15, color: Color(0xffFFFFFF), fontWeight:FontWeight.w500 ),
                 ),
               ),
             ],
           ),
         ),
         SizedBox(height: 16),
         Container(
           margin: EdgeInsets.only(
               left: MediaQuery.of(context).size.width * 0.050),
           child: Row(
             children: [
               Icon(
                 Icons.alarm,
                 color: Color(0xff3B7425),
               ),
               SizedBox(width: 8),
               Text(
                 textAlign: TextAlign.start,
                 '10:00AM - 12:00PM',
                 style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 ),
               ),
             ],
           ),
         ),
         SizedBox(height: 10),
         Container(
           margin: EdgeInsets.only(
               left: MediaQuery.of(context).size.width * 0.050),
           child: Row(
             children: [
               Icon(
                 Icons.calendar_month_sharp,
                 color: Color(0xff3B7425),
               ),
               SizedBox(width: 8),
               Text(
                 textAlign: TextAlign.start,
                 '23 Jun, 2023',
                 style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 ),
               ),
             ],
           ),
         ),
         SizedBox(height: 10),
         Container(
           padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
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
                   width: 40, // Adjust the width as needed
                   height: 40, // Adjust the height as needed
                   fit: BoxFit.cover, // Adjust the image fit mode as needed
                 ),
               ),),
               Container(
                 padding: const EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   color: const Color(0xffE9F2E6),
                   border: Border.all(
                     width: 0.2,
                   ),
                 ),
                 child: Row(
                   children: [
                     Icon(
                       Icons.play_circle_outline,
                       color: Color(0xff3B7425),
                     ),
                     SizedBox(width: 10),
                     Text(
                       textAlign: TextAlign.start,
                       'OPEN',
                       style: const TextStyle(fontSize: 15, color: Color(0xff257A00), fontWeight:FontWeight.w600 ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
         SizedBox(height: 10),
          ]
     ),
   ),





                        Container(
                          color: Colors.grey[200], // Background color of the column
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
                          child: Column(
                              children: [ Container(
                                padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        'Live session title',
                                        style: const TextStyle(fontSize: 20, color: Color(0xff333335), fontWeight:FontWeight.w600 ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                SizedBox(height: 16),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.050),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        color: Color(0xff3B7425),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        textAlign: TextAlign.start,
                                        '10:00AM - 12:00PM',
                                        style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.050),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_sharp,
                                        color: Color(0xff3B7425),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        textAlign: TextAlign.start,
                                        '22 Jun, 2023',
                                        style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color(0xffE9F2E6),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.network(
                                            'https://davee.co.ke/toa.jpg', // Replace with the actual image URL
                                            width: 40, // Adjust the width as needed
                                            height: 40, // Adjust the height as needed
                                            fit: BoxFit.cover, // Adjust the image fit mode as needed
                                          ),
                                        ),),
                                      InkWell(
    onTap: () {
      _openBottomSheet(context);
    print("Going Live!");
    },
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: const Color(0xff257A00),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle_outline,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                textAlign: TextAlign.start,
                                                'GO LIVE',
                                                style: const TextStyle(fontSize: 15, color: Color(0xffFFFFFF), fontWeight:FontWeight.w500 ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                              ]
                          ),
                        ),


                        Container(
                          color: Colors.grey[200], // Background color of the column
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
                          child: Column(
                              children: [ Container(
                                padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        'Live session title',
                                        style: const TextStyle(fontSize: 20, color: Color(0xff333335), fontWeight:FontWeight.w600 ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                SizedBox(height: 15),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.050),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        color: Color(0xff3B7425),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        textAlign: TextAlign.start,
                                        '10:00AM - 12:00PM',
                                        style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.050),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_sharp,
                                        color: Color(0xff3B7425),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        textAlign: TextAlign.start,
                                        '22 Jun, 2023',
                                        style: const TextStyle(fontSize: 15, color: Color(0xff4B5D74), fontWeight:FontWeight.w400 ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color(0xffE9F2E6),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.network(
                                            'https://davee.co.ke/toa.jpg', // Replace with the actual image URL
                                            width: 40, // Adjust the width as needed
                                            height: 40, // Adjust the height as needed
                                            fit: BoxFit.cover, // Adjust the image fit mode as needed
                                          ),
                                        ),),

                                      InkWell(
                                        onTap: () {
                                          _openBottomSheet(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: const Color(0xff257A00),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle_outline,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                textAlign: TextAlign.start,
                                                'GO LIVE',
                                                style: const TextStyle(fontSize: 15, color: Color(0xffFFFFFF), fontWeight:FontWeight.w500 ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                              ]
                          ),
                        ),



                      ],
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}

class TopSginin extends StatelessWidget {
  String headerText;
  TopSginin({Key? key, required this.headerText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80, left: 30, right: 20, bottom: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( headerText,
            style: TextStyle(color: blackshade, fontSize: 32,     fontWeight: FontWeight.w500,),
          )
        ],
      ),
    );
  }
}







