import 'package:flutter/material.dart';
import '../functions/recording.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text('Gonçalo'),
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFFC7CFD3),
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
              BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Record', activeIcon: Recording()),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Photography', backgroundColor: Colors.black
                  // activeIcon: Camera()
                  ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videocam),
                label: 'Video',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
