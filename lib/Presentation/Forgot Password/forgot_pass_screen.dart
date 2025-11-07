import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Forgot%20Password/forgor_pass_bloc.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bkmsidController = TextEditingController();
    final mailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return BlocListener<ForgorPassBloc, ForgotPassState>(
      listener: (context, state) {
        if (state.status == Status.done) {
          GoRouter.of(context).go('/home');
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
      child: BlocBuilder<ForgorPassBloc, ForgotPassState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.init:
              return Scaffold(
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
                                left:
                                    (MediaQuery.of(context).size.width / 2) -
                                    65,
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
                            padding: const EdgeInsets.only(right: 80),
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Text(
                              'To reset your password, please enter your BKMS ID and email addres.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 157, 153, 153),
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'BKMS ID',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 20,
                                        child: TextFormField(
                                          controller: bkmsidController,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter BKMS ID';
                                            }
                                            if (!RegExp(
                                              r'^\d+$',
                                            ).hasMatch(value)) {
                                              return 'BKMS ID must be numeric';
                                            }
                                            return null;
                                          },

                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  vertical: 6,
                                                ),
                                            errorStyle: TextStyle(height: 1.2),
                                            isDense: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: const Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 157, 153, 153),
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Email',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 20,
                                        child: TextFormField(
                                          controller: mailController,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter Email Address';
                                            }
                                            if (!RegExp(
                                              r'^[^@]+@[^@]+\.[^@]+',
                                            ).hasMatch(value)) {
                                              return 'Please enter a valid Email Address';
                                            }
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  vertical: 6,
                                                ),
                                            errorStyle: TextStyle(height: 1.2),
                                            isDense: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: const Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 157, 153, 153),
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 180),
                            child: SizedBox(
                              width: 350,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<ForgorPassBloc>().add(
                                      ForgotPassRequestEvent(
                                        bkmsId: bkmsidController.text,
                                        email: mailController.text,
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    7,
                                    138,
                                    246,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Send Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                    // letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).go('/launch');
                            },
                            child: Text(
                              'Back to Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            case Status.process:
              return Scaffold(
                backgroundColor: Colors.white,
                body: const Center(child: CircularProgressIndicator()),
              );
            case Status.done:
              return SnackBar(content: Text('Email Sent Successfully'));
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
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).go('/launch');
                        },
                        child: Text('Back to Login'),
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
