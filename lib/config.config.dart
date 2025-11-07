// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:myapp/Presentation/Forgot%20Password/forgor_pass_bloc.dart'
    as _i29;
import 'package:myapp/Presentation/login_bloc.dart' as _i302;
import 'package:myapp/Service/auth_service.dart' as _i1006;
import 'package:myapp/Service/forgotPass_service.dart' as _i740;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1006.AuthService>(() => _i1006.AuthService());
    gh.singleton<_i740.ForgotpassService>(() => _i740.ForgotpassService());
    gh.singleton<_i302.LoginBloc>(
      () => _i302.LoginBloc(gh<_i1006.AuthService>()),
    );
    gh.singleton<_i29.ForgorPassBloc>(
      () => _i29.ForgorPassBloc(gh<_i740.ForgotpassService>()),
    );
    return this;
  }
}
