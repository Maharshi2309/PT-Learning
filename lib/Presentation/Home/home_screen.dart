import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Login/login_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((LoginBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(title: Text('HomeScren')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Access Token: ${user?.data['access_token'] ?? 'No Token'}",
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.power_settings_new),
        onPressed: () {
          context.read<LoginBloc>().add(logOutEvent());
          GoRouter.of(context).go('/launch');
        },
      ),
    );
  }
}
