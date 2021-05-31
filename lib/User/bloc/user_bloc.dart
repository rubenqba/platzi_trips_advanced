import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/User/repository/auth_repository.dart';

class UserBloc implements Bloc {

  final _authRepository = AuthRepository();
  final Stream<User?> _streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => _streamFirebase;

  Future<User> signIn() {
    return _authRepository.signInFirebase();
  }

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}