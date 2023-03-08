import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'WebSocket.dart';
import 'package:flutter/cupertino.dart';


class VideoStream extends StatefulWidget {
  const VideoStream({Key? key}) : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  final WebSocket _socket = WebSocket("ws://192.168.246.223:5000");
  bool _isConnected = false;
  void connect(BuildContext context) async {
    _socket.connect();
    setState(() {
      _isConnected = true;
    });
  }

  void disconnect() {
    _socket.disconnect();
    setState(() {
      _isConnected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center( child:
              _isConnected
                  ? StreamBuilder(
                stream: _socket.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    return const Center(
                      child: Text("Connection Closed !"),
                    );
                  }
                  //? Working for single frames
                  return Image.memory(
                    Uint8List.fromList(
                      base64Decode(
                        (snapshot.data.toString()),
                      ),
                    ),
                    gaplessPlayback: true,
                    excludeFromSemantics: true,
                  );
                },
              )
                  : const Text("Initiate Connection"));

  }
}

