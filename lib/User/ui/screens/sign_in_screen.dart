import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/User/bloc/user_bloc.dart';
import 'package:platzi_trips_advanced/User/model/app_user.dart';
import 'package:platzi_trips_advanced/platzi_trips_cupertino.dart';
import 'package:platzi_trips_advanced/widgets/button_green.dart';
import 'package:platzi_trips_advanced/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  late UserBloc userBloc;
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenSize = MediaQuery.of(context).size;
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
     return StreamBuilder(
       stream: userBloc.authStatus,
       builder: (context, snapshot) {
         if (!snapshot.hasData || snapshot.hasError) {
           return _signInGoogleUI();
         }
         return PlatziTripsCupertino();
       },
     );
  }

  Widget _signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Container(
                    width: screenSize.width,
                    child: Text(
                      "Welcome\nThis is your travel app",
                      style: TextStyle(
                          fontSize: 37,
                          fontFamily: "Lato",
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              ButtonGreen(
                text: "Login with Gmail",
                callback: () {
                  userBloc.signOut();
                  userBloc.signIn()
                      .then((user) => AppUser(uid: user.uid, name: user.displayName!, email: user.email!, avatarUrl: user.photoURL!))
                      .then((user) => userBloc.updateUser(user));
                },
                width: 300,
                heigth: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
