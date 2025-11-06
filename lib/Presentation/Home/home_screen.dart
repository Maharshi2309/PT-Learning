import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Presentation/login_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final user = context.select((LoginBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(title: Text('HomeScren')),
      body: Center(child: Text("Access Token: ${user?.data['access_token']}")),
    );
  }
}
