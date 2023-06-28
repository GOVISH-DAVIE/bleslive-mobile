import 'package:bleslive/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketApi    extends ChangeNotifier {
  late IO.Socket? socket;

void init(){

 socket = IO.io("${baseUrlSocket}/mysocket", );
}

}