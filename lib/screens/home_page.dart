import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:MusicNotato/Graphics.dart';
import 'package:MusicNotato/models/note.dart';
import 'package:MusicNotato/screens/playing_page.dart';
import 'package:MusicNotato/Save.dart';
import 'package:MusicNotato/models/score.dart';
import 'package:MusicNotato/widgets/note_duration_button.dart';
import 'package:MusicNotato/widgets/note_button.dart';
import 'package:MusicNotato/widgets/staff_graphic.dart';
import 'package:MusicNotato/widgets/note_graphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.storage});
  final Save storage;
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Note? currentNote;
  String currentNoteString = '';
  String noteName = '';
  double xPosition = 20;
  List<double> notePosition = [];

  String currentSignature = '4/4';
  double signatureBeatsPerMeasure = 4;
  double signatureNoteValue = 4;
  var possibleSignatures = ['4/4', '3/4', '2/4', '2/2'];

  int duration = 4;
  int octave = 4;
  int dotted = 0;
  int accidental =
      0; // not implemented yet (when it is implemented, will also have to implement keys)

  String currentClef = 'treble';

  final player = AudioPlayer();

  Score currentScore = Score();

  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((value) {
      setState(() {
        for (dynamic fakeNote in value) {
          Note note = Note(
              fakeNote['note'],
              fakeNote['octave'],
              fakeNote['duration'],
              fakeNote['dotted'],
              fakeNote['accidental'],
              fakeNote['complete']);
          _addNote(note, saveOnAdd: false);
        }
      });
    });
  }

// For the current note being added, returns the amount of time filled in the measure so far.
// e.g. if the signature is 4/4 and a half note already exists in the measure and you are adding an
// eight note, this will return 1/2+1/8.
  double getFilledTimeInMeasure() {
    double duration_ = 1 / duration;
    double filledTimeInMeasure = 0;
    if (currentScore.isEmpty) {
      filledTimeInMeasure = duration_;
    } else {
      if (currentScore.getNote(currentScore.length - 1).complete == signatureBeatsPerMeasure / signatureNoteValue) {
        filledTimeInMeasure = duration_;
      } else {
        filledTimeInMeasure = duration_ + currentScore.getNote(currentScore.length - 1).complete;
      }
    }
    return filledTimeInMeasure;
  }

  void _handleNotePressed(String noteName){
    _addNote(Note(noteName, octave, duration, dotted, accidental,
                      getFilledTimeInMeasure()));
  }

  void _addNote(Note currentNote, {bool saveOnAdd = true}) {
    setState(() {
      currentScore.addNote(currentNote);
      notePosition.add(xPosition);
      xPosition += 40;
      if (saveOnAdd) {
        widget.storage.writeFile(currentScore.getAllNotes());
      }
    });
    print('completed:${currentNote.complete} ${signatureBeatsPerMeasure / signatureNoteValue}');
    if (currentNote.complete == signatureBeatsPerMeasure / signatureNoteValue) {
      xPosition += 20;
    }
  }

  static const Map<String, int> durationMap = <String, int>{
    'Thirtysecond': 32,
    'Sixteenth': 16,
    'Eighth': 8,
    'Quarter': 4,
    'Half': 2,
    'Whole': 1
  };


  void _handleDurationChanged(int duration) {
    setState(() {
      this.duration = duration;
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
            Listener(
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    size: const Size(1000, 50),
                    // size: Size(context.size!.width, context.size!.height), // does not work; compile error
                    painter: StaffGraphic(
                      signatureBeatsPerMeasure,
                      signatureNoteValue,
                      currentClef,
                    ),
                  ),
                  for (int i=0; i < currentScore.length; i++)
                    CustomPaint(
                      size: const Size(1000, 50),
                      painter: NoteGraphic(
                        currentScore.getNote(i),
                        notePosition[i],
                        currentClef,
                      ),
                    )
                ],
              ),
              onPointerDown: (event) => {
                // when raised button is pressed
                // we display showModalBottomSheet
                showModalBottomSheet<void>(
                  // context and builder are
                  // required properties in this widget
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context1, state) {
                      //这里的state就是setState

                      // Returning SizedBox
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                // Initial Value
                                value: currentSignature,

                                // Down Arrow Icon
                                icon: Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: possibleSignatures.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  if (currentScore.isEmpty) {
                                    state(() {
                                      currentSignature = newValue!;
                                      var str_li = currentSignature.split('/');
                                      print(str_li);
                                      setState(() {
                                        signatureBeatsPerMeasure = double.parse(str_li[0]);
                                        signatureNoteValue = double.parse(str_li[1]);
                                      });
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                )
              },
            ),
            ButtonBar(children: 
              durationMap.entries.map((entry) {
                return NoteDurationButton(duration: entry.value, buttonText: entry.key, onDurationChanged: _handleDurationChanged, isSelected: (entry.value == duration));
               }).toList()
            ),
            ButtonBar(children: <Widget>[
              NoteButton(noteName: 'c', audioFile: 'audio/c.wav', onNotePressed: _handleNotePressed, player: player),
              NoteButton(noteName: 'd', audioFile: 'audio/d.wav', onNotePressed: _handleNotePressed, player: player),
              NoteButton(noteName: 'e', audioFile: 'audio/e.wav', onNotePressed: _handleNotePressed, player: player),
              NoteButton(noteName: 'f', audioFile: 'audio/f.wav', onNotePressed: _handleNotePressed, player: player),
              NoteButton(noteName: 'g', audioFile: 'audio/g.wav', onNotePressed: _handleNotePressed, player: player),
              NoteButton(noteName: 'a', audioFile: 'audio/a.wav', onNotePressed: _handleNotePressed, player: player),
              NoteButton(noteName: 'b', audioFile: 'audio/b.wav', onNotePressed: _handleNotePressed, player: player)
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: const BorderSide(color: Color.fromARGB(255, 124, 24, 157))),
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
