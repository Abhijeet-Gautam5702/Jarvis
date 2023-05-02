import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
// import 'secrets.dart';

var openAIApiKey = dotenv.env['OPEN_AI_API_KEY'];

class OpenAiService {
  final List<Map<String, String>> messages = [
    {
      'role': 'user',
      'content': 'Ensure all your responses are within 200 words.',
    },
  ];

  Future<String> isArtImagePrompt(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse(
          "https://api.openai.com/v1/chat/completions",
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $openAIApiKey"
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content":
                    "Check if this message wants an AI-generated image: \n $prompt.\n Answer in exactly 'true' or 'false' only",
              },
            ]
          },
        ),
      );

      // print(res.body);

      if (res.statusCode == 200) {
        String response =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        response = response.trim();

        if (response == 'Yes' ||
            response == 'Yes.' ||
            response == 'yes' ||
            response == 'yes.') {
          final String res = await dallEApi(prompt);
          // print(res);
          return res;
        } else {
          // print("else-block invoked");
          final String res = await chatGPTApi(prompt);
          return res;
        }
      }
      return "Oops! An Internal Error occured.";
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> chatGPTApi(String prompt) async {
    messages.add(
      {
        'role': 'user',
        'content': prompt,
      },
    );
    // print('messages[]=$messages');
    try {
      final res = await http.post(
        Uri.parse(
          "https://api.openai.com/v1/chat/completions",
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $openAIApiKey"
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": messages,
          },
        ),
      );

      // print('chatgptapi :: res.body = ${res.body}');

      if (res.statusCode == 200) {
        // print("chatgptapi :: statusCode=200");
        String response =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        response = response.trim();

        messages.add(
          {
            'role': 'assistant',
            'content': response,
          },
        );
        return response;
      }
      return "Oops! An Internal Error occured. \nYou might have exhausted the request limit for the free-tier (3 requests/min). Please try after 1 minute";
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> dallEApi(String prompt) async {
    return "Dall-E";
  }
}
