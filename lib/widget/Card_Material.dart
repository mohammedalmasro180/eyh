import 'package:flutter/material.dart';
class Card_Material extends StatefulWidget {

  final String address;
  final String img;
  final String arttis;

  const Card_Material({Key? key,required this.address,required this.img,required this.arttis}) : super(key: key);

  @override
  _Card_MaterialState createState() => _Card_MaterialState();
}

class _Card_MaterialState extends State<Card_Material> {
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
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image:DecorationImage(image: NetworkImage(

                                "https://shahieen.tpowep.com/uploads/" +
                            widget.img)
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
                    ],
                  ),


                )
              ],
            ),
          ),


        );}
}
