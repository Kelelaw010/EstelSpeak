import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
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
