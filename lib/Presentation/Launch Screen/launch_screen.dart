import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class LaunchScreen extends StatelessWidget {
  final securedStorage = FlutterSecureStorage();

  LaunchScreen({super.key});

  Future<void> _chekingToken(BuildContext context) async {
    final userJson = await securedStorage.read(key: '_user');
    if (userJson != null) {
      GoRouter.of(context).go('/home');
    } else {
      GoRouter.of(context).go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
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
              Center(
                child: Text(
                  'Welcome to the BKMS application',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 40),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () => _chekingToken(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 118, 193, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'LOGIN WITH BKMS ID',
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
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 157, 153, 153),
                      indent: 90, // starting padding
                      endIndent: 8, // ending padding
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 157, 153, 153),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 157, 153, 153),
                      indent: 8, // starting padding
                      endIndent: 90, // ending padding
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 157, 153, 153),
                      width: 0.4,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).go('/resetpass');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 104, 104, 104),
                          // letterSpacing: 1.2,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
