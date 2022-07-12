// ignore_for_file: unnecessary_const

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

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
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = FlutterSoundRecorder();

  Future<void> _start() async {
    await _audioRecorder.openRecorder();

    bool isRecording = _audioRecorder.isRecording;

    setState(() {
      _isRecording = isRecording;
      _recordDuration = 0;
    });

    _startTimer();
  }

  Future<void> _stop() async {
    _timer?.cancel();
    final path = await _audioRecorder.stopRecorder();

    if (kDebugMode) {
      print('audio saved here: ' + path!);
    }

    setState(() => _isRecording = false);
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_isRecording || _isPaused) {
      icon = const Icon(Icons.stop, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: theme.primaryColor, size: 30);
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
    if (_isRecording || _isPaused) {
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
