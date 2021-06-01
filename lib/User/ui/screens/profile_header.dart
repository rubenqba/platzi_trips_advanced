import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/User/bloc/user_bloc.dart';
import 'package:platzi_trips_advanced/User/model/app_user.dart';
import 'package:platzi_trips_advanced/User/ui/widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {

  late UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);

    return StreamBuilder(
      stream: _userBloc.authStatus,
      builder: _handleSessionStatus,
    );
  }


  Widget _showProfileData(AsyncSnapshot<User?> snapshot) {
    var _margin = EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 50.0
    );

    if (!snapshot.hasData || snapshot.hasError) {
      print("User not logged in");
      return Container(
        margin: _margin,
        child: Column(
          children: [
            Row(
              children: [
                CircularProgressIndicator(),
                Text("User is not logged in"),
              ],
            )
          ],
        ),
      );
    }
    AppUser user = AppUser(
      name: snapshot.data!.displayName!,
      email: snapshot.data!.email!,
      avatarUrl: snapshot.data!.photoURL!,
    );
    return Container(
      margin: _margin,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Profile',
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),
              )
            ],
          ),
          UserProfileInfo(user: user),
          ButtonsBar()
        ],
      ),
    );
  }


  Widget _handleSessionStatus(BuildContext context, AsyncSnapshot<User?> snapshot) {
    switch(snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return CircularProgressIndicator();
      case ConnectionState.active:
      case ConnectionState.done:
        return _showProfileData(snapshot);
    }
  }
}