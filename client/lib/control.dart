import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:remote_websocket_control/message_sender.dart';
import 'package:remote_websocket_control/mouse_panel.dart';
import 'package:remote_websocket_control/media_button.dart';

class Control extends StatefulWidget {
  final WebSocketChannel? _channel;
  const Control(this._channel, {Key? key}) : super(key: key);
  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MediaButton((details) => sendMessage(widget._channel, "play"),
                      Icons.play_arrow),
                  MediaButton(
                      (details) => sendMessage(
                            widget._channel,
                            "stop",
                          ),
                      Icons.stop,
                      color: Colors.red[800]),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediaButton(
                        (details) =>
                            sendMessage(widget._channel, "volume_down"),
                        Icons.volume_down),
                    MediaButton(
                        (details) => sendMessage(widget._channel, "volume_up"),
                        Icons.volume_up),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediaButton(
                        (details) =>
                            sendMessage(widget._channel, "previous_track"),
                        Icons.skip_previous),
                    MediaButton(
                        (details) => sendMessage(widget._channel, "next_track"),
                        Icons.skip_next),
                  ]),
              MousePanel(widget._channel),
            ],
          ),
        ),
      ),
    );
  }
}
