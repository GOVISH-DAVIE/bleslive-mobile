import 'package:flutter/material.dart';

class ModalNow extends StatefulWidget {
  const ModalNow({super.key});

  @override
  State<ModalNow> createState() => _ModalNowState();
}

class _ModalNowState extends State<ModalNow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.blue,
            size: 48,
          ),
          SizedBox(height: 16),
          Text(
            'Bottom Modal Sheet',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This is a bottom modal sheet.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
