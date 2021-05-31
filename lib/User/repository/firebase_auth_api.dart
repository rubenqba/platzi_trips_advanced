import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<auth.User> signIn() async {
    return _googleSignIn.signIn()
      .then((googleAccount) => googleAccount != null ? googleAccount.authentication : throw("authentication error"))
      .then((authentication) => _auth.signInWithCredential(
        auth.GoogleAuthProvider.credential(
            idToken: authentication.idToken,
            accessToken: authentication.accessToken
        )))
      .then((authResult) => authResult.user!);
  }
}