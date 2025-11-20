import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/Model/Login/login.dart';
import 'package:myapp/Model/Login/user.dart';
import 'package:myapp/Repository/auth_repo.dart';
import 'package:dio_curl_interceptor/dio_curl_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@singleton
class AuthService {
  static String userKey = '_user';
  final securedStorage = FlutterSecureStorage();

  Future<Result<User>> login({
    required String bkmsId,
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final repo = AuthRepo(Dio()..interceptors.add(CurlInterceptor()));
    try {
      final user = await repo.login(
        LoginRequest(bkmsId: bkmsId, email: email, password: password),
      );
      if (rememberMe) {
        await securedStorage.write(
          key: userKey,
          value: jsonEncode(user.toJson()),
        );
      }

      return Result.value(user);
    } catch (e) {
      if (e is DioException) {
        final response = e.response?.data;
        final message = response['message'];
        if (message != null) return Result.error(message);
      }
      return Result.error('Something went Wrong');
    }
  }

  Future<Result<User>> rememberMe() async {
    final data = await securedStorage.read(key: userKey);
    if (data != null) {
      final user = User.fromJson(jsonDecode(data));
      
      return Result.value(user);
    }

    return Result.error('User Not Found');
  }

  Future logOut() async {
    await securedStorage.delete(key: userKey);
    return null;
  }
}
