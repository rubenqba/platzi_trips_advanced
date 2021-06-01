import 'package:flutter/material.dart';
import 'package:platzi_trips_advanced/widgets/floating_action_button_green.dart';


class  CardImageWithFabIcon extends StatelessWidget {

  final String pathImage;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final VoidCallback? buttonCallback;
  final IconData? icon;

  CardImageWithFabIcon({
    required this.pathImage,
    this.height = 350,
    this.width = 250,
    this.margin,
    this.icon,
    this.buttonCallback
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: this.height,
      width: this.width,
      margin: this.margin,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(pathImage),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(icon: this.icon, callback: this.buttonCallback,)
      ],
    );
  }

}