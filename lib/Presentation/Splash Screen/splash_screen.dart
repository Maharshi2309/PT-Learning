import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Login/login_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(const rememberMe());

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go('/launch');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipOval(
          child: Image.asset(
            'assets/images/icon_dev.png',
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}


// 359bkms@mailinator.com
// Bkms@123456
// link:- https://bk-qa.baps.dev/password/changepass?key=sPjlm5edPe22TZkl3dqAv4pLMSRzMoJO&is_child=true&user_id=359