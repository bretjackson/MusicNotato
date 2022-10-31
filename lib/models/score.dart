import 'dart:collection';
import 'package:MusicNotato/models/note.dart';

class Score{
  final List<Note> _allNotes; 
  bool get isEmpty => _allNotes.isEmpty;
  int get length => _allNotes.length;
  
  Score() : _allNotes = List.empty(growable: true);
  Score.fromList(this._allNotes);

  void addNote(Note note){
    _allNotes.add(note);
  }

  List<Note> getAllNotes(){
    return UnmodifiableListView(_allNotes);
  }

  Note getNote(int index){
    return _allNotes[index];
  }


}