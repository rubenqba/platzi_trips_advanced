import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_advanced/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthApi = FirebaseAuthAPI();

  Future<User> signInFirebase() => _firebaseAuthApi.signIn();
}