import 'package:eng5220_ui/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'ControlPanel.dart';
import 'LeftPanel.dart';
import 'package:provider/provider.dart';
import 'ButtonProvider.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MainBody(),
    );
  }
}

var myWidgetList = <Widget>[];

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 25.h,
              height: 88.85.w,
              child: Container(
                child: Column(children: [
                  InkWell(
                    splashColor: Colors.white30,
                    onTap: () => context.read<ButtonProvider>().AddEDSlider(),
                    child: SizedBox(
                      width: 25.h,
                      height: 15.h,
                      child: Container(
                        child: Center(child: Text('Edge Detection')),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.white30,
                    onTap: () => context.read<ButtonProvider>().AddRGBSlider(),
                    child: SizedBox(
                      width: 25.h,
                      height: 15.h,
                      child: Container(
                        child: Center(child: Text('RGB Correction')),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.white30,
                    onTap: () {},
                    child: SizedBox(
                      width: 25.h,
                      height: 15.h,
                      child: Container(
                        child: Center(child: Text('Grey Scale')),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 75.h,
              height: 54.w,
              child: Container(
                color: Colors.red,
                constraints: BoxConstraints(maxHeight: 54.w),
                child: VideoStream(),
              ),
            ),
            ControlPanel()
          ],
        )
      ],
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderPrimaryValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


            Center(
              child: Padding(
                padding: EdgeInsets.only(top:30),
                child: Container(
                  width: 50.h,
                  child: Slider(
                    value: _currentSliderPrimaryValue,
                    label: _currentSliderPrimaryValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderPrimaryValue = value;
                      });
                    },
                  ),
                ),
              ),
            ),

          ],
        );
  }
}

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 75.h,
        height: 34.85.w,
        child: Container(
          color: Colors.black,
          constraints: BoxConstraints(maxHeight: 54.w),
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue, border: Border(bottom: BorderSide(color: Colors.blue))),

                      constraints:
                          BoxConstraints(maxHeight: 20, maxWidth: 150)),
                )
              ],
            ),
            SizedBox(height: 32.071.w, width: 75.h,child: Container( decoration: BoxDecoration(color: Colors.blue, border: Border(bottom: BorderSide(color: Colors.blue))),), )
          ] //context.watch<ButtonProvider>().widgetList),
              ),
        ));
  }
}
