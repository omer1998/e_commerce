
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase{
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<User?> createUserWithEmailAndPassword(String email, String password);
  get currentUser;
  Stream<User?> authStateChanges();
  Future<void> signOut();
  
}

class MyFirebaseAuth implements AuthBase{
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }


  @override
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }
  
  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
  
  @override
  get currentUser => _firebaseAuth.currentUser;
  
  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}