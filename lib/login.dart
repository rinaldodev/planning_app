import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> googleLogin() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  debugPrint("signed in " + user.displayName);
  return user;
}

Future<String> getLoggedUserName(callback) async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  callback.firebaseUser = firebaseUser.displayName;
  return firebaseUser.displayName;
}

Future<FirebaseUser> getLoggedUser(callback) async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  callback.firebaseUser = firebaseUser;
  return firebaseUser;
}
