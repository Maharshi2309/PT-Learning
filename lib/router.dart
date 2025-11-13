import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Forgot%20Password/forgot_pass_screen.dart';
import 'package:myapp/Presentation/Home/home_screen.dart';
import 'package:myapp/Presentation/Launch%20Screen/launch_screen.dart';
import 'package:myapp/Presentation/Login/login_scree.dart';
import 'package:myapp/Presentation/Reset%20Paasword/reserPass_Screen.dart';

final router = GoRouter(
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
        GoRoute(path: 'resetpass', builder: (_,__) => ReserpassScreen()),
      ],
    ),
  ],
  //redirect: (_, __) => '/launch',
);
