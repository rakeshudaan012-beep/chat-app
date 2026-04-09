import 'package:chat_app1/features/auth/data/auth_model/user_model.dart';
import 'package:chat_app1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app1/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                /// Name
                TextFormField(
                  validator: (value) {
                    if (value==null || value.trim().isEmpty) {
                      return "Name required";
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                /// Email
                TextFormField(
                  validator: (value) {
                    if(value==null || value.trim().isEmpty){
                      return "Email required";
                    }
                    if(!emailRegex.hasMatch(value)){
                      return "Enter valid email";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                ///Number
                TextFormField(
                  validator: (value) {
                    if(value==null || value.trim().isEmpty) {
                      return "Mobile number is required";
                    }
                    if(value.length!=10){
                      return "Enter valid mobile number";
                    }
                    return null;
                  },
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                /// Password
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Password required";
                    }
                    if(value.length<6){
                      return "Minimum 6 characters";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                /// Confirm Password
                TextFormField(
                  validator: (value) {
                    if(value ==null || value.isEmpty){
                      return "Confirm Password required";
                    }
                    if(value != passwordController.text){
                      return "Password does not match";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: DecoratedBox(decoration:BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),child: BlocConsumer<CubitAuth,AuthState>(builder: (context,state){
                    if(state is AuthLoadingState){
                      return ElevatedButton(
                          onPressed: null, child: Row(
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
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ), onPressed: (){
                      if(_formKey.currentState!.validate()){
                        context.read<CubitAuth>().createdUser(
                          user: UserModel(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            phoneNumber: phoneNumberController.text.trim()
                          ),
                          password: passwordController.text.trim(),
                        );
                      }
                    }, child: Text('Creating Account',style: TextStyle(fontSize: 20,color: Colors.white),));
                  }, listener: (context,state){
                    if(state is AuthSuccessState){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Account Created Successfully"),backgroundColor: Colors.green,),
                      );
                      Navigator.pop(context);
                    }

                    if(state is AuthErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Failed to create account"),backgroundColor: Colors.red,),
                      );
                    }
                  }),),
                ),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login'),
                    )
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