import 'package:eng5220_ui/DisplayPage.dart';
import 'package:eng5220_ui/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'ControlPanel.dart';
import 'LeftPanel.dart';
import 'package:provider/provider.dart';

class ButtonProvider with ChangeNotifier{
  List <Widget> widgetList = [];

  bool ED=true;
  int RGB=0;
  AddEDSlider(){
    if(ED==true){
    widgetList.add(SliderExample());
    ED=false;
    notifyListeners();}
    else{return null;
    }
  }
  RemoveEDSlider(){
    widgetList.removeLast();
    ED=true;
    notifyListeners();
  }

  AddRGBSlider() {
    if (RGB == 0) {
      widgetList.add(SliderExample());
      RGB = 1;
      notifyListeners();
    }
    else {
      return null;
    }

  }
}