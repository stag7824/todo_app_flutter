import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  final FirebaseAuth _firebaseAuth =  FirebaseAuth.instance;

  // get Currently Signed in User
  User? get currentUser => _firebaseAuth.currentUser;

  // Sign up with email and password
  Future<User?> signUp(String email, String password) async {
    try{
      final UserCredential userCredential= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }
    catch(e){
      print(e);
      return null;
    }
  } 
  // Sign in with email and passowrd
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential=await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}