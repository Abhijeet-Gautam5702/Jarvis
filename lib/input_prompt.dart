import 'package:flutter/material.dart';
import 'package:jarvis/open_ai_service.dart';
import 'package:jarvis/pallete.dart';

class InputPrompt extends StatefulWidget {
  const InputPrompt({super.key});

  @override
  State<InputPrompt> createState() => _InputPromptState();
}

class _InputPromptState extends State<InputPrompt> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'JARVIS',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                padding: EdgeInsets.all(10),
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
            Row(
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
                    print(speech);
                    promptController.clear();
                  },
                  icon: Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
