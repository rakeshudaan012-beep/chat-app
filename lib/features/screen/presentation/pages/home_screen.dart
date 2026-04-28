import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:chat_app1/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app1/features/screen/presentation/pages/add_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(onPressed:()async{
            var prefs=await SharedPreferences.getInstance();
            prefs.setString(FirebaseAuthRepository.prefKey, '') ;
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
          } , icon:Icon(Icons.exit_to_app,color: Colors.white,))
        ],
      ),body:Container(),
      floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContactPage()));
    },child: Icon(Icons.add),),
    );
  }
}
