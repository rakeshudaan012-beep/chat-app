import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Contacts'),
      ),body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
        future: FirebaseAuthRepository.getAllContacts(),
        builder: (_,snapshots){
        if(snapshots.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshots.hasError){
          return Center(
            child: Text('Failed to get contacts'),
          );
        }
        if(snapshots.hasData){
          return ListView.builder(
            itemCount: snapshots.data!.docs.length
              ,itemBuilder: (context,index){
              var current=snapshots.data!.docs[index];
              print('data $current');
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding:const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(current.data()['name'] ?? 'No name'),
                    subtitle: Text(current.data()['email'] ?? 'No Email'),
                    trailing: Text(current.data()['phoneNumber'] ?? 'No phone'),
                  ),
                ),
              ),
            );
          });
        }
        return Container();
    }),
    );
  }
}
