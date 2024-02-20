import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(50),
      child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: themeData.focusColor,
              shape: BoxShape.circle
          ),
          child: const CircularProgressIndicator()),
    );
  }
}
