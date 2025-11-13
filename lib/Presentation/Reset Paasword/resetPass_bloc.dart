import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Reset%20Pass/resetpass_data.dart';
import 'package:myapp/Service/reserpass_service.dart';

part 'resetPass_bloc.freezed.dart';

/// Event

sealed class ResetPassEvent {
  const ResetPassEvent();
}

enum Status { init, process, done, error }

class ResetPassRequestEvent extends ResetPassEvent {
  final String password;
  final String confirmPassword;
  final String token;
  final int bkms_id;

  const ResetPassRequestEvent({
    required this.password,
    required this.confirmPassword,
    required this.bkms_id,
    required this.token,
  });
}

/// State

@freezed
abstract class ResetPassState with _$ResetPassState {
  const factory ResetPassState({
    @Default(Status.init) Status status,
    @Default('') String message,
    ResetpassData? resetpassData,
  }) = _ResetPassState;
}

/// Bloc

@singleton
class ResetpassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final ReserpassService service;

  ResetpassBloc(this.service)
    : super(ResetPassState(status: Status.init, message: '')) {
    on<ResetPassRequestEvent>((event, emit) async {
      emit(state.copyWith(status: Status.process));

      final resp = await service.resetPass(
        password: event.password,
        confirmPassword: event.confirmPassword,
        token: 'wyxuwasFJtZtqiOgTaoGBthVDp6aVRuh',
        bkmsId: 359,
      );

      if (resp.isError) {
        emit(
          state.copyWith(
            message: (resp.asError?.error ?? '') as String,
            status: Status.error,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          status: Status.done,
          message: 'Password Reset Successfully',
        ),
      );
    });
  }
}
