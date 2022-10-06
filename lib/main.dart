import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class StaffLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.black..strokeWidth = 1.0;
    
    canvas.drawLine(Offset(0, size.height*0.3), Offset(size.width, size.height*0.3), paint);
    canvas.drawLine(Offset(0, size.height*0.4), Offset(size.width, size.height*0.4), paint);
    canvas.drawLine(Offset(0, size.height*0.5), Offset(size.width, size.height*0.5), paint);
    canvas.drawLine(Offset(0, size.height*0.6), Offset(size.width, size.height*0.6), paint);
    canvas.drawLine(Offset(0, size.height*0.7), Offset(size.width, size.height*0.7), paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

class D extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.black..strokeWidth = 1.0;
    double radius = 4;
    
    canvas.drawCircle(Offset(0,size.height), radius, paint);
    canvas.drawLine(Offset(radius,size.height),Offset(radius,size.height*0.5),paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Notato',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Music Notato'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
    final player = AudioPlayer();

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
// //       _counter++;
//     });
//   }
  
  // void _addC() {
  //   setState(() {
      
  //   });
  // }
  
  // void _addCSharp() {
  //   setState(() {
      
  //   });
  // }
  
  // void _addD() {
  //   setState(() {
  //     CustomPaint(
  //       size: Size(50,50),
  //       painter: D(),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//              ),
//              Text(
//                '$_counter',
//                style: Theme.of(context).textTheme.headline4,
//              ),
//              const Text(
//                'Text',
//              ),
//             ElevatedButton(
//               onPressed: _incrementCounter,
//               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
//               child: const Text('A'),
//             ),
              CustomPaint(
                size: const Size(1000, 50),
                // size: Size(context.size!.width, context.size!.height), // does not work; compile error
                painter: StaffLine(),
              ),
//               CustomPaint(
//                 size: Size(50,50),
//                 painter: D(),
//               ),
            ButtonBar(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/c.wav'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('C'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/c#.wav'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('C#/Db'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // CustomPaint(
                    //   size: Size(50,50),
                    //   painter: D(),
                    // );
                    player.play(AssetSource('audio/d.wav'));
                    // _addD();
                    // var image = Image.asset('/assets/images/quarter.png');
                    // CustomPaint(
                      // size: Size(50,50),
                      // painter: D(),
                    // );
//                     var exampleD = D();
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('D'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/d#.wav'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('D#/Eb'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/e.wav'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('E'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('F'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('F#/Gb'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('G'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('G#/Ab'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('A'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('A#/Bb'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('B'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/1.mp3'));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text('♩'),
                ),
              ]
            ),
          ],
        ),
      ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}