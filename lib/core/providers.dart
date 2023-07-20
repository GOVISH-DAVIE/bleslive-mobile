import 'package:bleslive/core/locator.dart';
import 'package:bleslive/state/auth.dart';
import 'package:bleslive/state/product.dart';
import 'package:bleslive/state/socket.dart';
import 'package:bleslive/state/utilstate.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => locator.get<AuthProvider>()),
  ChangeNotifierProvider(create: (context) => locator.get<UtilState>()),
  ChangeNotifierProvider(create: (context) => locator.get<ProductController>()),
  ChangeNotifierProvider(create: (context) => locator.get<SocketApi>()),
];
