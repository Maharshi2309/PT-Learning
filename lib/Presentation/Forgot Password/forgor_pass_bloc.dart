import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Forgot%20Pass/forgotPass_data.dart';
import 'package:myapp/Service/forgotPass_service.dart';

part 'forgor_pass_bloc.freezed.dart';

/// Event
sealed class ForgorPassEvent {
  const ForgorPassEvent();
}

enum Status { init, process, done, error }

class ForgotPassRequestEvent extends ForgorPassEvent {
  final String bkmsId;
  final String email;
  const ForgotPassRequestEvent({required this.bkmsId, required this.email});
}

/// State

@freezed
abstract class ForgotPassState with _$ForgotPassState {
  const factory ForgotPassState({
    @Default(Status.init) Status status,
    @Default('') String message,
    ForgotpassData? forgotpassData,
  }) = _ForgotPassState;
}

/// Bloc
@singleton
class ForgorPassBloc extends Bloc<ForgorPassEvent, ForgotPassState> {
  final ForgotpassService service;

  ForgorPassBloc(this.service)
    : super(ForgotPassState(status: Status.init, message: '')) {
    on<ForgotPassRequestEvent>((event, emit) async {
      emit(state.copyWith(status: Status.process));

      final resp = await service.forgorPass(
        bkmsId: event.bkmsId,
        email: event.email,
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
        state.copyWith(status: Status.done, message: 'Mail Sent Successfully'),
      );
      return;
    });
  }
}
