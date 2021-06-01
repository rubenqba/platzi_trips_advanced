import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var margin = EdgeInsets.only(
        top: 80.0,
        left: 20.0
    );
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(margin: margin, pathImage: "assets/img/beach_palm.jpeg", icon: Icons.favorite_border,),
          CardImageWithFabIcon(margin: margin, pathImage: "assets/img/mountain.jpeg", icon: Icons.favorite_border,),
          CardImageWithFabIcon(margin: margin, pathImage: "assets/img/mountain_stars.jpeg", icon: Icons.favorite_border,),
          CardImageWithFabIcon(margin: margin, pathImage: "assets/img/river.jpeg", icon: Icons.favorite_border,),
          CardImageWithFabIcon(margin: margin, pathImage: "assets/img/sunset.jpeg", icon: Icons.favorite_border,),
        ],
      ),
    );
  }

}