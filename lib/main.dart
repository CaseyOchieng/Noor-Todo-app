import 'package:flutter/material.dart';
import 'package:tasnim/pages/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: const MaterialColor(0xFF6200EE, {
            50: Color(0xFF6200EE),
          }),
          // brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
