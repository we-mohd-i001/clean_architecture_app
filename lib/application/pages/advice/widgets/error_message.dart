import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessageText;
  const ErrorMessage({super.key, required this.errorMessageText});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.red,),
        const SizedBox(
          height: 20,
        ),
        Text(
          errorMessageText,
          style: themeData.textTheme.titleMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
