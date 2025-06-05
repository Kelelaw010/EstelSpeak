import 'package:flutter/material.dart';
import 'chat_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    //pindah ke chat_screen
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; //biar aman dari context async
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 214, 224),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon chat
              ShaderMask(
                shaderCallback:
                    (bounds) => const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 243, 122, 195),
                        Color.fromARGB(255, 174, 191, 199),
                      ], //gradasi warna
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: Icon(Icons.chat_bubble, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Let is chat in English or Indonesian!\n Estel ada kapan saja',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
