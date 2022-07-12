import 'package:flutter/material.dart';
import 'chat.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Pigeon'),
      ),
      body: const Center(
        child: ContactList(),
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
  // nome dos contactos vem da base de dados

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Mãe'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chat()),
              );
            }),
        const Divider(),
        ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Gonçalo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chat()),
              );
            }),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Ana'),
        ),
        const Divider()
      ],
    );
  }
}
