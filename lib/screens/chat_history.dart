import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  late Box chatBox;
  @override
  void initState() {
    super.initState();
    chatBox = Hive.box('chat history');
  }

  //fungsi buat hapus pesan
  void _deleteMessage(int index) {
    chatBox.deleteAt(index);
    setState(() {
      //refresh tampilan setelah di hapus
    });
  }

  //fungsi buat bersihin semua pesan
  void _clearAll() {
    chatBox.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final messages = chatBox.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'hapus semua',
            onPressed: () {
              if (messages.isNotEmpty) {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Mau hapus semua riwayat?'),
                        content: const Text(
                          'Semua pesan akan di hapus secara permanen',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              _clearAll();
                              Navigator.pop(context);
                            },
                            child: const Text('Hapus'),
                          ),
                        ],
                      ),
                );
              }
            },
          ),
        ],
      ),
      body:
          messages.isEmpty
              ? const Center(child: Text('belum ada riwayat chat 🌸'))
              : ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index] as Map; //ambil data dari list
                  final isUser = msg['isUser'] ?? false;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    color: isUser ? Colors.pink[100] : Colors.grey[300],
                    child: ListTile(
                      title: Text(
                        msg['text'],
                        style: const TextStyle(fontFamily: 'estefont'),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => _deleteMessage(index),
                        tooltip: 'Hapus pesan ini',
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
