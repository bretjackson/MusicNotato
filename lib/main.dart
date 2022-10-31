import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MusicNotato/Save.dart';
import 'package:MusicNotato/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //https://mightytechno.com/screen-orientation-in-flutter/
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const MyApp());
  });
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
      home: HomePage(title: 'Music Notato', storage: Save()),
    );
  }
}

