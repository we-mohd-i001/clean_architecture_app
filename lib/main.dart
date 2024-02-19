import 'package:clean_architecture_app/application/core/services/theme_service.dart';
import 'package:clean_architecture_app/application/pages/advice/adviser_page.dart';
import 'package:clean_architecture_app/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:clean_architecture_app/injection.dart';
import 'package:clean_architecture_app/theme/color_schemes/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeService(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeService.isDarkModeOn
            ? ThemeData(useMaterial3: true, colorScheme: lightColorScheme)
            : ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        // routes: {
        //   '/': (context) => const HomeScreen(),
        //   'counter': (context) => const CounterScreen(),
        //   'listview': (context) => const ListExample(),
        // },
        home: BlocProvider(
          create: (context) => sl<AdviserBloc>(),
          child: const AdviserPage(),
        ),
      );
    });
  }
}