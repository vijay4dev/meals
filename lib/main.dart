import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/tabs.dart';
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.white,
  ),
  textTheme: GoogleFonts.ralewayTextTheme
  ().copyWith(titleSmall: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal
  )),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabScreen(),
    );
  }
}