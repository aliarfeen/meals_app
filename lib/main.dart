import 'package:flutter/material.dart';
import 'package:meals_app/data/consts.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quintessential',
          scaffoldBackgroundColor: AppColors.bgColor,
          colorScheme: const ColorScheme.light(
            onPrimary: AppColors.hColor,
            primary: AppColors.hColor,
            secondary: AppColors.secondaryColor,
            background: AppColors.bgColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor:
                AppColors.hColor, // Explicitly setting AppBar color
            foregroundColor: Colors.white, // Ensuring icons & text are visible
          ),
          textTheme: TextTheme(),
          useMaterial3: true,
        ),
        home: TabsScreen());
  }
}
