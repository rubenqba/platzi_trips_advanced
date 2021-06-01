import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final IconData icon;

  const TextInputLocation({
    Key? key,
    required this.hint,
    required this.controller,
    this.icon = Icons.add_location
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fillColor = Colors.white;
    var inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: fillColor),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: this.controller,
        style: TextStyle(
            fontSize: 15,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(this.icon),
            filled: true,
            fillColor: fillColor,
            border: InputBorder.none,
            hintText: this.hint,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0, 7)
          )
        ]
      ),
    );
  }
}
