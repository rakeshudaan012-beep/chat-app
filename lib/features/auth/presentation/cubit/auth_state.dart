abstract class AuthState{}
class InitialState extends AuthState{}
class AuthLoadingState extends AuthState{}
class AuthSuccessState extends AuthState{}
class AuthErrorState extends AuthState{
  final String msgError;
  AuthErrorState({required this.msgError});
}