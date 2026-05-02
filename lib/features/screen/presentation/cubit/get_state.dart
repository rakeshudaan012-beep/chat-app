import 'package:chat_app1/features/screen/data/get_model/contact_get.dart';

abstract class GetState{}
class InitialState extends GetState{}
class GetLoadingState extends GetState{}
class GetSuccessState extends GetState{
  final List<UserGetModel> userModel;
  GetSuccessState({required this.userModel});
}
class GetErrorState extends GetState{
  final String msgError;
  GetErrorState({required this.msgError});
}