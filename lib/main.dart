import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaker_spot_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sneaker Spot',
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 23, 0, 153),
        scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 1.0),
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        useMaterial3: true,
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
