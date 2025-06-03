import 'dart:convert';
import 'package:http/http.dart' as http;
import 'logger_service.dart';

class ChatApi {
  static const String _apiKey = 'AIzaSyBiwxbwlHNGabkOGI4nmhCkNRp34T6OX3k';
  static String get _endpoint =>
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$_apiKey';

  static Future<String> sendMessage(String prompt) async {
    final fullPrompt =
        "Hi Estel, aku Tara. Tolong jawab dengan sopan dan santai dalam Bahasa Inggris dan Indonesia ya:  $prompt";
    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": fullPrompt},
              ],
            },
          ],
        }),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        LoggerService.debug('DEBUG: response body => $data');

        //coba
        if (data['candidates'] != null &&
            data['candidates'] != null &&
            data['candidates'][0]['content'] != null &&
            data['candidates'][0]['content']['parts'] != null &&
            data['candidates'][0]['content']['parts'][0]['text'] != null) {
          //teks balasan
          final text =
              data['candidates']?[0]?['content']?['parts']?[0]?['text'];
          if (text != null) {
            return text ?? '[Empty response]';
          }
        }
      } //kalo error, nanti muncul pesan failed response
      else {
        LoggerService.error(
          'Failed response with status code ${response.statusCode}: ${response.reasonPhrase}',
        );
        return '[Error, Failed response  ${response.statusCode}] ${response.reasonPhrase}';
      }
    } catch (e) {
      // Kalau exception terjadi, kembalikan pesan exception
      return '[Exception] $e';
    }
    return '[Unknown Error]';
  }
}
