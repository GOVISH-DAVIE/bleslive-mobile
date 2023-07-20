import 'package:bleslive/utils/buttons.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessagingPannel extends StatefulWidget {
  const MessagingPannel({super.key});

  @override
  State<MessagingPannel> createState() => _MessagingPannelState();
}

class _MessagingPannelState extends State<MessagingPannel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width * .2,
              margin: const EdgeInsets.only(top: 10, bottom: 40),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(119, 108, 108, 108),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    height: 88,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    height: 88,
                    decoration: ShapeDecoration(
                      color: const Color(0x8C407235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    height: 88,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    height: 88,
                    decoration: ShapeDecoration(
                      color: const Color(0x8C407235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                ],
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
              suffix: BlesLiveButton(
            callback: () {},
            type: inactiveButtonTheme.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            child: SvgPicture.asset('assets/images/send.svg',
                semanticsLabel: 'Acme Logo'),
          )),
        )
      ],
    );
  }
}
