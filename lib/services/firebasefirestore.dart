import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychatproject/data%20models/usermodel.dart';

class FireStoreClass {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get _currentuser => _auth.currentUser;
  Stream<QuerySnapshot<Map<String, dynamic>>> get userLists {
    return _firestore.collection("users").snapshots();
  }

  // return bool after checking if the userdata exists with his uid or not?
  Future<bool> _userExists() async {
    return (await _firestore.collection("users").doc(_currentuser!.uid).get())
        .exists;
  }
  // creating a new user based on above _userExists result;
  Future<String?> createNewUser() async {
    bool history = await _userExists();
    print("User exists: $history");
    if (!history) {
      try{
      const time = DateTime.fromMillisecondsSinceEpoch;
      final myData = UserModel(
        createdAt: time.toString(),
        image: _currentuser!.photoURL.toString(),
        lastActive: time.toString(),
        about: 'Hey There!',
        name: _currentuser!.displayName ?? "Default Username",
        isOnline: true,
        id: _currentuser!.uid, pushToken: '', email: _currentuser!.email!,
      );
      await _firestore.collection("users").doc(_auth.currentUser!.uid).set(myData.toJson());
      return null;
      } on FirebaseException catch(e){ 
        return e.message!;
      }
  }
  return null;
}
}