import 'dart:convert';

import 'package:http/http.dart'as http;
class Services_Data{
static  Future getdata() async{

    Uri uri = Uri.parse("https://shahieen.tpowep.com/MaterialRohani_json");

    http.Response response = await http.get(uri);
    String jsonsDataString = response.body.toString();
    var    _data = jsonDecode(jsonsDataString);
    print(_data);
    return _data;

  }

}