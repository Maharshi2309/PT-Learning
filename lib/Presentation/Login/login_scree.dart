import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Components/login_details.dart';
import 'package:myapp/Presentation/Login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bkmsidController = TextEditingController();
  final mailController = TextEditingController();
  final passcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> rememberMeNotifier = ValueNotifier(false);
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Status.done ||
            state.loginStatus == LoginStatus.loggedin) {
          GoRouter.of(context).go('/home');
        } else if (state.status == Status.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/patto.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                            height: 300,
                          ),
                          Positioned(
                            top: 90,
                            left: (MediaQuery.of(context).size.width / 2) - 65,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/icon_dev.png',
                                fit: BoxFit.cover,
                                height: 130,
                                width: 130,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          'Welcome to the BKMS application',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 157, 153, 153),
                          indent: 30,
                          endIndent: 30,
                        ),
                      ),
                      TextFieldDetails(
                        title: 'BKMS ID',
                        controller: bkmsidController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter BKMS ID';
                          }
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'BKMS ID must be numeric';
                          }
                          return null;
                        },
                      ),
                      TextFieldDetails(
                        title: 'Email ',
                        controller: mailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                        },
                      ),
                      TextFieldDetails(
                        title: 'Password ',
                        controller: passcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!RegExp(
                            r'[!@#$%^&*(),.?":{}|<>]',
                          ).hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                        },
                        obscureText: _obscure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                          icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 2,
                        ),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: rememberMeNotifier,
                          builder: (context, rememberMe, _) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (newValue) =>
                                      rememberMeNotifier.value = newValue!,
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          width: 350,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                  performLogin(
                                    bkmsId: bkmsidController.text,
                                    email: mailController.text,
                                    password: passcontroller.text,
                                    rememberMe: rememberMeNotifier.value,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                186,
                                182,
                                182,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Login with BAPS SSO',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  GoRouter.of(context).go('/forgorpass');
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (state.status == Status.process) ...[
                        Container(color: Colors.white.withValues(alpha: 0.5)),
                        Center(child: CircularProgressIndicator()),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
