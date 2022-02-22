import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:remote_websocket_control/message_sender.dart';

class MousePanel extends StatelessWidget {
  final WebSocketChannel? _channel;
  MousePanel(this._channel, {Key? key}) : super(key: key);

  final double _baseSize = 40;
  final Color _baseColorBackground = Colors.black54;
  final Color _baseColor = Colors.white;
  final buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.red, // background
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  );

  Widget _widgetButton(Color color, onTapDown, onTapUp, icon) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onVerticalDragEnd: onTapUp,
      onHorizontalDragEnd: onTapUp,
      child: SizedBox(
        width: _baseSize,
        height: _baseSize,
        child: Ink(
          decoration: ShapeDecoration(
            color: _baseColorBackground,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(icon, color: _baseColor),
            onPressed: null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _widgetButton(
            Colors.yellow,
            (details) => sendMessage(_channel, 'mouse_up'),
            (details) => sendMessage(_channel, 'mouse_stop_move'),
            Icons.keyboard_arrow_up),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetButton(
                Colors.blue,
                (details) => sendMessage(_channel, 'mouse_left'),
                (details) => sendMessage(_channel, 'mouse_stop_move'),
                Icons.keyboard_arrow_left),
            SizedBox(
              width: _baseSize,
              height: _baseSize,
            ),
            _widgetButton(
                Colors.red,
                (details) => sendMessage(_channel, 'mouse_right'),
                (details) => sendMessage(_channel, 'mouse_stop_move'),
                Icons.keyboard_arrow_right),
          ],
        ),
        _widgetButton(
            Colors.green,
            (details) => sendMessage(_channel, 'mouse_down'),
            (details) => sendMessage(_channel, 'mouse_stop_move'),
            Icons.keyboard_arrow_down),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTapDown: (details) => sendMessage(_channel, 'left_click'),
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: null,
                  child: const Text('Left Click',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTapDown: (details) => sendMessage(_channel, 'right_click'),
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: null,
                  child: const Text('Right Click',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ]),
      ],
    );
  }
}
