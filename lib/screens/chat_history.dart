import 'package:flutter/material.dart';

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat chat')),
      body: const Center(
        child: Text(
          'Belum ada riwayat chat yang tersimpan',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
