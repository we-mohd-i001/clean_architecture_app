import 'package:clean_architecture_app/application/core/services/theme_service.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Adviser',
          style: themeData.textTheme.headlineMedium,
        ),
        actions: [
          Switch(
              value: !Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: const [
            Expanded(child: Placeholder()),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 80),
              child: CustomButton(buttonText: 'Get Advice'),
            ),
          ],
        ),
      ),
    );
  }
}
