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
    return Stack(
      children: [
        Column(
          children: [
            // Chat Bubble
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8988,
                child: Align(
                  alignment: Alignment.topLeft,
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
              ),
            ),
          ],
        ),
        //bottom section
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: // Input Text-field
              Container(
            // height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
              color: Pallete.textFieldColor,
              // border: Border.all(
              //   color: Colors.red,
              // ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //Input text field
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      cursorColor: Colors.grey,
                      cursorHeight: 30,
                      controller: promptController,
                      autocorrect: true,
                      autofocus: true,
                      // maxLength: 200,

                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Pallete.textBoxColor,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Give me a prompt...',
                      ),
                    ),
                  ),

                  // send button
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.red,
                    //   ),
                    // ),
                    child: IconButton(
                      onPressed: () async {
                        setState(
                          () {
                            prompt = promptController.value.text.toString();
                          },
                        );
                        final speech =
                            await openAiService.isArtImagePrompt(prompt);
                        setState(() {
                          chatSpeech = speech;
                        });
                        // print(speech);
                        promptController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Pallete.primaryColor,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
