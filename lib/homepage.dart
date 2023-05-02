import 'package:flutter/material.dart';
import 'package:jarvis/feature_card.dart';
import 'package:jarvis/input_prompt.dart';
import 'package:jarvis/chat_section.dart';
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "./assets/images/icon2.png",
          ),
        ),
        backgroundColor: Pallete.appBarColor,
        elevation: 2,
        title: const Text(
          'J  A  R  V  I  S',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Cera Pro",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Pallete.chatColor,
        ),
        child: ChatSection(),
      ),

      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              inputBeingGiven = !inputBeingGiven;
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, _, __) {
                    return InputPrompt();
                    // return GestureDetector(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: const InputPrompt(),
                    // );
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

      */
    );
  }
}
