import 'dart:ui';

import 'package:flutter/material.dart';

class DialogNow extends StatefulWidget {
  const DialogNow({super.key});

  @override
  State<DialogNow> createState() => _DialogNowState();
}

class _DialogNowState extends State<DialogNow> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      // Adjust blur strength
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // Adjust border radius
        ),
        title: Text('"blesket live" Would Like to Access the Microphone',  style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w500,
            color: Colors.black)),
        content: Text('blesket live uses access to your microphone to do things like help you record audioand identify songs.You can always change this in your device settings', style: TextStyle(
            fontSize: 24,
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
  }
}
