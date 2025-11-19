import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:dio_curl_interceptor/dio_curl_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Forgot%20Pass/forgotPass_data.dart';
import 'package:myapp/Model/Forgot%20Pass/forgot_pass.dart';
import 'package:myapp/Repository/forgotpass_repo.dart';

@singleton
class ForgotpassService {
  static String tokenKey = '_token';
  final securedStorage = FlutterSecureStorage();
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
        final token = forgotpassresponese['data']['reset_token'];

        if (token != null) {
          await securedStorage.write(key: tokenKey, value: token);
        }
        if (message != null) return Result.error(message);
      }

      return Result.error('Somthing went wrong');
    }
  }
}
