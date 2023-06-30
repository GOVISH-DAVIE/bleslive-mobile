import 'package:bleslive/state/product.dart';
import 'package:bleslive/utils/constants.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketApi    extends ChangeNotifier {
  late IO.Socket? socket;
  BuildContext? _context;

void init({required BuildContext context }){
_context = context;
 socket = IO.io("${baseUrlSocket}/mysocket", ); 
 socket?.onconnect(
  (_){
    logger.w('connected');
  }
 );
 socket?.on('disconnected', (data){
  logger.i("disconnected $data");
 });

 logger.w('message');
 logger.i(_context!.read<ProductController>().session?.uuid);
 socket?.emit('join_room', {
				"room":_context!.read<ProductController>().session?.uuid ,
				"email": 'client1212@naver.com',
				"isadmin":false

			});
}

}