import 'package:flutter/material.dart';

class ResetpassDetails extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function? validator;
  final AutovalidateMode autovalidateMode;
  const ResetpassDetails({
    super.key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 20,
              child: Center(
                child: TextFormField(
                  controller: controller,
                  autovalidateMode: autovalidateMode,
                  validator: validator as String? Function(String?)?,
                  obscureText: obscureText,
                  style: const TextStyle(fontSize: 13),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(height: 1.2),
                    isDense: true,
                    border: InputBorder.none,
                    suffixIcon: suffixIcon,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
