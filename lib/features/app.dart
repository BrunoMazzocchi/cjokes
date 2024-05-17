import 'package:flutter/material.dart';
import 'package:jokes/features/jokes/presentation/screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
