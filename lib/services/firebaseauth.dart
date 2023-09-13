
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mychatproject/data%20models/usermodel.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserStreamDataModel? _usermodel (User? user){
    return user!=null? UserStreamDataModel(uid: user.uid) : null; 
  }
  //user data stream for wrapper widget
  Stream<UserStreamDataModel?> get userStream {
    return _auth.authStateChanges().map((event) => _usermodel(event));
  }
  //signing in with google
  dynamic signInWithGoogle() async {
    try{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    UserCredential result = await _auth.signInWithCredential(credential);
    User? user = result.user;
    if(user==null){
      return "Log in Failed";
    }
    return "Welcome ${user.displayName}";
    } on FirebaseAuthException catch (e) {
      print("Login Error:${e.message}");
       return e.message;
    }
  }
  //sign out from google
  void signOutAccount() async {
    try{
    await _auth.signOut();
    await GoogleSignIn().signOut();
    }catch(e){
      print(e);
    }
  }
}