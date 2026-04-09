import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:chat_app1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app1/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_)=>CubitAuth(firebaseAuthRepository:FirebaseAuthRepository()
        ),)
      ], child: MyApp())
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.mRoutes,
    );
  }
}