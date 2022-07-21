import 'dart:io';

import 'package:educate_your_hearing/MusicApp.dart';
import 'package:educate_your_hearing/listplay.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: plylist(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class playlist extends StatefulWidget {
  const playlist({Key? key}) : super(key: key);

  @override
  _playlistState createState() => _playlistState();
}

class _playlistState extends State<playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: playaudio(url: 'https://e.top4top.io/m_2331zuvsz1.mp3',),
    );
  }
}

class playaudio extends StatefulWidget {
  final String url;
  const playaudio({Key? key,required this.url}) : super(key: key);


  @override
  _playaudioState createState() => _playaudioState();
}

class _playaudioState extends State<playaudio> {
    final audioPlayer=AudioPlayer();
    Duration duration=Duration.zero;
    Duration position=Duration.zero;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool usPlay=false;
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        usPlay=state==PlayerState.PLAYING;
      });
    });
    audioPlayer.onPlayerStateChanged.listen((newducration) {
      setState(() {
        duration=newducration as Duration;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((newposition) {
      setState(() {
        position=newposition as Duration;
      });
    });

    }
    @override
    void dispose() {
    audioPlayer.dispose();
      // TODO: implement dispose
    super.dispose();
  }
    bool     usPlay=false;
    @override
  Widget build(BuildContext context) {
      String url="";
    usPlay=false;
      return  Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [



             CircleAvatar(
               radius: 22,
               child: IconButton(
                 icon: Icon(
                   usPlay?
                   Icons.pause:Icons.play_arrow,size: 25,),
                 onPressed: () {
                   if(!usPlay){

                     audioPlayer.pause();
                   }
                   else

                   audioPlayer.play(widget.url);

                   },
               ),
             )
          ],
        ),
      );
  }
}
