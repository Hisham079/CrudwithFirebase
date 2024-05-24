import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw 'The email address is not valid.';
        case 'user-disabled':
          throw 'This user has been disabled.';
        case 'user-not-found':
          throw 'No user found for that email.';
        case 'wrong-password':
          throw 'Wrong password provided for that user.';
        default:
          throw 'An unknown error occurred. Please try again.';
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print('${e.toString()}');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await auth.signOut();
  }

  // Get current user
  User? get currentUser {
    return auth.currentUser;
  }
}
