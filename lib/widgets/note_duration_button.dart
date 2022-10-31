import 'package:flutter/material.dart';

typedef DurationChangedCallback = Function(int duration);

class NoteDurationButton extends StatefulWidget{
  NoteDurationButton({
    required this.duration,
    required this.buttonText,
    required this.onDurationChanged,
    required this.isSelected
  }) : super(key: ObjectKey(duration));

  final int duration;
  final String buttonText;
  final DurationChangedCallback onDurationChanged;
  final bool isSelected;

  @override
  State<NoteDurationButton> createState() => _NoteDurationButtonState();
}

class _NoteDurationButtonState extends State<NoteDurationButton>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onDurationChanged(widget.duration);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.isSelected ? Colors.green : Colors.blue),
      ),
      child: Text(widget.buttonText),
    );
  }
}
