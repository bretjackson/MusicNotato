import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef NotePressedCallback = Function(String noteName);

class NoteButton extends StatefulWidget{
  NoteButton({
    required this.noteName,
    required this.audioFile,
    required this.onNotePressed,
    required this.player
  }) : super(key: ObjectKey(noteName));

  final String noteName;
  final String audioFile;
  final NotePressedCallback onNotePressed;
  final AudioPlayer player;

  @override
  State<NoteButton> createState() => _NoteButtonState();
}

class _NoteButtonState extends State<NoteButton>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onNotePressed(widget.noteName);
        widget.player.play(AssetSource(widget.audioFile));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black)),
      child: Text(widget.noteName.toUpperCase()),
    );
  }
}
  