import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() => runApp(IntroScreen());

class IntroScreen extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: Colors.purple,
        title: Text('Welcome'),
        body: Text('This is a Xylophone App'),
        mainImage: Image.asset(
          'images/xylophone.png',
          width: 285,
          height: 285,
          alignment: Alignment.center,
        )),
    PageViewModel(
        pageColor: Colors.blue,
        title: Text('Oshin & Shuddho'),
        body: Text('I made this app for them'),
        mainImage: Image.asset(
          'images/oshin_shuddho.jpg',
          width: 350,
          height: 350,
          alignment: Alignment.center,
        ),
        titleTextStyle: TextStyle(fontSize: 30, letterSpacing: 2)),
    PageViewModel(
        pageColor: Colors.cyan,
        title: Text('Oshin & Shuddho'),
        body: Text('Play with this app and give me feedback'),
        mainImage: Image.asset(
          'images/oshin_shuddho1.jpg',
          width: 350,
          height: 350,
          alignment: Alignment.center,
        ),
        titleTextStyle: TextStyle(fontSize: 30, letterSpacing: 2))
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XylophoneApp',
      home: Scaffold(
        body: Builder(
          builder: (context) => IntroViewsFlutter(
            pages,
            showNextButton: false,
            showSkipButton: false,
            onTapDoneButton: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => XylophoneApp()));
            },
          ),
        ),
      ),
    );
  }
}

class XylophoneApp extends StatelessWidget {
  void playMe(int i) {
    final player = AudioCache();
    player.play('note$i.wav');
  }

  Widget playButton(int i, Color btncolor) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        color: btncolor,
        onPressed: () {
          playMe(i);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            playButton(1, Colors.red),
            playButton(2, Colors.orange),
            playButton(3, Colors.yellow),
            playButton(4, Colors.green),
            playButton(5, Colors.cyan),
            playButton(6, Colors.blue),
            playButton(7, Colors.purple),
          ],
        )),
      ),
    );
  }
}
