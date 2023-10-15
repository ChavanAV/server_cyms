import 'package:flutter/material.dart';

class AppBarLeadingBTN extends StatelessWidget {
  final Widget icon;
  final Function() press;
  const AppBarLeadingBTN({
    super.key,
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: press,
      icon: icon,
    );
  }
}
