import 'package:chat_app1/features/auth/data/auth_model/user_model.dart';
import 'package:chat_app1/features/auth/data/auth_repostitory/auth_repo.dart';
import 'package:chat_app1/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitAuth extends Cubit<AuthState>{
  FirebaseAuthRepository firebaseAuthRepository;
  CubitAuth({required this.firebaseAuthRepository}) : super(InitialState());

  Future<void> createdUser({
    required UserModel user,
    required String password})async{

    emit(AuthLoadingState());
    try{
      await firebaseAuthRepository
          .createUser(user:user,
          password: password
      );
      emit(AuthSuccessState());

    }catch(e){
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

    }catch(e){
      emit(AuthErrorState(msgError: e.toString()));
    }
  }

}