import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String _text;
  final VoidCallback _callback;
  final double? _width;
  final double? _heigth;

  const ButtonGreen({Key? key, required String text, required VoidCallback callback, double? width, double? heigth, })
      : _width = width, _heigth = heigth, _text = text, _callback = callback, super(key: key);

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget._callback,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget._heigth,
        width: widget._width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFa7ff84),
                  Color(0xFF1cbb78)
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp

            )
        ),
        child: Center(
          child: Text(
            widget._text,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
