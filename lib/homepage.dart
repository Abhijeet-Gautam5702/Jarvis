import 'package:flutter/material.dart';
import 'package:jarvis/chat_section.dart';
import 'package:jarvis/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        decoration: const BoxDecoration(
          color: Pallete.chatColor,
        ),
        child: const ChatSection(),
      ),
    );
  }
}
