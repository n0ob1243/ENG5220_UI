import 'dart:io';
import 'dart:typed_data';
import 'package:eng5220_ui/FullScreen.dart';
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

class DisplayPagei extends StatefulWidget {

  @override
  State<DisplayPagei> createState() => _DisplayPageiState();
}

class _DisplayPageiState extends State<DisplayPagei> {


  @override
  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) =>FullScreen()));}

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
          child: Container(
            color: Color(0XFF121212),
            constraints: BoxConstraints(maxWidth: 100.h, maxHeight: 89.w),
            child: Row(children: [
              SizedBox(
                width: 35.h,
                child: Container(
                  child: Column(children: [
                    Padding(
                      padding:
                      EdgeInsets.only(left: 3.5.h, top: 3.5.h, right: 3.5.h),
                      child: SizedBox(
                        height: 80.w,
                        width: 30.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF212121),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40.w,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 2.h, left: 2.h, right: 2.h),
                                  child: SizedBox(
                                    height: 20.w,
                                    width: 27.h,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF535353),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Gallery',
                                                style: TextStyle(fontSize: 20)),

                                          ),
                                          SizedBox(
                                            height: 30.w,
                                            width: 22.h,
                                            child: context.watch<ImageListProvider>().ListViewGalllery()
                                          ),




                                        ],
                                      ),),),),
                              ),
                              SizedBox(
                                height: 40.w,
                                child: Container(
                                  child: Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.h),
                                      child: Text('Notes'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.h, left: 2.h, right: 2.h),
                                      child: SizedBox(
                                        height: 20.w,
                                        width: 27.h,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFF535353),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CustomForm()
                                          ),),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 1.h, right: 1.h, top: 2.h),
                                        child: SizedBox(
                                            height: 5.w,
                                            width: 24.h,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF535353),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: Material(
                                                child: InkWell(
                                                    splashColor: Colors.white30,
                                                    onTap: () {
                                                      context.read<ImageListProvider>().captureImage();
                                                    },
                                                    child: Center(
                                                      child: Icon(
                                                          Icons.camera_alt),
                                                    )),
                                              ),
                                            )))
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 60.h,
                    height: 5.w,
                    child: Container(),
                  ),
                  SizedBox(
                    height: 50.w,
                    width: 60.h,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF212121),

                          borderRadius: BorderRadius.all(
                            Radius.circular(10),),),
                        child: SizedBox(child: Container(child:
                        Screenshot(child: Hero(
                          tag: 'stream',
                            child: VideoStream()),
                            controller: context.read<ImageListProvider>().screenshotController,),))
                    ),
                  ),
                  SizedBox(
                    width: 60.h,
                    height: 33.w,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 60.h,
                          height: 3.5.h,
                          child: Container(
                              decoration: BoxDecoration(),
                              child: Row(children: [
                                IconButton(onPressed: () {},
                                    icon: Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.pause)),
                                IconButton(onPressed: () {},
                                    icon: Icon(Icons.restart_alt)),
                                IconButton(onPressed: () {},
                                    icon: Icon(Icons.connected_tv)),
                                SizedBox(width: 36.55.h,),
                                IconButton(onPressed: (){_gotoDetailsPage(context);}, icon: Icon(Icons.fullscreen))
                              ],)),
                        ),
                        SizedBox(
                          width: 60.h,
                          height: 24.5.w,
                          child: Container(
                            child: TabContainer(
                              color: Color(0xFF212121),
                              children: [
                                Container(
                                  child: SliderExample(),
                                ),
                                Container(
                                  child: SliderExample(),
                                ),
                                Container(
                                  child: SliderExample(),
                                ),
                              ],
                              tabs: [
                                'Edge Detection',
                                'RGB Correction',
                                'Grey Scale',
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }


}
class EdgeDetectionTab extends StatefulWidget {
  const EdgeDetectionTab({Key? key}) : super(key: key);

  @override
  State<EdgeDetectionTab> createState() => _EdgeDetectionTabState();
}

class _EdgeDetectionTabState extends State<EdgeDetectionTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text('Edge Detection'),
      ),
    );
  }
}

class RGGCorrectionTab extends StatefulWidget {
  const RGGCorrectionTab({Key? key}) : super(key: key);

  @override
  State<RGGCorrectionTab> createState() => _RGGCorrectionTabState();
}

class _RGGCorrectionTabState extends State<RGGCorrectionTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text('RGB'),
      ),
    );
  }
}

class GreyScaleTab extends StatefulWidget {
  const GreyScaleTab({Key? key}) : super(key: key);

  @override
  State<GreyScaleTab> createState() => _GreyScaleTabState();
}

class _GreyScaleTabState extends State<GreyScaleTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () => null,
        child: Container(
          constraints: BoxConstraints(maxHeight: 3.5.w),
          child: Text('Grey Scale'),
        ),
      ),
    );
  }
}
class ImageListProvider extends ChangeNotifier {
  List <Widget>ImageList = [];
  ScreenshotController screenshotController = ScreenshotController();

  captureImage (){
    screenshotController.capture().then((capturedImage){ImageList.add(processImage(capturedImage));});
    notifyListeners();
  }

  processImage(capturedImage){
    return
      SizedBox(
        height: 17.w,
        width: 20.h,
        child: Container( 
          // only for testing purposes
          decoration: BoxDecoration(color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding( // remove this padding it does fuck all
            padding: EdgeInsets.all(3),
            child:Center(

              child: capturedImage != null
                  ? Image.memory(capturedImage)
                  : Container()),
        ),),
      );


  }
  ListViewGalllery(){
    return
       ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(4.sp),
        scrollDirection: Axis.horizontal,
        children: this.ImageList);

  }
}
//text controller
class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    print('text field: ${textController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          controller: textController,
          obscureText: false,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),),
    );
  }
}
// trying to get the list view widget to rebuild on a provider change

