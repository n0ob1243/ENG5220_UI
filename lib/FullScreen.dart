import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'package:tab_container/tab_container.dart';
import 'package:eng5220_ui/DisplayPage.dart';
import 'package:eng5220_ui/VideoPlayer.dart';

import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'ControlPanel.dart';
import 'LeftPanel.dart';
import 'package:provider/provider.dart';
import 'ButtonProvider.dart';
import 'TabProvider.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
    body: Hero(tag: 'stream',
    child: SizedBox(
        width: 95.h,
        height: 95.w,
        child: VideoStream())));
  }
}
