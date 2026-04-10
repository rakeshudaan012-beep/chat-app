import 'dart:async';
import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:chat_app1/features/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async{

      var prefs=await SharedPreferences.getInstance();
      String? value=prefs.getString(FirebaseAuthRepository.prefKey);

      Widget nextPage=LoginPage();

      if(value!=null && value!=''){
        nextPage=HomeScreen();
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextPage),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// Logo (optional)
            Icon(
              Icons.flutter_dash,
              size: 100,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              "My App",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}