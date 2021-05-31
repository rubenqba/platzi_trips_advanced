import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
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
            CircleButton(icon: Icons.vpn_key, iconSize: 20.0, color: Color.fromRGBO(255, 255, 255, 0.6), onPress: _changePassword,),
            CircleButton(mini: false, icon: Icons.add, iconSize: 40.0, color: Color.fromRGBO(255, 255, 255, 1), onPress: _add,),
            CircleButton(icon: Icons.exit_to_app, iconSize: 20.0, color: Color.fromRGBO(255, 255, 255, 0.6), onPress: _signOut,),
          ],
        )
    );
  }


  void _changePassword() {

  }

  void _add() {

  }

  void _signOut() {
    _userBloc.signOut();
  }
}