import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class ChatApi {
//get answer from chat gpt
  static Future<String> getAnswer(String question) async {
    try {
      //
      final res =
          await post(Uri.parse('https://api.openai.com/v1/chat/completions'),

              //headers
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader:
                    'Bearer ${dotenv.env['apiKey']}'
              },
              //body
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "max_tokens": 2000,
                "temperature": 0,
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));

      final data = jsonDecode(res.body);
      print('res: $data');
      return data['choices'][0]['message']['content'];
    } catch (e) {
      print('getAnswerE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }
}