// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti/services/fairebaseAuth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is LoginEvent) {
          emit(LoadingLogin());
          try {
            await firebaseAuth().loginUser(
              email: event.email,
              password: event.password,
            );
            emit(LoadedLogin());
          } on FirebaseAuthException catch (e) {
            emit(ErrorLogin(message: e.message.toString()));
          } catch (e) {
            emit(ErrorLogin(message: e.toString()));
          }
        } else if (event is RegisterEvent) {
          emit(LoadingRegister());
          try {
            await firebaseAuth().create_user(
              email: event.email,
              password: event.password,
              name: event.name,
            );
            emit(LoadedRegister());
          } on FirebaseAuthException catch (e) {
            emit(ErrorRegister(message: e.message.toString()));
          } catch (e) {
            emit(ErrorRegister(message: e.toString()));
          }
        } else if (event is SignOutEvent) {
          emit(LoadingSignOut());
          try {
            await firebaseAuth().sighOut();

            emit(LoadedSignOut());
          } on FirebaseAuthException catch (e) {
            emit(ErrorSignOut(message: e.message.toString()));
          } catch (e) {
            emit(ErrorRegister(message: e.toString()));
          }
        }
      },
    );
  }
}
