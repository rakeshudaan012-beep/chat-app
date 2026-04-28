abstract class GetState{}
class InitialState extends GetState{}
class GetLoadingState extends GetState{}
class GetSuccessState extends GetState{}
class GetErrorState extends GetState{
  final String msgError;
  GetErrorState({required this.msgError});
}