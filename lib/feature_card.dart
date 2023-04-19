import 'package:flutter/material.dart';

import 'package:jarvis/pallete.dart';

class FeatureBox extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      // height:,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ).copyWith(
        bottom: 15,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ).copyWith(
        right: 15,
        left: 10,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Pallete.mainFontColor,
                fontFamily: 'Cera Pro',
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Pallete.mainFontColor,
                fontFamily: 'Cera Pro',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
