
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final String hint;
  final TextInputType? inputType;
  final TextEditingController controller;
  final int maxLines;

  const TextInput({
    Key? key,
    required this.hint,
    this.inputType,
    required this.controller,
    this.maxLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fillColor = Color(0xffe5e5e5);
    var inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: fillColor),
      borderRadius: BorderRadius.all(Radius.circular(9)),
    );

    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: this.controller,
        keyboardType: this.inputType,
        maxLines: this.maxLines,
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: InputBorder.none,
          hintText: this.hint,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder
        ),
      ),
    );
  }
}
