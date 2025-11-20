import 'package:flutter/material.dart';

class PageTopLayout extends StatelessWidget {
  const PageTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
