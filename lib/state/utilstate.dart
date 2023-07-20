import 'package:bleslive/main.dart';
import 'package:flutter/material.dart';

class UtilState extends ChangeNotifier{
Chatproduct  _activeState = Chatproduct.Product;
Chatproduct  get activeState => Chatproduct.Product;
set activeState (Chatproduct state ){
  _activeState = state;
  notifyListeners();
}

}