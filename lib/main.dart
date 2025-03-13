import 'package:flutter/material.dart';
import 'package:meals_app/data/consts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryTextTheme: GoogleFonts.interTightTextTheme(),
          scaffoldBackgroundColor: AppColors.bgColor,
          colorScheme: const ColorScheme.light(
            onPrimary: AppColors.hColor,
            primary: AppColors.hColor,
            secondary: AppColors.secondaryColor,
            background: AppColors.bgColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.hColor,
            foregroundColor: Colors.white,
          ),
          textTheme: TextTheme(),
          useMaterial3: true,
        ),
        home: TabsScreen());
  }
}
