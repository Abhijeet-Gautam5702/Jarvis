import 'package:flutter/material.dart';
import 'package:jarvis/open_ai_service.dart';
import 'package:jarvis/pallete.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
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
    return Column(
      children: [
        // chatGPT response container
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topLeft,
              //chatGPT response chat bubble
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  chatSpeech == "" ? "HEY ! How may I help you?" : chatSpeech,
                  style: const TextStyle(
                    color: Pallete.borderColor,
                    fontFamily: "Cera Pro",
                    // fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Prompt Input section
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: const BoxDecoration(
            color: Pallete.textFieldColor,
            // border: Border.all(
            //   color: Colors.red,
            // ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                0,
              ),
              topRight: Radius.circular(
                0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //Input text field
              Expanded(
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.8,
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
                      fontFamily: "Cera Pro",
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
                    final speech = await openAiService.isArtImagePrompt(prompt);
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
        )
      ],
    );
  }
}
