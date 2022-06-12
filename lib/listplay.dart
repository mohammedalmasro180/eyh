import 'dart:convert';

import 'package:educate_your_hearing/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class plylist extends StatefulWidget {
  const plylist({Key? key}) : super(key: key);

  @override
  _plylistState createState() => _plylistState();
}

class _plylistState extends State<plylist> {
  Future getdata() async{

    Uri uri = Uri.parse("https://shahieen.tpowep.com/Material_json");

    http.Response response = await http.get(uri);
    String jsonsDataString = response.body.toString();
    var    _data = jsonDecode(jsonsDataString);
    print(_data);
    return _data;

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("تعلم معنا",style: TextStyle(color: Colors.white),),
          actions: [


            ]
              ),


        body: FutureBuilder(

            future: getdata(),
            builder:(BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {

                return ListView.builder(


                    itemCount: snapshot.data.length,

                    itemBuilder: (context,i) {
                      return
                        InkWell(
                          onTap: (){},

                          child:Card(
                            child: ListTile(
                              title: Column(
                                children: [
                                  ListTile(
                                   title:   Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(2.0),
                                         child: CircleAvatar(
                                           backgroundColor: Colors.white,
                                           radius: 30,
                                           child: Image.network(
                                             "https://shahieen.tpowep.com/uploads/" +
                                                 snapshot.data[i]['img'],
                                           width: 250,
                                             height: 250,

                                           ),
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(2.0),
                                         child: Text(


                                           snapshot.data[i]['address'],
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600),),
                                       ),
                                     ],
                                   ),

trailing:      Padding(
  padding: const EdgeInsets.all(2.0),
  child:   playaudio(url: snapshot.data[i]['link'],),
)
                                    ,
                                  )
                                ],
                                  ),
                              ),


                            ),
                        );


                    }
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
