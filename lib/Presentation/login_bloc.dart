import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/Model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Service/auth_service.dart';
import 'package:injectable/injectable.dart';

part 'login_bloc.freezed.dart';

/// Event

sealed class LoginEvent {
  const LoginEvent();
}

enum Status { init, process, done, error }

enum LoginStatus { loggedin, loggedOut, checking }

class rememberMe extends LoginEvent {
  const rememberMe();
}

class performLogin extends LoginEvent {
  final String bkmsId;
  final String email;
  final String password;
  final bool rememberMe;

  performLogin({
    required this.bkmsId,
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}

/// State
@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    @Default(LoginStatus.checking) LoginStatus loginStatus,
    @Default(Status.init) Status status,
    @Default('') String message,
    User? user,
  }) = _LoginState;
}

/// Bloc

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService service;

  LoginBloc(this.service)
    : super(LoginState(status: Status.init, message: '')) {
    on<rememberMe>((event, emit) async {
      emit(state.copyWith(loginStatus: LoginStatus.checking));

      final resp = await service.rememberMe();
      if (resp.isError) {
        emit(state.copyWith(loginStatus: LoginStatus.loggedOut));
      }

      final user = resp.asValue!.value;
      emit(state.copyWith(loginStatus: LoginStatus.loggedin, user: user));
    });

    on<performLogin>((event, emit) async {
      emit(state.copyWith(status: Status.process));

      final response = await service.login(
        bkmsId: event.bkmsId,
        email: event.email,
        password: event.password,
        rememberMe: event.rememberMe,
      );

      if (response.isError) {
        emit(
          state.copyWith(
            message: (response.asError?.error ?? '') as String,
            status: Status.error,
          ),
        );
        return;
      }
      emit(state.copyWith(status: Status.done, message: 'Login Success'));
      return;
    });
  }
}
