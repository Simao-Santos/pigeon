// ignore_for_file: unnecessary_const

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class Recording extends StatelessWidget {
  const Recording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RecordingLogic();
  }
}

class RecordingLogic extends StatefulWidget {
  const RecordingLogic({Key? key}) : super(key: key);

  @override
  State<RecordingLogic> createState() => _RecordingLogicState();
}

class _RecordingLogicState extends State<RecordingLogic> {
  bool _isRecording = false;
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = FlutterSoundRecorder();

  Future<void> _start() async {
    print("BANANANAS");

    if (await Permission.microphone.request().isDenied && await Permission.storage.request().isDenied) {
      try {
        throw RecordingPermissionException("Microphone or storage permission not granted");
      } catch (e) {
        AlertDialog(
          title: const Text("Permissions Denied."),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "OK",
                style: const TextStyle(color: Colors.blue),
              ),
            )
          ],
        );
      }
    } else {
      await _audioRecorder.openRecorder();
      print("abriu recorder");

      final directory = await getExternalStorageDirectory();
      String? _path = directory?.path; // instead of "/storage/emulated/0"
      print(_path);

      DateTime now = DateTime.now();
      String filename = "/" +
          now.day.toString() +
          "-" +
          now.month.toString() +
          "-" +
          now.year.toString() +
          "-" +
          now.hour.toString() +
          ":" +
          now.minute.toString() +
          ".aac";

      await _audioRecorder.startRecorder(toFile: _path! + filename);
      bool isRecording = _audioRecorder.isRecording;
      print("começou a gravar");

      setState(() {
        _isRecording = isRecording;
        _recordDuration = 0;
      });

      _startTimer();
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    final path = await _audioRecorder.stopRecorder();
    print(path);

    if (kDebugMode) {
      print('audio saved here: ' + path!);
    }

    setState(() => _isRecording = false);
    _audioRecorder.closeRecorder();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_isRecording) {
      icon = const Icon(Icons.mic, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic_none, color: theme.primaryColor, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            _isRecording ? _stop() : _start();
          },
        ),
      ),
    );
  }

  //------------------------------------------
  //----------------Utilities-----------------
  //------------------------------------------
  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

  Widget _buildText() {
    if (_isRecording) {
      return _buildTimer();
    }

    return const Text("Waiting to record");
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

// ------------------------------------------------
// ----------------------BUILD---------------------
// ------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return _buildRecordStopControl();
  }
}
