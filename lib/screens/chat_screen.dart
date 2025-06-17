import 'package:flutter/material.dart';
import '../sevices/gemini_api_service.dart';
import '../sliding/drawer_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isUser': true});
      });
      _controller.clear();

      final box = Hive.box('chat history');
      box.add({'text': text, 'isUser': false}); //menyimpan pesan dari tara

      //kirim ke gemini API tunggu di balas
      final response = await ChatApi.sendMessage(text);

      setState(() {
        _messages.add({'text': response, 'isUser': false});
      });
      box.add({'text': response, 'isUser': false});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EstelTalk 🌷',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'estelfont',
          ),
        ),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(), //drawer di siniii
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return Align(
                  alignment:
                      message['isUser']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          //warna balok chat
                          message['isUser']
                              ? Colors.pink[100]
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message['text'],
                      style: const TextStyle(fontFamily: 'estelfont'),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.all(8), //biar ga nempel ke tepi
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText:
                          'Type your message...', // teks placeholder di input
                      border: InputBorder.none, //underline ilang
                    ),
                    textInputAction:
                        TextInputAction.send, // tombol keyboard jadi "send"
                    keyboardType: TextInputType.text, // tipe input teks biasa
                    onSubmitted:
                        (_) =>
                            _sendMessage(), // saat tekan enter/submit, kirim pesan
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
