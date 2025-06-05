import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EstelTalk 🌷',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
        fontFamily: 'estelfont',
      ),
      home: const WelcomeScreen(), //welcome dulu yang ditampilin
    );
  }
}
