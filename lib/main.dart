import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/Place/bloc/bloc_place.dart';
import 'package:platzi_trips_advanced/User/bloc/bloc_user.dart';
import 'package:platzi_trips_advanced/User/ui/screens/sign_in_screen.dart';
import 'platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: BlocProvider(
          child: MaterialApp(
            title: 'Flutter Demo',
            home: SignInScreen(),
          ),
          bloc: PlaceBloc(),
        ),
        bloc: UserBloc()
    );
  }
}
