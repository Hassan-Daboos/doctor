import 'package:firebase_auth/firebase_auth.dart';

class Authentication {

  static Future<String?> mailSignIn(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pwd)
          .then((value) {

      var uid=  FirebaseAuth.instance.currentUser!.uid;
      print(uid);
      })
          ;

      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }}
