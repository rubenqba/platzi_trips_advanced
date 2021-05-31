import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  static VoidCallback _nothing = (){};
  bool mini;
  var icon;
  double iconSize;
  var color;
  final VoidCallback _callback;

  CircleButton({this.mini = false, this.icon, this.iconSize = 40, this.color, VoidCallback? onPress}) :
    _callback = onPress != null ? onPress : _nothing;

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.mini,
          onPressed: widget._callback,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: Color(0xFF4268D3),
          ),
        )
    );
  }
}