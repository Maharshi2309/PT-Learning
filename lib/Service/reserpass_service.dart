import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:dio_curl_interceptor/dio_curl_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Reset%20Pass/resetpass_data.dart';
import 'package:myapp/Model/Reset%20Pass/resetpass_request.dart';
import 'package:myapp/Repository/resetpass_repo.dart';

@singleton
class ReserpassService {
  Future<Result<ResetpassData>> resetPass({
    required String password,
    required String confirmPassword,
    required String token,
    required int bkmsId,
  }) async {
    final repo = ResetpassRepo(Dio()..interceptors.add(CurlInterceptor()));
    try {
      final requestData = await repo.resetPass(
        ResetpassRequest(password: password, confirmPassword: confirmPassword,token: token,
          bkmsId: bkmsId,
          ),
      );
      return Result.value(requestData);
    } catch (e) {
      if (e is DioException) {
        final resetpassresponse = e.response?.data;
        final message = resetpassresponse['message'];
        if (message != null) return Result.error(message);
      }
      return Result.error('Something went wrong');
    }
  }
}
