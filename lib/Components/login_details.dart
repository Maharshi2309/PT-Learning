import 'package:flutter/material.dart';

class LoginDetails extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;

  const LoginDetails({
    super.key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 38, // force consistent height
                  child: TextField(
                    controller: controller,
                    obscureText: obscureText,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      suffixIcon: suffixIcon,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ), // Try 8 or adjust as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 157, 153, 153),
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
