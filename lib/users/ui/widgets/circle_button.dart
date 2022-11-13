import 'package:flutter/material.dart';

class circle_button extends StatefulWidget {
  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  var color;

  circle_button(this.mini, this.icon, this.iconSize, this.color, {required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _circle_button();
  }
}
  
  class _circle_button extends State<circle_button> {
  @override

  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.mini,
          onPressed: widget.onPressed,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: Color(0xFF4268D3),
          ),
        )
    );
  }

}
