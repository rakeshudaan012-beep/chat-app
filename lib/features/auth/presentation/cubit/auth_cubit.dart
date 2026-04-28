import 'package:chat_app1/features/auth/data/auth_model/user_model.dart';
import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:chat_app1/features/auth/presentation/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitAuth extends Cubit<AuthState>{
  FirebaseAuthRepository firebaseAuthRepository;
  CubitAuth({required this.firebaseAuthRepository}) : super(InitialState());

  Future<void> createdUser({
    required UserModel user,
    required String password})async{

    emit(AuthLoadingState());
    try{
      await firebaseAuthRepository.createUser(user:user,
          password: password
      );
      emit(AuthSuccessState());

    }on FirebaseAuthException catch(e){
      if(e.code =='email-already-in-use'){
        emit(AuthErrorState(msgError: 'User already exists'));
      }else if(e.code =='weak password'){
        emit(AuthErrorState(msgError: 'Password is to weak '));
      }else if(e.code== 'invalid-email'){
        emit(AuthErrorState(msgError: 'Invalid Email'));
      }else{
        emit(AuthErrorState(msgError: 'Something went wrong!!'));
      }
    }
    catch(e){
      emit(AuthErrorState(msgError: e.toString()));
    }
  }


  Future<void> loginUser({required String email ,required String pass})async{
    emit(AuthLoadingState());

    try{
      await firebaseAuthRepository.loginUser(
          email: email,
          password: pass
      );

      emit(AuthSuccessState());

    }on FirebaseException catch(e){
      if(e.code=='user-not-found'){
        emit(AuthErrorState(msgError: 'User not found'));
      }else if(e.code =='invalid-email'){
        emit(AuthErrorState(msgError: 'invalid-email'));
      }else if(e.code =='invalid-credential'){
        emit(AuthErrorState(msgError: 'Invalid email or password'));
      }else{
        emit(AuthErrorState(msgError: 'Something went wrong!!'));
      }
    }
    catch(e){
      emit(AuthErrorState(msgError: e.toString()));
    }
  }

}