import 'package:dio/dio.dart';
import 'package:myapp/Model/forgotPass_data.dart';
import 'package:myapp/Model/forgot_pass.dart';
import 'package:retrofit/retrofit.dart';

part 'forgotpass_repo.g.dart';


@RestApi(baseUrl: 'https://bk-qa.baps.dev/bkms-api/v2')

abstract class ForgotpassRepo {
  factory ForgotpassRepo(Dio dio, {String? baseUrl}) = _ForgotpassRepo;

  @POST('/forgot')
  Future<ForgotpassData> forgorPass(
    @Body() ForgotPassRequest forgotpassrequest,
  );
}
