import 'package:clean_architecture_app/application/services/theme_service.dart';
import 'package:clean_architecture_app/theme/color_schemes/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeService(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder:(context, themeService, child){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: themeService.isDarkModeOn
            ? ThemeData(useMaterial3: true, colorScheme: lightColorScheme)
            : ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        // routes: {
        //   '/': (context) => const HomeScreen(),
        //   'counter': (context) => const CounterScreen(),
        //   'listview': (context) => const ListExample(),
        // },
        home: const Placeholder(),
      );
    });
  }
}