// import 'package:firebase_auth/firebase_auth.dart';

// class Authserv {
//   final FirebaseAuth _firebaseAuth;
//   Authserv(this._firebaseAuth);

//   Future<String?> signIn(
//       {required String email, required String password}) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return "Signed in";
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return ('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         return ('Wrong password provided for that user.');
//       } else {
//         return e.message;
//       }
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      } else {
        return e.message;
      }
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
