import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth_model/user_model.dart';

class FirebaseAuthRepository {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static const String usersCollection = 'users';
  static const String messagesCollection = 'messages';
  static const String prefKey='prefKey';


  ///Create User
  Future<void> createUser({required UserModel user, required String password})async{
    try{
      var userCred=await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email,
          password: password
      );
      if(userCred.user !=null){

        final uid=userCred.user!.uid;
        await firebaseFirestore
            .collection(usersCollection)
            .doc(userCred.user!.uid)
            .set({
          ...user.toMap(),
          'uid': uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        });

      }
    }on FirebaseAuthException {
      rethrow;
    }
    catch(e){
      rethrow;
    }
  }


  ///Login User
  Future<void> loginUser({required String email, required String password}) async{
    try{

      var login= await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(login.user !=null){
        var prefs=await SharedPreferences.getInstance();
        prefs.setString(prefKey, login.user!.uid) ;
      }


    }on FirebaseAuthException{
      rethrow;
    }
    catch(e){
      rethrow;
    }
  }


  ///getUsers
  static Future<QuerySnapshot<Map<String,dynamic>>> getAllContacts()async{
    try{
      return await firebaseFirestore
          .collection(usersCollection)
          .get();
    }on FirebaseException{
      throw Exception('Failed to get contacts');
    }
    catch(e){
      rethrow;
    }
  }
}