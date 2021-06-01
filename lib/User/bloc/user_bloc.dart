import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_advanced/Place/model/place.dart';
import 'package:platzi_trips_advanced/User/model/app_user.dart';
import 'package:platzi_trips_advanced/User/repository/auth_repository.dart';
import 'package:platzi_trips_advanced/User/repository/cloud_firebase_repository.dart';

class UserBloc implements Bloc {

  final AuthRepository _authRepository = AuthRepository();
  final CloudStorageRepository _storageRepository = CloudStorageRepository();
  final Stream<User?> _streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => _streamFirebase;

  Future<User> signIn() => _authRepository.signInFirebase();

  signOut() => _authRepository.signOut();

  Future<void> updateUser(AppUser user) => _storageRepository.updateUser(user);
  Future<void> updatePlace(Place place) => _storageRepository.updatePlace(place);

  @override
  void dispose() {
    // TODO: implement dispose
  }

}