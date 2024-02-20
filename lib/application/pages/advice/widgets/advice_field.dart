import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  static String emptyAdvice = 'What should I do with an empty advice?';

  final String adviceText;
  const AdviceField({super.key, required this.adviceText});

  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: themData.focusColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            adviceText.isNotEmpty ?
            adviceText : emptyAdvice,
            style: themData.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
