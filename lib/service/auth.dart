import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thryv/model/user.model.dart';
import 'package:thryv/service/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthUser? _userFromFirebaseUser(User? user) {
    return user != null ? AuthUser(uid: user.uid) : null;
  }

  Stream<AuthUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signIn(String email, String pw) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pw);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.toString();
    }
  }
  // register with email and pw

  Future registerWithEmailAndPw(String email, String pw) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pw);
      User? user = result.user;
      var editedUser = DatabaseService.defaultUser;
      editedUser["email"] = email;
      DatabaseService(uid: user!.uid).updateUserData(editedUser);

      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.toString();
    }
  }

  Future signInWithGoogle() async {
    try {
      final gUser = await GoogleSignIn(scopes: ["profile", "email"]).signIn();
      final gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final cred = await _auth.signInWithCredential(credential);
      final user = cred.user;

      final userData = await DatabaseService(uid: user!.uid).getData();

      if (userData == null) {
        var editedUser = DatabaseService.defaultUser;
        editedUser["email"] = user.email ?? "";
        DatabaseService(uid: user.uid).updateUserData(editedUser);
      }

      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.toString();
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
