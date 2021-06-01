import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_advanced/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_advanced/User/bloc/user_bloc.dart';
import 'package:platzi_trips_advanced/User/ui/widgets/circle_button.dart';

class ButtonsBar extends StatelessWidget {
  late UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            CircleButton(mini: true, icon: Icons.vpn_key, iconSize: 20.0, color: Color.fromRGBO(255, 255, 255, 0.6), onPress: _changePassword,),
            CircleButton(icon: Icons.add, iconSize: 40.0, color: Color.fromRGBO(255, 255, 255, 1), onPress: () => _add(context),),
            CircleButton(mini: true, icon: Icons.exit_to_app, iconSize: 20.0, color: Color.fromRGBO(255, 255, 255, 0.6), onPress: _signOut,),
          ],
        )
    );
  }


  void _changePassword() {

  }

  void _add(BuildContext context) {
    var picker = ImagePicker();
    picker.getImage(source: ImageSource.camera)
      .then((image) {
        if (image != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPlaceScreen(image: File(image.path)),));
        }
        throw("No image added");
      })
      .catchError((error) => print(error));

  }

  void _signOut() {
    _userBloc.signOut();
  }
}