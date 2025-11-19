import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Forgot%20Password/forgot_pass_screen.dart';
import 'package:myapp/Presentation/Home/home_screen.dart';
import 'package:myapp/Presentation/Launch%20Screen/launch_screen.dart';
import 'package:myapp/Presentation/Login/login_scree.dart';
import 'package:myapp/Presentation/Reset%20Paasword/reserPass_Screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
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
            final token = state.uri.queryParameters['key'] ;
            final bkmsId = state.uri.queryParameters['bkms_id'] ;
            final isChild = state.uri.queryParameters['is_child'] ;

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
