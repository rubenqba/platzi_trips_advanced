import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  String? title = "Popular";
  double? _height;

  GradientBack({this.title, double? height}) : _height = height;

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    if(_height == null) {
      _height = screenSize.height;
    }

    return Container(
      height: _height,
      width: screenSize.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF4268D3),
              Color(0xFF584CD1)
            ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
        )
      ),

      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -.8),
        child: Container(
          height: screenSize.height,
          width: screenSize.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, .05),
            borderRadius: BorderRadius.circular(screenSize.height / 2),
          ),
        ),
      ),

      // child: Text(
      //   title,
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 30.0,
      //     fontFamily: "Lato",
      //     fontWeight: FontWeight.bold
      //   ),
      // ),

      // alignment: Alignment(-0.9, -0.6),

    );
  }

}