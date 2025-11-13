import 'package:dio/dio.dart';
import 'package:myapp/Model/Reset%20Pass/resetpass_data.dart';
import 'package:myapp/Model/Reset%20Pass/resetpass_request.dart';
import 'package:retrofit/retrofit.dart';

part 'resetpass_repo.g.dart';

@RestApi(baseUrl: 'https://bk-qa.baps.dev/bkms-api/v2')

abstract class ResetpassRepo {
  factory ResetpassRepo(Dio dio, {String? baseUrl}) = _ResetpassRepo;

  @POST('/resetpassword')
  Future<ResetpassData> resetPass(
    @Body() ResetpassRequest resetpassrequest,
    );
}
