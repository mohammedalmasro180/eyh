import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';


import 'dart:ui';

import 'package:educate_your_hearing/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart' ;
import 'dart:convert';
import 'package:http/http.dart' as http;

String str="";

class MyMusic extends StatefulWidget {

    @override
 _MyMusicState createState() => _MyMusicState();
}

List list=[];
class _MyMusicState extends State<MyMusic> {
//https://shahieen.tpowep.com/Material_json



  Future getdata() async{

    Uri uri = Uri.parse("https://shahieen.tpowep.com/Material_json");

    http.Response response = await http.get(uri);
    String jsonsDataString = response.body.toString();
    var    _data = jsonDecode(jsonsDataString);
    print(_data);

    return _data;

  }

  //
  // Future getdata() async{
  //
  //   Uri uri =
  //
  //   Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //   final response = await http.get(uri);
  //
  //
  //   List data=jsonDecode(response.body)as List;
  //
  //
  //
  //   setState(() {
  //     for (var i = 0; i < data.length; i++) {
  //    list.add(data[i]['title']);
  //       //     print(items);+
  //     }
  //   });
  //
  // }

  @override
  void initState() {
//    getdata();
    super.initState();
  }  /// More examples see https://github.com/flutterchina/dio/tree/master/example


  String title="";

  AudioPlayer advancedPlayer =new AudioPlayer(mode:PlayerMode.MEDIA_PLAYER );
  double vis=0.0;
  String singer="";

  String cover="";
  String correnSong="";
  bool Player=false;
  Duration duration=new Duration();

  void plaMusic(String url){
    if(Player && correnSong!=url){
      advancedPlayer.pause();
      int result=advancedPlayer.play(url) as int;
      if(result==1) {

        setState(() {
          correnSong=url;
        });
      }else if(!Player){

        int result=advancedPlayer.play(url) as int;
        if(result==1) {
          correnSong = url;
          setState(() {
            Player = true;
          });
        }
      }
    }
  }


  IconData btn=Icons.play_circle_filled_rounded;


  @override


  Widget build(BuildContext context) {
    getdata();




    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child:
          FutureBuilder(
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return  ListView.builder(
                  itemCount: 8,


                  itemBuilder: (context,i) {
                    return ListTile(
                      title: Text(
                        snapshot.data[i]['address'].toString(),
                      ),
                      subtitle:  PlayerWidget(url: "https://e.top4top.io/m_2331zuvsz1.mp3"),
                    );


                  }
              );
            },

          ),
          ),
          Opacity(
            opacity: vis,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white,boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 8.0,
                ),
              ]),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 55,
                            height: 55,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(image: AssetImage(cover),
                                    fit: BoxFit.cover)

                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Column(

                            children: [
                              Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                              SizedBox(height: 5.0,),
                              Text(singer, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey),),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PlayerWidget(url: "https://c.top4top.io/m_2134t7pbx1.mp3"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],),
                  ),

                ],
              ),

            ),
          ),
        ],
      ),

    );
  }
}

