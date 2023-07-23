import 'package:bleslive/main.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';

class UtilState extends ChangeNotifier{
Chatproduct  _activeState = Chatproduct.Product;
Chatproduct  get activeState =>_activeState;
set activeState (Chatproduct state ){
  logger.i('state');
  _activeState = state;
  notifyListeners();
}

}