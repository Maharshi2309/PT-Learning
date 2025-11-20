import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Forgot%20Password/forgot_pass_screen.dart';
import 'package:myapp/Presentation/Home/home_screen.dart';
import 'package:myapp/Presentation/Launch%20Screen/launch_screen.dart';
import 'package:myapp/Presentation/Login/login_screen.dart';
import 'package:myapp/Presentation/PIN/pin_screen.dart';
import 'package:myapp/Presentation/Reset%20Paasword/reserPass_Screen.dart';
import 'package:myapp/Service/auth_service.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  redirect: (context, state) async {
    if (state.uri.path == '/') {
      final authService = GetIt.I<AuthService>();
      final result = await authService.rememberMe();

      if (result.isValue) {
        print('User Found.......Going to Pin Screen.......');
        final storage = FlutterSecureStorage();
        final storedPin = await storage.read(key: 'user_pin');

        if (storedPin != null) {
          return '/pin?mode=validate';
        } else {
          return '/pin?mode=create';
        }
      } else {
        print('User Not Found...........Going to Launch Screen');
        return '/launch';
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) {
        return LaunchScreen();
      },
      routes: [
        GoRoute(path: 'launch', builder: (_, __) => LaunchScreen()),
        GoRoute(path: 'login', builder: (_, __) => LoginScreen()),
        GoRoute(path: 'home', builder: (_, __) => HomeScreen()),
        GoRoute(path: 'forgorpass', builder: (_, __) => ForgotPassScreen()),
        GoRoute(
          path: 'pin',
          builder: (context, state) {
            final mode = state.uri.queryParameters['mode'] ?? 'validate';
            return PinScreen(mode: mode);
          },
        ),
        //GoRoute(path: 'resetpass', builder: (_, __) => ResetpassScreen()),
        GoRoute(
          path: 'password/changepass',
          redirect: (context, state) {
            print(
              "-----------------ROUTER: key=${state.uri.queryParameters['key']}",
            );
            print(
              "-----------------ROUTER: userId=${state.uri.queryParameters['user_id']}",
            );
            print(
              "-----------------ROUTER: isChild=${state.uri.queryParameters['is_child']}",
            );
            final token = state.uri.queryParameters['key'];
            final userId = state.uri.queryParameters['user_id'];
            //final isChildString = state.uri.queryParameters['is_child'];
            final isChild = state.uri.queryParameters['is_child'];

            return '/resetpass?key=$token&bkms_id=$userId&is_child=$isChild';
          },
        ),
        GoRoute(
          path: 'resetpass',
          builder: (context, state) {
            final token = state.uri.queryParameters['key'];
            final bkmsId = state.uri.queryParameters['bkms_id'];
            final isChild = state.uri.queryParameters['is_child'];

            print("BUILDER → key=$token userId=$bkmsId isChild=$isChild");

            return ResetpassScreen(
              keyToken: token,
              userId: bkmsId,
              isChild: isChild.toString(),
            );
          },
        ),
      ],
    ),
  ],
);
