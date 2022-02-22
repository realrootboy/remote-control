import 'package:flutter/material.dart';

class MediaButton extends StatelessWidget {
  final onTapDown;
  final icon;
  final color;

  const MediaButton(this.onTapDown, this.icon, {Key? key, this.color})
      : super(key: key);
  final double _baseSize = 60;
  final Color _baseColorBackground = Colors.black54;
  final Color _baseColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: _baseSize,
          height: _baseSize,
          child: Ink(
            decoration: ShapeDecoration(
              color: _baseColorBackground,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(icon, color: color ?? _baseColor, size: 36.0),
              onPressed: null,
            ),
          ),
        ),
      ),
    );
  }
}
