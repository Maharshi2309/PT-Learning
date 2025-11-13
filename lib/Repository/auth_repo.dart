import 'package:dio/dio.dart';
import 'package:myapp/Model/Login/login.dart';
import 'package:myapp/Model/Login/user.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repo.g.dart';

@RestApi(baseUrl: 'https://bk-qa.baps.dev/bkms-api/v2')

abstract class AuthRepo {
  factory AuthRepo(Dio dio, {String? baseUrl}) = _AuthRepo;

  @POST('/auth/login')
  Future<User> login(@Body() LoginRequest request);
}
