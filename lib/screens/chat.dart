import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../functions/recording.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              child: Icon(Icons.contact_mail),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Gonçalo'),
            ),
          ],
        ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.mic), label: 'Record', activeIcon: Recording()),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Photography',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video',
          ),
        ],
      ),
    );
  }
}
