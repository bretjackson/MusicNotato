import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

import 'note.dart';

void main() {
  runApp(const MyApp());
}

List<Note> _allNotes = List.empty(growable: true);

class Save {
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
}

class Graphics extends CustomPainter {
  bool note;
  String noteName;
  double
      x; // Current x-direction offset; determines positioning of note in the x-direction

  Graphics(this.note, this.noteName, this.x);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;
    double radius = 3;

    canvas.drawLine(Offset(0, size.height * 0.3),
        Offset(size.width, size.height * 0.3), paint);
    canvas.drawLine(Offset(0, size.height * 0.4),
        Offset(size.width, size.height * 0.4), paint);
    canvas.drawLine(Offset(0, size.height * 0.5),
        Offset(size.width, size.height * 0.5), paint);
    canvas.drawLine(Offset(0, size.height * 0.6),
        Offset(size.width, size.height * 0.6), paint);
    canvas.drawLine(Offset(0, size.height * 0.7),
        Offset(size.width, size.height * 0.7), paint);

    if (note == true && noteName == 'c') {
      double y = -28; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.7 * y), paint);
    } else if (note == true && noteName == 'cs') {
      double y = -28; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.7 * y), paint);
    } else if (note == true && noteName == 'd') {
      double y = -30; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.5 * y), paint);
    } else if (note == true && noteName == 'ds') {
      double y = -30; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.5 * y), paint);
    } else if (note == true && noteName == 'e') {
      double y = -32; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.4 * y), paint);
    } else if (note == true && noteName == 'f') {
      double y = -34.5; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.3 * y), paint);
    } else if (note == true && noteName == 'fs') {
      double y = -34.5; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.3 * y), paint);
    } else if (note == true && noteName == 'g') {
      // correct
      double y = -38; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(-radius + x, size.height + y),
          Offset(-radius + x, size.height * 0.5 - 0.2 * y), paint);
    } else if (note == true && noteName == 'gs') {
      double y = -20; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(radius + x, size.height + y),
          Offset(radius + x, size.height * 0.5 + 0.8 * y), paint);
    } else if (note == true && noteName == 'a') {
      double y = -22; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(radius + x, size.height + y),
          Offset(radius + x, size.height * 0.5 + 0.8 * y), paint);
    } else if (note == true && noteName == 'as') {
      double y = -22; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(radius + x, size.height + y),
          Offset(radius + x, size.height * 0.5 + 0.8 * y), paint);
    } else if (note == true && noteName == 'b') {
      double y = -24.5; // Current y-direction offset; determines note

      canvas.drawCircle(Offset(x, size.height + y), radius, paint);
      canvas.drawLine(Offset(radius + x, size.height + y),
          Offset(radius + x, size.height * 0.5 + 0.8 * y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class StaffLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;

    canvas.drawLine(Offset(0, size.height * 0.3),
        Offset(size.width, size.height * 0.3), paint);
    canvas.drawLine(Offset(0, size.height * 0.4),
        Offset(size.width, size.height * 0.4), paint);
    canvas.drawLine(Offset(0, size.height * 0.5),
        Offset(size.width, size.height * 0.5), paint);
    canvas.drawLine(Offset(0, size.height * 0.6),
        Offset(size.width, size.height * 0.6), paint);
    canvas.drawLine(Offset(0, size.height * 0.7),
        Offset(size.width, size.height * 0.7), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Notato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Music Notato', storage: Save()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.storage});
  final Save storage;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool note = false;
  String noteName = '';
  double x = 20;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((value) {
      setState(() {
        _allNotes = value;
      });
    });
  }

  void _addNote(Note currentNote) {
    setState(() {
      note = true;
      noteName = currentNote.note;
      x += 8;
      _allNotes.add(currentNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomPaint(
              size: const Size(1000, 50),
              // size: Size(context.size!.width, context.size!.height), // does not work; compile error
              painter: Graphics(note, noteName, x),
            ),
            ButtonBar(children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/c.wav'));
                  _addNote(Note('c', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('C'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/cs.wav'));
                  _addNote(Note('c', 4, 4, 1));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('C#/Db'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/d.wav'));
                  _addNote(Note('d', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('D'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/ds.wav'));
                  _addNote(Note('d', 4, 4, 1));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('D#/Eb'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/e.wav'));
                  _addNote(Note('e', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('E'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/f.wav'));
                  _addNote(Note('f', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('F'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/fs.wav'));
                  _addNote(Note('f', 4, 4, 1));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('F#/Gb'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/g.wav'));
                  _addNote(Note('g', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('G'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/gs.wav'));
                  _addNote(Note('g', 4, 4, 1));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('G#/Ab'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/a.wav'));
                  _addNote(Note('a', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('A'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/as.wav'));
                  _addNote(Note('a', 4, 4, 1));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('A#/Bb'),
              ),
              ElevatedButton(
                onPressed: () {
                  player.play(AssetSource('audio/b.wav'));
                  _addNote(Note('b', 4, 4, 0));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text('B'),
              ),
            ]),
          ],
        ),
      ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
