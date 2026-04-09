import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth_model/user_model.dart';

class FirebaseAuthRepository {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static const String usersCollection = 'users';
  static const String prefKey='prefKey';

  Future<void> createUser({required UserModel user, required String password})async{
    try{
      var userCred=await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email,
          password: password
      );
      if(userCred.user !=null){
        await firebaseFirestore
            .collection(usersCollection)
            .doc(userCred.user!.uid)
            .set(user.toMap());

      }
    }on FirebaseAuthException{
      throw Exception('Failed to create user');
    }
    catch(e){
      rethrow;
    }
  }

}