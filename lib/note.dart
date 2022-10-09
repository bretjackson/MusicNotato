class Note {
  //a, b, c, d, e, f, g, r (for rest)
  String note;
  int octave;
  //if duration is x, this note is a 1/2^x note.
  int duration;
  // -2 is double flat, -1 is flat, 0 is natural, 1 is sharp, 2 is double sharp
  int accidental;

  Note(this.note, this.octave, this.duration, this.accidental);
  Note.rest(this.duration)
      : note = "r",
        accidental = 0,
        octave = 0;
}
