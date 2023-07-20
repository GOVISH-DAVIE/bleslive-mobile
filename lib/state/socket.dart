import 'package:bleslive/state/product.dart';
import 'package:bleslive/utils/constants.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketApi extends ChangeNotifier {
  late IO.Socket? socket;
  BuildContext? _context;
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  SocketApi() {
    init();
  }

  void init() {
    socket = IO.io("${baseUrlSocket}", <String, dynamic>{
      "path": "/mysocket",
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket?.connect();
    socket?.onConnect((_) {
      socket?.on("all_users", (data) {
        logger.i("$data data of all users");
      });
      print('Connection established');
      _isConnected = true;
      notifyListeners();
    });
    socket?.onDisconnect((_) => print('Connection Disconnection'));
    socket?.onConnectError((err) => print(err));
    socket?.onError((err) => print(err));
  }

  join({required String session}) {
    logger.i('message');
     
    socket?.emit(
        'join_room', {"room": session, "email": 'uuid', "isadmin": false});
        
  }
}
