import 'package:flutter/material.dart';
import 'package:jarvis/feature_card.dart';
import 'package:jarvis/input_prompt.dart';
import 'package:jarvis/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool inputBeingGiven = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
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
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // virtual assistant picture
          Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 6.5,
                  ),
                  decoration: const BoxDecoration(
                    color: Pallete.assistantCircleColor,
                    shape: BoxShape.circle,
                  ),
                  height: 120,
                  width: 120,
                ),
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "./assets/images/virtualAssistant.png",
                      ),
                    ),
                  ),
                  height: 125,
                  width: 125,
                ),
              ),
            ],
          ),

          // virtual assistant welcome chat bubble
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(
              top: 30,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Pallete.borderColor,
                width: 0.7,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(13).copyWith(
                topLeft: const Radius.circular(0),
              ),
            ),
            child: const Text(
              "Good Day, What can I do for you?",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Pallete.mainFontColor,
                fontFamily: 'Cera Pro',
              ),
            ),
          ),

          // suggested commands
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ).copyWith(
                top: 20,
                bottom: 15,
              ),
              child: const Text(
                "Here are a few commands:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Pallete.mainFontColor,
                  fontFamily: 'Cera Pro',
                ),
              ),
            ),
          ),

          // features list
          Column(
            children: const [
              FeatureBox(
                  color: Pallete.firstSuggestionBoxColor,
                  title: "ChatGPT",
                  description:
                      "A smarter way to stay organized and informed using ChatGPT"),
              FeatureBox(
                  color: Pallete.secondSuggestionBoxColor,
                  title: "Dall-E",
                  description:
                      "Get inspired and stay creative with your personal assistant powered by Dall-E"),
              FeatureBox(
                  color: Pallete.thirdSuggestionBoxColor,
                  title: "Smart Voice Assistant",
                  description:
                      "Get the best of both worlds with a voice assistant powered by ChatGPT and Dall-E"),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              inputBeingGiven = !inputBeingGiven;
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, _, __) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const InputPrompt(),
                    );
                  },
                  //     // transitionsBuilder: (BuildContext context,
                  //     //     Animation<double> animation,
                  //     //     Animation<double> secondaryAnimation,
                  //     //     Widget child) {
                  //     //   return SlideTransition(
                  //     //     position: Tween<Offset>(
                  //     //       begin: const Offset(0.0, 1.0),
                  //     //       end: Offset.zero,
                  //     //     ).animate(animation),
                  //     //     child: child,
                  //     //   );
                  //     // },
                ),
              );
            },
          );
        },
        backgroundColor: Pallete.assistantCircleColor,
        elevation: 3,
        // shape: const CircleBorder(),
        child: const Icon(
          Icons.keyboard,
          size: 27,
        ),
      ),
    );
  }
}
