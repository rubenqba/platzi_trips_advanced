import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData? icon;
  final VoidCallback? callback;

  const FloatingActionButtonGreen({Key? key, this.icon, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }
}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      onPressed: widget.callback,
      child: Icon(widget.icon),
      heroTag: UniqueKey(),
    );
  }

}