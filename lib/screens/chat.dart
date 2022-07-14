// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/audio_pigeon.dart';
import '../functions/recording.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC7CFD3),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF113B6B),
        leading: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        title: Row(
          children: const <Widget>[
            Align(
              child: ImageIcon(
                AssetImage("assets/contact.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Gonçalo Marantes'),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(children: List<AudioPigeon>.generate(3, (index) => AudioPigeon())),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: BottomNavigationBar(
            backgroundColor: const Color(0x73113B6B),
            elevation: 0,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mic,
                    color: Colors.black,
                  ),
                  label: 'Record',
                  activeIcon: Recording()),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera,
                    color: Colors.black,
                  ),
                  label: 'Photography'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.videocam,
                  color: Colors.black,
                ),
                label: 'Video',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
