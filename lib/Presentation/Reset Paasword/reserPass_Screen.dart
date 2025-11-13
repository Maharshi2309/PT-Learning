import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Components/resetPass_details.dart';
import 'package:myapp/Presentation/Reset%20Paasword/resetPass_bloc.dart';

class ReserpassScreen extends StatelessWidget {
  const ReserpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasscontroller = TextEditingController();
    final confirmPasscontroller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BlocListener<ResetpassBloc, ResetPassState>(
      listener: (context, state) {
        if (state.status == Status.done) {
          GoRouter.of(context).go('/login');
        }
        if (state.status == Status.process) {
          Center(child: CircularProgressIndicator());
        }
        if (state.status == Status.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<ResetpassBloc, ResetPassState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.init:
              return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
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
                              left:
                                  (MediaQuery.of(context).size.width / 2) - 60,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Text(
                            'Reset Passwrod',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Create a new password for your BKMS account here and then use it to log in.',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 157, 153, 153),
                            indent: 0,
                            endIndent: 0,
                          ),
                        ),
                        ResetpassDetails(
                          title: 'New\nPassword *',
                          controller: newPasscontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain one uppercase letter';
                            }
                            if (!RegExp(
                              r'[!@#$%^&*(),.?":{}|<>]',
                            ).hasMatch(value)) {
                              return 'Password must contain at least one special character';
                            }
                          },
                        ),
                        Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 157, 153, 153),
                          indent: 30,
                          endIndent: 30,
                        ),
                        ResetpassDetails(
                          title: 'Confirm\nPassword *',
                          controller: confirmPasscontroller,
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
                        ),
                        Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 157, 153, 153),
                          indent: 0,
                          endIndent: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Minimum Password Requirements:\n• Must be 8 to 25 characters.\n• Must include at least 1 number.\n• Must include at least 1 uppercase and 1 lowercase letter\n• Must include at least 1 special character.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ResetpassBloc>().add(
                                ResetPassRequestEvent(
                                  password: newPasscontroller.text,
                                  //${user?.data['access_token']
                                  confirmPassword: confirmPasscontroller.text,
                                  token: 'wyxuwasFJtZtqiOgTaoGBthVDp6aVRuh',
                                  bkms_id: 359,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 0, 147, 245),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 130,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            case Status.process:
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: CircularProgressIndicator()),
              );
            case Status.done:
              return SnackBar(content: Text('Password Reset Successfully'));
            case Status.error:
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message.isEmpty
                            ? 'An error occurred'
                            : state.message,
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
