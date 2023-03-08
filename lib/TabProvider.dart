
import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int TabNo=1;

  GreyScale(){
    TabNo=3;
    notifyListeners();
    return Text('GS');
  }
}