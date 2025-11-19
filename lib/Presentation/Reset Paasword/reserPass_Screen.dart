import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Components/resetPass_details.dart';
import 'package:myapp/Presentation/Reset%20Paasword/resetPass_bloc.dart';

class ResetpassScreen extends StatefulWidget {
  final String? keyToken;
  final String? userId;
  final String? isChild;

  const ResetpassScreen({
    super.key,
    required this.keyToken,
    required this.userId,
    required this.isChild,
  });

  @override
  State<ResetpassScreen> createState() => _ResetpassScreenState();
}

class _ResetpassScreenState extends State<ResetpassScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  final newPasscontroller = TextEditingController();

  final confirmPasscontroller = TextEditingController();

  @override
  void dispose() {
    newPasscontroller.dispose();
    confirmPasscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetpassBloc, ResetPassState>(
      listener: (context, state) {
        if (state.status == ResetStatus.doneReset) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Reset Successfully')),
          );
          GoRouter.of(context).go('/login');
        }
        if (state.status == ResetStatus.processReset) {
          Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state.status == ResetStatus.errorReset) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<ResetpassBloc, ResetPassState>(
        builder: (context, state) {
          switch (state.status) {
            case ResetStatus.initReset:
              return Scaffold(
                backgroundColor: Colors.white,
                body: Form(
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
                            left: (MediaQuery.of(context).size.width / 2) - 60,
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
                          print(
                            "---------------------SCREEN keyToken=${widget.keyToken}",
                          );
                          print(
                            "---------------------SCREEN userId=${widget.userId}",
                          );
                          print(
                            "---------------------SCREEN isChild=${widget.isChild}",
                          );

                          final token = widget.keyToken;
                          final isChild =
                              widget.isChild?.toLowerCase() == 'true';

                          final userIdString = widget.userId ?? '';
                          final userId = int.tryParse(userIdString);
                          final isValid =
                              _formKey.currentState?.validate() ?? false;

                          if (token == null || token.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Missing token')),
                            );
                            return;
                          }
                          if (userId == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid user id')),
                            );
                            return;
                          }
                          if (confirmPasscontroller.text !=
                              newPasscontroller.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Passwords do not match')),
                            );
                            return;
                          }
                          if (isValid) {
                            context.read<ResetpassBloc>().add(
                              ResetPassRequestEvent(
                                password: newPasscontroller.text,
                                confirmPassword: confirmPasscontroller.text,
                                token: token,
                                bkmsId: userId,
                                isChild: isChild,
                                /////////
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
              );
            case ResetStatus.processReset:
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: CircularProgressIndicator()),
              );
            case ResetStatus.doneReset:
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 80),
                      SizedBox(height: 20),
                      Text(
                        'Password Reset Successfully!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('Redirecting to login...'),
                    ],
                  ),
                ),
              );
            case ResetStatus.errorReset:
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(state.message)],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
