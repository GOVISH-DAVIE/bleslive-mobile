import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void Schedules(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: Text("SlidingUpPanelExample"),
        ),
        body: SlidingUpPanel(
          panel: Center(
            child: Text("This is the sliding Widget"),
          ),
          body: Center(
            child: Text("This is the Widget behind the sliding panel"),
          ),
        ),
      );
    },
  );
}

