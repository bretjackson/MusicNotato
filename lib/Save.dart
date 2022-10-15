import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'Note.dart';
import 'PlayingPage.dart';

class Save {

  List<Note> _allNotes = List.empty(growable: true);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notato.txt');
  }

  Future<List<Note>> readFile() async {
    try {
      final file = await _localFile;
      final String notesFromFile = await file.readAsString();
      return strToNoteList(notesFromFile);
    } catch (e) {
      return List.empty(growable: true);
    }
  }

  Future<File> writeFile() async {
    final file = await _localFile;
    return file.writeAsString(noteListToStr(_allNotes));
  }

  List<Note> strToNoteList(String fileText) {
    List<Note> toReturn = List.empty(growable: false);
    //TODO: Regex? This should just grab bits of text before a semicolon
    var unparsedRead = fileText.split('');
    String chunk = '';
    for (String char in unparsedRead) {
      if (char != ';') {
        chunk = '$chunk$char';
      } else {
        var noteParts = chunk.split('');
        chunk = '';
        //TODO: Make it so this won't break if the number of characters isn't constant
        toReturn.add(Note(
          noteParts[0],
          int.parse(noteParts[1]),
          int.parse(noteParts[2]),
          int.parse(noteParts[3]),
          int.parse(noteParts[4])
        ));
      }
    }
    return toReturn;
  }

  String noteListToStr(List<Note> noteList) {
    String toReturn = '';
    for (Note note in noteList) {
      toReturn =
          '$toReturn${note.note}${note.octave}${note.duration}${note.accidental};';
    }
    return toReturn;
  }

  List<Note> getAllNotes() {
    return _allNotes;
  }
}