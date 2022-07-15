// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/audio_pigeon.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class NumberAudios extends StatefulWidget {
  const NumberAudios({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberAudiosState();
}

class _NumberAudiosState extends State<NumberAudios> {
  List audioPigeons = [];
  bool change = false;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void setNumberOfAudios() async {
    List files = [];

    final directory = await getExternalStorageDirectory();
    String? _path = directory?.path;

    files = io.Directory(_path!).listSync();
    // print("abannas");

    setState(() {
      audioPigeons = files;
    });
  }

  void listenChange() async {
    int sizeNow = audioPigeons.length;
    List files = [];

    final directory = await getExternalStorageDirectory();
    String? _path = directory?.path;
    files = io.Directory(_path!).listSync();

    audioPigeons = files;

    setState(() {
      if (sizeNow != audioPigeons.length) change = !change;
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool callOnce = true;
    // if (callOnce) {
    //   setNumberOfAudios();
    //   callOnce = false;
    // }
    // listenChange();
    // if (change) setNumberOfAudios();
    // print("abannas");

    setNumberOfAudios();

    // print("ASAS");
    // print(audioPigeons.length);
    return Column(children: List<AudioPigeon>.generate(audioPigeons.length, (index) => AudioPigeon()));
  }
}
