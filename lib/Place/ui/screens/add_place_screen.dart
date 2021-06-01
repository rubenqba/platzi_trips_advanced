
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/Place/model/place.dart';
import 'package:platzi_trips_advanced/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_advanced/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_advanced/User/bloc/user_bloc.dart';
import 'package:platzi_trips_advanced/widgets/button_purple.dart';
import 'package:platzi_trips_advanced/widgets/gradient_back.dart';
import 'package:platzi_trips_advanced/widgets/text_input.dart';
import 'package:platzi_trips_advanced/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

  final File image;

  const AddPlaceScreen({Key? key, required this.image}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  @override
  Widget build(BuildContext context) {
    var formMargin = EdgeInsets.only(top: 20, bottom: 20);
    final _controllerTitle = TextEditingController();
    final _controllerDescription = TextEditingController();

    UserBloc userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25, left: 5),
                child: SizedBox.fromSize(
                  size: Size.square(45),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                    child: TitleHeader(title: "Add a new place",),
                  )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    icon: Icons.camera_alt,
                    width: 350,
                    height: 250,
                  ),
                ),
                Container(
                  margin: formMargin,
                  child: TextInput(
                    hint: "Title",
                    controller: _controllerTitle,
                  ),
                ),
                TextInput(
                    hint: "Description",
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescription,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextInputLocation(
                      hint: "Add location",
                      icon: Icons.location_on,
                      controller: _controllerDescription
                  ),
                ),
                Container(
                  width: 70,
                  child: ButtonPurple(
                    text: "Add place",
                    callback: () {
                      // firebase storage
                      // get storage url

                      // cloud firestore
                      // create place
                      userBloc.updatePlace(Place(
                          name: _controllerTitle.text,
                          description: _controllerDescription.text,
                          imageUrl: "",
                          likes: 0,
                          owner: null
                      ))
                      .whenComplete(() => Navigator.pop(context));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
