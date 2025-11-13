import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:dio_curl_interceptor/dio_curl_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Forgot%20Pass/forgotPass_data.dart';
import 'package:myapp/Model/Forgot%20Pass/forgot_pass.dart';
import 'package:myapp/Repository/forgotpass_repo.dart';

@singleton
class ForgotpassService {
  Future<Result<ForgotpassData>> forgorPass({
    required String bkmsId,
    required String email,
  }) async {
    final repo = ForgotpassRepo(Dio()..interceptors.add(CurlInterceptor()));
    try {
      final requestData = await repo.forgorPass(
        ForgotPassRequest(bkmsId: bkmsId, email: email),
      );
      return Result.value(requestData);
    } catch (e) {
      if (e is DioException) {
        final forgotpassresponese = e.response?.data;
        final message = forgotpassresponese['message'];
        if (message != null) return Result.error(message);
      }

      return Result.error('Somthing went wrong');
    }
  }
}
