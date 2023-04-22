import 'package:flutter/material.dart';

class InputPrompt extends StatefulWidget {
  const InputPrompt({super.key});

  @override
  State<InputPrompt> createState() => _InputPromptState();
}

class _InputPromptState extends State<InputPrompt> {
  TextEditingController promptController = TextEditingController();
  String prompt = '';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(2),
            ),
            onPressed: () {
              setState(
                () {
                  prompt = promptController.value.text.toString();
                },
              );
              promptController.clear();
            },
            child: const Text(
              "Submit",
            ),
          ),
        ],
      ),
    );
  }
}
