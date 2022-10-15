import 'dart:math';

import 'package:flutter/material.dart';

class Graphics extends CustomPainter {
  String noteName;
  double x; // Current x-direction offset; determines positioning of note in the x-direction
  List<String> noteList;
  List<double> notePosition;

  Graphics(this.noteName, this.x, this.noteList, this.notePosition);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;
    double x = size.height/4;

    // Draws the staff
    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(0, x), Offset(size.width, x), paint);
    canvas.drawLine(Offset(0, 2*x), Offset(size.width, 2*x), paint);
    canvas.drawLine(Offset(0, 3*x), Offset(size.width, 3*x), paint);
    canvas.drawLine(Offset(0, 4*x), Offset(size.width, 4*x), paint);

    for(int i = 0; i < noteList.length; i++) {
      double xPosition = notePosition[i];
      if(noteList[i] =='c') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 1.5*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore();
        canvas.drawLine(Offset(xPosition+0.7*x, 1.5*x), Offset(xPosition+0.7*x, 5*x), paint); 
      }
      else if(noteList[i] =='cs') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 1.5*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+0.7*x, 1.5*x), Offset(xPosition+0.7*x, 5*x), paint); 
      }
      else if(noteList[i] =='d') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+0.5*x, x), Offset(xPosition+0.5*x, 4.5*x), paint); 
      }
      else if(noteList[i] =='ds') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+0.5*x, x), Offset(xPosition+0.5*x, 4.5*x), paint); 
      }
      else if(noteList[i] =='e') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 0.5*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+0.35*x, 0.5*x), Offset(xPosition+0.35*x, 4*x), paint);  
      }
      else if(noteList[i] =='f') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, -0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+0.15*x, 0), Offset(xPosition+0.15*x, 3.5*x), paint); 
      }
      else if(noteList[i] =='fs') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, -0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+0.15*x, 0), Offset(xPosition+0.15*x, 3.5*x), paint); 
      }
      else if(noteList[i] =='g') { // correct
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 3*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+2.5*x, 3*x), Offset(xPosition+2.5*x, -0.5*x), paint); 
      }
      else if(noteList[i] =='gs') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 3*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+2.5*x, 3*x), Offset(xPosition+2.5*x, -0.5*x), paint); 
      }
      else if(noteList[i] =='a') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 2.5*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+2.3*x, 2.5*x), Offset(xPosition+2.3*x, -x), paint); 
      }
      else if(noteList[i] =='as') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 2.5*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+2.3*x, 2.5*x), Offset(xPosition+2.3*x, -x), paint);
      }
      else if(noteList[i] =='b') {
        canvas.save();
        canvas.translate(xPosition,0);
        canvas.rotate(-20*(pi/180));
        Rect noteHead = Offset(0, 2*x-0.15*x) & Size((748/512)*x, x);
        canvas.drawOval(noteHead, paint);
        canvas.translate(-xPosition,0);
        canvas.restore(); 
        canvas.drawLine(Offset(xPosition+2.2*x, 2*x), Offset(xPosition+2.2*x, -1.5*x), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}