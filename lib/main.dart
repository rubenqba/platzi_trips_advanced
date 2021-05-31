import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/Place/bloc/bloc_place.dart';
import 'package:platzi_trips_advanced/User/bloc/user_bloc.dart';
import 'package:platzi_trips_advanced/User/ui/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("something went wrong");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return _app(context);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }

  Widget _app(BuildContext context) {
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
