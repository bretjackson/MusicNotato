import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'Graphics.dart';
import 'Note.dart';
import 'PlayingPage.dart';
import 'Save.dart';

void main() {
  runApp(const MyApp());
}

Save save = Save();
List<Note> _allNotes = save.getAllNotes();

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
    Note? currentNote;
    String currentNoteString = '';
    String noteName = '';
    double x = 20;
    List<String> noteList = [];
    List<double> notePosition = [];

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
      noteName = currentNote.note;
      noteList.add(noteName);
      notePosition.add(x+15);
      x += 15;
      _allNotes.add(currentNote);
      print(noteList);
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
              painter: Graphics(noteName, x, noteList, notePosition),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => playingPage()),
          );
        },
        tooltip: 'Go to playing page',
        child: const Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
