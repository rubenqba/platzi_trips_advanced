import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  Future<auth.User> signIn() async {
    return _googleAuth.signIn()
      .then((googleAccount) => googleAccount != null ? googleAccount.authentication : throw("authentication error"))
      .then((authentication) => _firebaseAuth.signInWithCredential(
        auth.GoogleAuthProvider.credential(
            idToken: authentication.idToken,
            accessToken: authentication.accessToken
        )))
      .then((authResult) => authResult.user!);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut().then((value) => print("firebase session closed!!"));
    await _googleAuth.signOut().then((value) => print("google session closed!!"));
  }
}