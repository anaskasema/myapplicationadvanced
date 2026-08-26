import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapplicationadvanced/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<UserCredential> login({
    required UserModel user,
  });

  Future<UserCredential> signup({
    required UserModel user,
  });

  Future<UserCredential> signInWithGoogle();

  Future<void> signOut();
}
