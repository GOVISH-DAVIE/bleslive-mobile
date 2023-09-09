import 'package:flutter/material.dart';
import 'package:bleslive/utils/constant.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:date_range_form_field/date_range_form_field.dart'; 

void Products(BuildContext context) {


  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      );
      return  Scaffold(
        appBar: AppBar(
          title: const Text("Schedule Session", textAlign: TextAlign.center),
        ),
        body: SlidingUpPanel(
          backdropEnabled: false,
          maxHeight: MediaQuery.of(context).size.height * 0.9, // Match screen height
          minHeight: MediaQuery.of(context).size.height * 0.5,
          panel: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(headerText: " Session title", hintTexti: "Enter full name"),
                const SizedBox(
                  height: 10,
                ),
                DateRangeField(
                enabled: true,
                initialValue: DateTimeRange(
                    start: DateTime.now(),
                    end: DateTime.now().add(Duration(days: 5))),
                decoration: InputDecoration(
                  labelText: 'Date session',
                  hintText: 'Select date',
                  suffixIcon:  Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.start.isBefore(DateTime.now())) {
                    return 'Please enter a later start date';
                  }
                  return null;
                },),
                const SizedBox(
                  height: 10,
                ),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

    Row(
      children: [
        Text('ssss'),
        const SizedBox(
          width: 10,
        ),
Text('ssss')
      ],

    ),
  ],
),
                InkWell(
                  onTap: () {
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: greenshade,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: whiteshade),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputField({Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child:  Text.rich(
            TextSpan(
                text: "*",
                style: TextStyle(
                    color: Colors.red, fontSize: 19),
                children: [
                  TextSpan(
                      text: headerText,
                      style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                ]),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: grayshade.withOpacity(0.1),
              border: Border.all(
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
          //IntrinsicHeight

        ),
      ],
    );
  }
}

