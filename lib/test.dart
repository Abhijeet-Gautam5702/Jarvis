import 'package:flutter/material.dart';
import 'package:jarvis/open_ai_service.dart';
import 'package:jarvis/pallete.dart';

class TestPrompt extends StatefulWidget {
  const TestPrompt({super.key});

  @override
  State<TestPrompt> createState() => _TestPromptState();
}

class _TestPromptState extends State<TestPrompt> {
  TextEditingController promptController = TextEditingController();
  String prompt = '';
  String chatSpeech = '';

  final OpenAiService openAiService = OpenAiService();

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Chat Bubble
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.borderColor,
                ),
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: Radius.zero,
                ),
              ),
              child: Text(
                chatSpeech == "" ? "Ask me" : chatSpeech,
              ),
            ),
          ),
          // Input Text-field
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: promptController,
                    autocorrect: true,
                    autofocus: true,
                    maxLength: 200,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Give me a prompt...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    setState(
                      () {
                        prompt = promptController.value.text.toString();
                      },
                    );
                    final speech = await openAiService.isArtImagePrompt(prompt);
                    setState(() {
                      chatSpeech = speech;
                    });
                    // print(speech);
                    promptController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
