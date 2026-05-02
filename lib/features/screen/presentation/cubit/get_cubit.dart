import 'package:chat_app1/features/screen/data/get_repo/get_repo.dart';
import 'package:chat_app1/features/screen/presentation/cubit/get_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCubit extends Cubit<GetState>{
  FirebaseGetRepo firebaseAuthRepository;
  GetCubit({required this.firebaseAuthRepository}): super(InitialState());

  Future<void> getContacts()async{
    emit(GetLoadingState());
    debugPrint('Loading');
    try{
      //print('Data trigger1');
      final data=await firebaseAuthRepository.getAllContacts();
      debugPrint('✅ Contacts loaded: ${data.length}');

      emit(GetSuccessState(userModel: data));

    }catch(e){
      emit(GetErrorState(msgError: e.toString()));
    }
  }
}