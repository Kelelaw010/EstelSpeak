import 'package:flutter/material.dart';
import '../screens/chat_history.dart'; //Halaman riwayat chat
import 'calendar_page.dart'; //Kalender
import 'about_page.dart'; //tentang Estel

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 158, 187),
            ),
            child: Text(
              'Menu Estel',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          //Riwayat chat
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat chat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatHistory()),
              );
            },
          ),
          //tentang Estel
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Estel'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
          ),
          //Kalender
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Kalender'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CalendarPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
