import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';


abstract class BaseAuth {
Future<String> signinwithe_p(String email, String pass);
Future<String> createide_p(String email, String pass);
}

class Auth implements BaseAuth {
  Future<String> signinwithe_p(String email, String pass) async {

    AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);

    return user.user.uid;

  }
  Future<String> createide_p(String email, String pass) async {

    AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);

    return user.user.uid;

  }

}