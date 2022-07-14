import 'package:flutter/material.dart';
import 'chat.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF113B6B),
        title: const Text('Pigeon'),
      ),
      body: Container(
        color: const Color(0xFFC7CFD3),
        child: const ContactList(),
      ),
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView(
        children: <Widget>[
          Container(
            color: const Color(0xFF113B6B),
            margin: const EdgeInsets.only(bottom: 5),
            child: ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Container(
                  child: const ImageIcon(AssetImage("assets/contact.png"), size: 40),
                  margin: const EdgeInsets.only(right: 10),
                ),
                title: const Text('Mãe'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    ImageIcon(AssetImage("assets/audio_pigeon.png"), color: Color(0xFF6FCF97), size: 40),
                    ImageIcon(AssetImage("assets/photo_pigeon.png"), color: Color(0x7356CCF2), size: 40),
                    ImageIcon(
                      AssetImage("assets/video_pigeon.png"),
                      color: Color(0xFFF2994A),
                      size: 40,
                    )
                  ],
                ),
                trailing: Column(
                  children: const [
                    Text("16:05"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                }),
          ),
          Container(
            color: const Color(0xFF113B6B),
            margin: const EdgeInsets.only(bottom: 5),
            child: ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Container(
                  child: const ImageIcon(AssetImage("assets/contact.png"), size: 40),
                  margin: const EdgeInsets.only(right: 10),
                ),
                title: const Text('Mãe'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    ImageIcon(AssetImage("assets/audio_pigeon.png"), color: Color(0xFF6FCF97), size: 40),
                    ImageIcon(AssetImage("assets/photo_pigeon.png"), color: Color(0x7356CCF2), size: 40),
                    ImageIcon(
                      AssetImage("assets/video_pigeon.png"),
                      color: Color(0xFFF2994A),
                      size: 40,
                    )
                  ],
                ),
                trailing: Column(
                  children: const [
                    Text("16:05"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                }),
          ),
          Container(
            color: const Color(0xFF113B6B),
            margin: const EdgeInsets.only(bottom: 5),
            child: ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Container(
                  child: const ImageIcon(AssetImage("assets/contact.png"), size: 40),
                  margin: const EdgeInsets.only(right: 10),
                ),
                title: const Text('Mãe'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    ImageIcon(AssetImage("assets/audio_pigeon.png"), color: Color(0xFF6FCF97), size: 40),
                    ImageIcon(AssetImage("assets/photo_pigeon.png"), color: Color(0x7356CCF2), size: 40),
                    ImageIcon(
                      AssetImage("assets/video_pigeon.png"),
                      color: Color(0xFFF2994A),
                      size: 40,
                    )
                  ],
                ),
                trailing: Column(
                  children: const [
                    Text("16:05"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
