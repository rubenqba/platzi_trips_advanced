import 'package:flutter/material.dart';
import 'package:platzi_trips_advanced/widgets/button_green.dart';
import 'package:platzi_trips_advanced/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return _signInGoogleUI();
  }

  Widget _signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", null),
          Column(
            children: [
              Text(
                "Welcome\n This is your travel app",
                style: TextStyle(
                  fontSize: 37,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(text: "Login with Gmail", callback: (){}, width: 300, heigth: 50,)
            ],
          )
        ],
      ),
    );
  }
}
