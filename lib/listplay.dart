import 'dart:convert';

import 'package:educate_your_hearing/data/Services_Data.dart';
import 'package:educate_your_hearing/main.dart';
import 'package:educate_your_hearing/widget/Card_Material.dart';
import 'package:educate_your_hearing/widget/Card_Play.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class plylist extends StatefulWidget {
  const plylist({Key? key}) : super(key: key);

  @override
  _plylistState createState() => _plylistState();
}

class _plylistState extends State<plylist> {


  String url='';
  String address='';
  String img='';
  String artits='';

  double op=0.0 ;


  @override
  Widget build(BuildContext context) {
    Size size;
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("روحاني",style: TextStyle(color: Colors.white),),
          actions: [


            ]
              ),


        body: FutureBuilder(

            future: Services_Data.getdata(),
            builder:(BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {

    return
    SafeArea(
    child: Column(
    children: [
    Expanded(
    flex: 12,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(


    itemCount: snapshot.data.length,

    itemBuilder: (context,i) {
      return
        InkWell(
            onTap: () {
              setState(() {
                url = snapshot.data[i]['link'];
//usPlay=true;
                op = 1;
                address = snapshot.data[i]['address'];
                img = snapshot.data[i]['img'];
                artits= snapshot.data[i]['artits'];
              });
            },

            child: Card_Material
              (address: snapshot.data[i]['address'],
                img: snapshot.data[i]['img'],
                arttis: snapshot.data[i]['artits']
            )
        );
    }),

    ),
    ),
    Spacer(),
    Expanded(
    flex: 2,
    child: Opacity(opacity: op,
    child:
Card_Player
  (address: address,url: url,img: img,arttis: artits,)

    ),
    ),
    ])
    );

              }

              else
                return CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}
