import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/Model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Service/auth_service.dart';
import 'package:injectable/injectable.dart';


part 'login_bloc.freezed.dart';


/// Event

sealed class LoginEvent {
  const LoginEvent();
}

enum Status { init, process, done, error }

class performLogin extends LoginEvent {
  final String bkmsId;
  final String email;
  final String password;

  performLogin({
    required this.bkmsId,
    required this.email,
    required this.password,
  });
}

/// State
@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    @Default(Status.init) Status status,
    @Default('') String message,
    User? user,
  }) = _LoginState;
}



/// Bloc

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthService service;

  LoginBloc(this.service): super(LoginState(status: Status.init, message: '')){
    on<performLogin>((event, emit) async{
      emit(state.copyWith(status: Status.process));

      final response = await service.login(
        bkmsId: event.bkmsId, 
        email: event.email, 
        password: event.password);

        if (response.isError) {
          emit(state.copyWith(message: (response.asError?. error ?? '') as String,
          status: Status.error,
          ));
          return;
        }
        emit(state.copyWith(status: Status.done, message: 'Login Success'));
        return;
    });
    
  }
}