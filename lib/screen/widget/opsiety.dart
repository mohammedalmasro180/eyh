import 'package:educate_your_hearing/main.dart';
import 'package:flutter/material.dart';
class PanelSong extends StatefulWidget {
  const PanelSong({Key? key}) : super(key: key);

  @override
  _PanelSongState createState() => _PanelSongState();
}

class _PanelSongState extends State<PanelSong> {
  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        Text("data")


      ],
    ),);
  }
}
