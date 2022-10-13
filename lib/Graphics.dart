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
    double radius = 3;

    // draws the staff
    canvas.drawLine(Offset(0, size.height * 0.3), Offset(size.width, size.height * 0.3), paint);
    canvas.drawLine(Offset(0, size.height * 0.4), Offset(size.width, size.height * 0.4), paint);
    canvas.drawLine(Offset(0, size.height * 0.5), Offset(size.width, size.height * 0.5), paint);
    canvas.drawLine(Offset(0, size.height * 0.6), Offset(size.width, size.height * 0.6), paint);
    canvas.drawLine(Offset(0, size.height * 0.7), Offset(size.width, size.height * 0.7), paint);

    // for(String note in noteList) {
    for(int i = 0; i < noteList.length; i++) {
      double xPosition = notePosition[i];
      if(noteList[i] =='c') {
        double y = -28; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.7*y),paint);
      }
      else if(noteList[i] =='cs') {
        double y = -28; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.7*y),paint);
      }
      else if(noteList[i] =='d') {
        double y = -30; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.5*y),paint);
      }
      else if(noteList[i] =='ds') {
        double y = -30; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.5*y),paint);
      }
      else if(noteList[i] =='e') {
        double y = -32; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.4*y),paint);
      }
      else if(noteList[i] =='f') {
        double y = -34.5; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.3*y),paint);
      }
      else if(noteList[i] =='fs') {
        double y = -34.5; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.3*y),paint);
      }
      else if(noteList[i] =='g') { // correct
        double y = -38; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(-radius+xPosition,size.height+y),Offset(-radius+xPosition,size.height*0.5-0.2*y),paint);
      }
      else if(noteList[i] =='gs') {
        double y = -20; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(radius+xPosition,size.height+y),Offset(radius+xPosition,size.height*0.5+0.8*y),paint);
      }
      else if(noteList[i] =='a') {
        double y = -22; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(radius+xPosition,size.height+y),Offset(radius+xPosition,size.height*0.5+0.8*y),paint);
      }
      else if(noteList[i] =='as') {
        double y = -22; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(radius+xPosition,size.height+y),Offset(radius+xPosition,size.height*0.5+0.8*y),paint);
      }
      else if(noteList[i] =='b') {
        double y = -24.5; // Current y-direction offset; determines note
      
        canvas.drawCircle(Offset(xPosition,size.height+y), radius, paint);
        canvas.drawLine(Offset(radius+xPosition,size.height+y),Offset(radius+xPosition,size.height*0.5+0.8*y),paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}