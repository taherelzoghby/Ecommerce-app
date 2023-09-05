// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//Login
class LoadingLogin extends AuthState {}

class LoadedLogin extends AuthState {}

class ErrorLogin extends AuthState {
  final String message;

  ErrorLogin({required this.message});
}

//Register
class LoadingRegister extends AuthState {}

class LoadedRegister extends AuthState {}

class ErrorRegister extends AuthState {
  final String message;
  ErrorRegister({required this.message});
}

//Signout
class LoadingSignOut extends AuthState {}

class LoadedSignOut extends AuthState {}

class ErrorSignOut extends AuthState {
  final String message;
  ErrorSignOut({required this.message});
}
