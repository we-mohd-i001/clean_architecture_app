import 'package:clean_architecture_app/application/core/services/theme_service.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/advice_field.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/custom_button.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        // centerTitle: true,
        title: Text(
          'Adviser',
          style: themeData.textTheme.headlineMedium,
        ),
        actions: [
          Switch(
              value: !Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              }),
          const SizedBox(width: 10,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: const [
            SizedBox(height: 20,),
            Expanded(child: Center(
                child:
                ErrorMessage(errorMessageText: 'Oops! Something went wrong!')
                //AdviceField(adviceText: '''"Example advice - Good things come with time!"''',),

            //CircularProgressIndicator(),
            //Text('Your advice is waiting for you!', style: themeData.textTheme.bodyLarge,)
            )),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 60),
              child: CustomButton(buttonText: 'Get Advice'),
            ),
          ],
        ),
      ),
    );
  }
}
