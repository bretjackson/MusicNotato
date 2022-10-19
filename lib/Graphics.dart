import 'dart:math';

import 'package:flutter/material.dart';

import 'Note.dart';

class Graphics extends CustomPainter {
  // String noteName;
  double x; // Current x-direction offset; determines positioning of note in the x-direction
  List<Note> noteList;
  List<double> notePosition;

  String currentClef;
  List<double> trebleBasePositions = [-3,-2.5,-2,-1.5,-1,-0.5,0];
  List<double> altoBasePositions = [0,0.5,1,1.5,2,2.5,3];
  List<double> bassBasePositions = [3,3.5,4,4.5,5,5.5,6];

  Graphics(this.x, this.noteList, this.notePosition, this.currentClef);

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

    for(int i = 0; i < noteList.length; i++) {
      Note currentNote = noteList[i];
      double xPosition = notePosition[i]; // x-coordinate of the note to be drawn
      // String noteName = noteList[i].note; // name of the current note
      double position = calculatePosition(currentNote.note, noteList[i].octave, currentClef); // position of the current note on the staff
      double y = -position*x; // y-coordinate of the note to be drawn
      // int duration = noteList[i].duration; // length of the current note
      // int dotted = noteList[i].dotted; // whether the note is dotted or not
      if(currentNote.duration == 1 || currentNote.duration == 2) {
        paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, y-2) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore();
        // canvas.drawLine(Offset(xPosition+0.6*x, y), Offset(xPosition+0.6*x, y-3.5), paint); 
        // canvas.save();
        // canvas.translate(xPosition,0);
        // canvas.rotate(-20*(pi/180));
        // Rect noteHead = Offset(0, y) & Size((748/512)*x, x);
        // canvas.drawOval(noteHead, paint);
        // canvas.translate(-xPosition,0);
        // canvas.restore();
        canvas.drawLine(Offset(xPosition-position*0.317*x+1.6*x, y), Offset(xPosition-position*0.317*x+1.6*x, y-3.5*x), paint); 
      }
      else {
        paint = Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 2.0;
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, y-2) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition+40,0);
        canvas.restore();
        canvas.drawLine(Offset(xPosition-position*0.3*x+1.6*x, y), Offset(xPosition-position*0.3*x+1.6*x, y-3.5*x), paint); 
      }
    }

    // for(int i = 0; i < noteList.length; i++) {
    //   double xPosition = notePosition[i];
    //   if(noteList[i] =='c') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 1.5*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore();
    //     canvas.drawLine(Offset(xPosition+0.7*x, 1.5*x), Offset(xPosition+0.7*x, 5*x), paint); 
    //   }
    //   else if(noteList[i] =='cs') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 1.5*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+0.7*x, 1.5*x), Offset(xPosition+0.7*x, 5*x), paint); 
    //   }
    //   else if(noteList[i] =='d') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+0.5*x, x), Offset(xPosition+0.5*x, 4.5*x), paint); 
    //   }
    //   else if(noteList[i] =='ds') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+0.5*x, x), Offset(xPosition+0.5*x, 4.5*x), paint); 
    //   }
    //   else if(noteList[i] =='e') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 0.5*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+0.35*x, 0.5*x), Offset(xPosition+0.35*x, 4*x), paint);  
    //   }
    //   else if(noteList[i] =='f') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, -0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+0.15*x, 0), Offset(xPosition+0.15*x, 3.5*x), paint); 
    //   }
    //   else if(noteList[i] =='fs') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, -0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+0.15*x, 0), Offset(xPosition+0.15*x, 3.5*x), paint); 
    //   }
    //   else if(noteList[i] =='g') { // correct
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 3*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+2.5*x, 3*x), Offset(xPosition+2.5*x, -0.5*x), paint); 
    //   }
    //   else if(noteList[i] =='gs') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 3*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+2.5*x, 3*x), Offset(xPosition+2.5*x, -0.5*x), paint); 
    //   }
    //   else if(noteList[i] =='a') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 2.5*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+2.3*x, 2.5*x), Offset(xPosition+2.3*x, -x), paint); 
    //   }
    //   else if(noteList[i] =='as') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 2.5*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+2.3*x, 2.5*x), Offset(xPosition+2.3*x, -x), paint);
    //   }
    //   else if(noteList[i] =='b') {
    //     canvas.save();
    //     canvas.translate(xPosition,0);
    //     canvas.rotate(-20*(pi/180));
    //     Rect noteHead = Offset(0, 2*x-0.15*x) & Size((748/512)*x, x);
    //     canvas.drawOval(noteHead, paint);
    //     canvas.translate(-xPosition,0);
    //     canvas.restore(); 
    //     canvas.drawLine(Offset(xPosition+2.2*x, 2*x), Offset(xPosition+2.2*x, -1.5*x), paint);
    //   }
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}