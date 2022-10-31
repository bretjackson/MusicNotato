import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:MusicNotato/models/note.dart';

class Graphics extends CustomPainter {
  // String noteName;
  double x; // Current x-direction offset; determines positioning of note in the x-direction
  List<Note> noteList;
  List<double> notePosition;

  double signature;
  double signature_;
  String currentClef;
  List<double> trebleBasePositions = [-3,-2.5,-2,-1.5,-1,-0.5,0];
  List<double> altoBasePositions = [0,0.5,1,1.5,2,2.5,3];
  List<double> bassBasePositions = [3,3.5,4,4.5,5,5.5,6];

  Map<String, Map<String, double>> noteToClefToBasePositions = <String, Map<String, double>>{
    'c': {
      'treble': -3,
      'alto': 0,
      'bass': 3
    },
    'd': {
      'treble': -2.5,
      'alto': 0.5,
      'bass': 3.5
    }
    //TODO: complete me with the rest of the notes
  };

  Graphics(this.x, this.noteList, this.notePosition, this.signature, this.signature_, this.currentClef);

//TODO: replace with noteToClefToBasePositions
  double calculateBasePosition(String noteName, String currentClef) {
    if(noteName == 'c') {
      if(currentClef == 'treble') {
        return trebleBasePositions[0];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[0];
      }
      else {
        return bassBasePositions[0];
      }
    }
    else if(noteName == 'd') {
      if(currentClef == 'treble') {
        return trebleBasePositions[1];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[1];
      }
      else {
        return bassBasePositions[1];
      }
    }
    else if(noteName == 'e') {
      if(currentClef == 'treble') {
        return trebleBasePositions[2];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[2];
      }
      else {
        return bassBasePositions[2];
      }
    }
    else if(noteName == 'f') {
      if(currentClef == 'treble') {
        return trebleBasePositions[3];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[3];
      }
      else {
        return bassBasePositions[3];
      }
    }
    else if(noteName == 'g') {
      if(currentClef == 'treble') {
        return trebleBasePositions[4];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[4];
      }
      else {
        return bassBasePositions[4];
      }
    }
    else if(noteName == 'a') {
      if(currentClef == 'treble') {
        return trebleBasePositions[5];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[5];
      }
      else {
        return bassBasePositions[5];
      }
    }
    else {
      if(currentClef == 'treble') {
        return trebleBasePositions[6];
      }
      else if(currentClef == 'alto') {
        return altoBasePositions[6];
      }
      else {
        return bassBasePositions[6];
      }
    }
  }

  double calculatePosition(String noteName, int octave, String currentClef) {
    double basePosition = calculateBasePosition(noteName, currentClef);
    return basePosition + 3.5*(octave - 4);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;
    double x = size.height/4;

    // Draws the staff
    canvas.drawLine(Offset(0, -2*x), Offset(size.width, -2*x), paint);
    canvas.drawLine(Offset(0, -x), Offset(size.width, -x), paint);
    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(0, x), Offset(size.width, x), paint);
    canvas.drawLine(Offset(0, 2*x), Offset(size.width, 2*x), paint);

    var points = [
      //上面横线
      Offset(10, -2 * x - 5),
      Offset(15, -2 * x - 5),
      Offset(20, -2 * x - 5),
      Offset(25, -2 * x - 5),
      Offset(30, -2 * x - 5),
      //左边竖线
      Offset(5, -2 * x - 5),
      Offset(5, -2 * x),
      Offset(5, -2 * x + 5),
      Offset(5, -2 * x + 10),
      Offset(5, -2 * x + 15),
      Offset(5, -2 * x + 20),
      Offset(5, 2 * x - 20),
      Offset(5, 2 * x - 15),
      Offset(5, 2 * x - 5),
      Offset(5, 2 * x),
      Offset(5, 2 * x + 5),
      //下面横线
      Offset(10, 2 * x + 5),
      Offset(15, 2 * x + 5),
      Offset(20, 2 * x + 5),
      Offset(25, 2 * x + 5),
      Offset(30, 2 * x + 5),
      //右边竖线
      Offset(35, -2 * x - 5),
      Offset(35, -2 * x),
      Offset(35, -2 * x + 5),
      Offset(35, -2 * x + 10),
      Offset(35, -2 * x + 15),
      Offset(35, -2 * x + 20),
      Offset(35, 2 * x - 20),
      Offset(35, 2 * x - 15),
      Offset(35, 2 * x - 5),
      Offset(35, 2 * x),
      Offset(35, 2 * x + 5),
    ];
    //画节拍选择框
    paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawPoints(PointMode.points, points, paint);

    //画节拍分子分母
    var textPainter = TextPainter(
        text: TextSpan(
          text: '${signature}\n${signature_}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout();
    textPainter.paint(canvas,
        Offset(20 - (textPainter.width / 2), 0 - (textPainter.height / 2)));
    
    for(int i = 0; i < noteList.length; i++) {
      Note currentNote = noteList[i];
      double xPosition = notePosition[i]; // x-coordinate of the note to be drawn
      double position = calculatePosition(currentNote.note, noteList[i].octave, currentClef); // position of the current note on the staff
      print(position);
      double y = -position*x; // y-coordinate of the note to be drawn

      if(currentNote.duration == 1 || currentNote.duration == 2) { // draws an untilled notehead (notehead for whole and half notes)
        paint = _drawNoteHead(paint, canvas, xPosition, y, x, false);
      }
      else { // draws a filled notehead (notehead for all other notes)
        paint = _drawNoteHead(paint, canvas, xPosition, y, x, true);
      }
      if(currentNote.duration != 1) {
        double stemEndX;
        double stemEndY;
        if(position > 0) { // draws a stem going down
          stemEndX = xPosition-position*0.35*x+1.6*x-(748/512)*x;
          stemEndY = y+3.5*x;
          canvas.drawLine(Offset(xPosition-position*0.35*x+1.6*x-(748/512)*x, y), Offset(xPosition-position*0.35*x+1.6*x-(748/512)*x, y+3.5*x), paint); 
        } // draws a stem going up
        else {
          stemEndX = xPosition-position*0.317*x+1.6*x;
          stemEndY = y-3.5*x;
          canvas.drawLine(Offset(xPosition-position*0.317*x+1.6*x, y), Offset(xPosition-position*0.317*x+1.6*x, y-3.5*x), paint); 
        }
        if(currentNote.duration != 4) {
          if(position > 0) {
            canvas.drawLine(Offset(stemEndX,stemEndY), Offset(stemEndX+x,stemEndY-1.5*x), paint);
          }
          else {
            canvas.drawLine(Offset(stemEndX,stemEndY), Offset(stemEndX+x,stemEndY+1.5*x), paint);
          }
          if(currentNote.duration != 8) {
            if(position > 0) {
            canvas.drawLine(Offset(stemEndX,stemEndY-0.5*x), Offset(stemEndX+x,stemEndY-2*x), paint);
            }
            else {
              canvas.drawLine(Offset(stemEndX,stemEndY+0.5*x), Offset(stemEndX+x,stemEndY+2*x), paint);
            }
            if(currentNote.duration != 16) {
              if(position > 0) {
                canvas.drawLine(Offset(stemEndX,stemEndY-x), Offset(stemEndX+x,stemEndY-2.5*x), paint);
              }
              else {
                canvas.drawLine(Offset(stemEndX,stemEndY+x), Offset(stemEndX+x,stemEndY+2.5*x), paint);
              }
            }
          }
        }
      }
      if(currentNote.dotted == 1) {
        canvas.drawCircle(Offset(xPosition + 1.75*x, y), 0.15*x, paint);
      }
      if(position > 2.5 || position < -2.5) {
        canvas.drawLine(Offset(xPosition-1.25*x, y+0.3*x), Offset(xPosition+0.75*x, y+0.3*x), paint);
      }
    }
  }

  Paint _drawNoteHead(Paint paint, Canvas canvas, double xPosition, double y, double x, bool isFilled) {
    paint = Paint()
    ..style = isFilled? PaintingStyle.fill : PaintingStyle.stroke
    ..strokeWidth = 2.0;
    canvas.save();
    canvas.translate(xPosition,0);
    canvas.rotate(-20*(pi/180));
    Rect noteHead = Offset(0, y-2) & Size((748/512)*x, x);
    canvas.drawOval(noteHead, paint);
    canvas.translate(-xPosition,0);
    canvas.restore();
    return paint;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}