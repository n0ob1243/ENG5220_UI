import 'package:eng5220_ui/ButtonProvider.dart';
import 'package:eng5220_ui/DisplayPage.dart';
import 'package:eng5220_ui/ScreenShotEG.dart';
import 'package:eng5220_ui/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'Display_i.dart';


// Todo:
// get video stream into app
// manage to get gallery working propely
// hook sliders up to stream image
// full screen functionality
// notes
// export images


void main() => runApp(MultiProvider(providers:[
ChangeNotifierProvider(create: (_)=>ButtonProvider()),
  ChangeNotifierProvider(create: (_)=>ImageListProvider()),

], child: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.dark(),
          home: DisplayPagei(),
        );
      },
    );
  }
}