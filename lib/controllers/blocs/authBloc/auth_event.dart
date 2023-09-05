// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  final String password;
  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;

  final String password;
  final String name;
  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignOutEvent extends AuthEvent {}
