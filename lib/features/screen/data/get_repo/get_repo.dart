import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:chat_app1/features/screen/data/get_model/contact_get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseGetRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  FirebaseGetRepo({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;
  Future<List<UserGetModel>> getAllContacts() async {
    try {
      final currentUid = _auth.currentUser?.uid;

      final snapshot = await _firestore
          .collection(FirebaseAuthRepository.usersCollection)
          .get();

      debugPrint('📦 Total users in Firestore: ${snapshot.docs.length}');
      debugPrint('👤 Current user UID: $currentUid');

      final contacts = snapshot.docs
          .where((doc) => doc.id != currentUid)
          .map((doc) {
        final data = {...doc.data(), 'uid': doc.id};
        return UserGetModel.fromMap(data);
      })
          .toList();

      debugPrint('✅ Contacts after filtering self: ${contacts.length}');
      return contacts;
    } on FirebaseException catch (e) {
      debugPrint('🔥 Firebase error in getAllContacts: '
          '[${e.code}] ${e.message}');
      rethrow;
    } catch (e, stack) {
      debugPrint('❌ Unexpected error in getAllContacts: $e');
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }
}