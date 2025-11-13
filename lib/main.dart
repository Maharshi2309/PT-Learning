import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/Presentation/Forgot%20Password/forgor_pass_bloc.dart';
import 'package:myapp/Presentation/Launch%20Screen/launch_screen.dart';
import 'package:myapp/Presentation/Login/login_bloc.dart';
import 'package:myapp/Presentation/Reset%20Paasword/resetPass_bloc.dart';
import 'package:myapp/config.dart';
import 'package:myapp/router.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => GetIt.I<LoginBloc>()),
        BlocProvider<ForgorPassBloc>(create: (_) => GetIt.I<ForgorPassBloc>()),
        BlocProvider<ResetpassBloc>(create: (_) => GetIt.I<ResetpassBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: router,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final appLinks = AppLinks();
  
  @override
  void initState() {
    appLinks.uriLinkStream.listen((uri) {
});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LaunchScreen();
  }
}
