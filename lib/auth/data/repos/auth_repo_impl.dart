import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapplicationadvanced/auth/data/models/user_model.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo.dart';

class FirebaseAuthService extends AuthRepo {
  FirebaseAuthService({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<UserCredential> login({
    required UserModel user,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<UserCredential> signup({
    required UserModel user,
  }) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google sign in cancelled');
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    print('Executing signOut in FirebaseAuthService');
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print('Google sign out error: $e');
    }
    await _firebaseAuth.signOut();
  }
}
