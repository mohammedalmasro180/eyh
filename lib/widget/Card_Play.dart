import 'package:flutter/material.dart';

import '../main.dart';
class Card_Player extends StatefulWidget {

  final String address;
  final String img;
  final String arttis;
  final String url;
  const Card_Player
      ({Key? key,required this.arttis,required this.address,required this.img,required this.url}) : super(key: key);

  @override
  _Card_PlayerState createState() => _Card_PlayerState();
}

class _Card_PlayerState extends State<Card_Player> {
  @override
  Widget build(BuildContext context) {
    return
      Card(
        child: ListTile(
          title: Column(
            children: [
              ListTile(
                title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: 75,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image:DecorationImage(image: NetworkImage(

                                "https://shahieen.tpowep.com/uploads/" +
                                    widget.img                ),
                            ),
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.address, style: TextStyle(
                                fontWeight: FontWeight.w600),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.arttis,
                              style: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.w100),),
                          ),
                        ],
                      ),
                    ]    ),





                trailing: Column(
                  children: [
                    playaudio(url:widget.url,                ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                  ],
                )
                ,
              )
            ],
          ),
        ),


      );
  }
}
