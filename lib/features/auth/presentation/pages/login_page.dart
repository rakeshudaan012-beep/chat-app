import 'package:chat_app1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app1/features/auth/presentation/cubit/auth_state.dart';
import 'package:chat_app1/features/auth/presentation/pages/sing_up.dart';
import 'package:chat_app1/features/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                /// Email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email required";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                /// Password
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 25),

                /// Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child:BlocConsumer<CubitAuth,AuthState>(
                      builder: (_,state){
                        if(state is AuthLoadingState){
                          return ElevatedButton(
                              onPressed: null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Creating Account',style: TextStyle(fontSize: 20,color: Colors.white),),

                              SizedBox(width: 11,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: CircularProgressIndicator(color: Colors.white,),
                              ),
                            ],
                          ));
                        }
                        
                        return ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            context.read<CubitAuth>().loginUser(
                              email: emailController.text.trim(),
                              pass: passwordController.text.trim(),
                            );
                          }
                        }, child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.black),)
                        );
                      },
                      listener: (_,state){
                        if(state is AuthSuccessState){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account Login Successfully"),backgroundColor: Colors.green,),
                          );
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }

                        if(state is AuthErrorState){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Failed to Login account"),backgroundColor: Colors.red,),
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    }, child: Text('Sing-in'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}