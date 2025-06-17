import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Estel 🌸')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'EstelTalk adalah chatbot yang dikembangkan untuk membantu melatih skill bahasa inggris',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              '👩‍💻 Pengembang:\nTamara Adjuah\nNIM: 2023020100007\nUniversitas Islam Madura',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              '🛠️ Teknologi:\n- Flutter\n- Gemini API\n- Natural Language Processing',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
