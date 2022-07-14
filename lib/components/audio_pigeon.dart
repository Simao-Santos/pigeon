// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AudioPigeon extends StatelessWidget {
  const AudioPigeon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          ImageIcon(AssetImage("assets/audio_pigeon.png"), color: Color(0xFF6FCF97), size: 80),
        ],
      ),
    );
  }
}
