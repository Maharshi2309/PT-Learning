import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Reset%20Pass/resetpass_data.dart';
import 'package:myapp/Service/resetpass_service.dart';

part 'resetPass_bloc.freezed.dart';

/// Event

final FlutterSecureStorage securedStorage = FlutterSecureStorage();

sealed class ResetPassEvent {
  const ResetPassEvent();
}

enum ResetStatus { initReset, processReset, doneReset, errorReset }

class ResetPassRequestEvent extends ResetPassEvent {
  final String password;
  final String confirmPassword;
  final String? token;
  final int? bkmsId;
  final bool? isChild;

  ResetPassRequestEvent({
    required this.password,
    required this.confirmPassword,
    this.bkmsId,
    this.token,
    this.isChild,
  });
}

/// State

@freezed
abstract class ResetPassState with _$ResetPassState {
  const factory ResetPassState({
    @Default(ResetStatus.initReset) ResetStatus status,
    @Default('') String message,
    ResetpassData? resetpassData,
  }) = _ResetPassState;
}

/// Bloc

@singleton
class ResetpassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final ResetpassService service;

  ResetpassBloc(this.service)
    : super(ResetPassState(status: ResetStatus.initReset, message: '')) {
    on<ResetPassRequestEvent>((event, emit) async {
      emit(state.copyWith(status: ResetStatus.processReset));

      final token = event.token ?? '';
      final bkmsId = event.bkmsId;

      print(
        "-------------------BLOC: token=${event.token}, userId=${event.bkmsId}",
      );

      if (token.isEmpty || bkmsId == null) {
        emit(
          state.copyWith(
            message: 'Missing reset token or user id',
            status: ResetStatus.errorReset,
          ),
        );
      }

      print(
        '===================>>>>>>>>>>>token=${event.token}, bkmsId=${event.bkmsId}, password=${event.password}',
      );

      final resp = await service.resetPass(
        password: event.password,
        confirmPassword: event.confirmPassword,
        token: token,
        bkmsId: bkmsId,
        isChild: event.isChild,
      );

      if (resp.isError) {
        emit(
          state.copyWith(
            message: (resp.asError?.error ?? '').toString(),
            status: ResetStatus.errorReset,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          status: ResetStatus.doneReset,
          message: 'Password Reset Successfully',
        ),
      );
    });
  }
}
