import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Home/home_screen.dart';
import 'package:myapp/Presentation/Login/launch_screen.dart';
import 'package:myapp/Presentation/login_scree.dart';
import 'package:myapp/Presentation/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) {
        return SplashScreen();
      },
      routes: [
        GoRoute(path: 'launch', builder: (_, __) => LaunchScreen()),
        GoRoute(path: 'login', builder: (_, __) => LoginScreen()),

        GoRoute(path: 'home', builder: (_, __) => HomeScreen()),
      ],
    ),
  ],
  // redirect: (_,__) => '/launch',
);
