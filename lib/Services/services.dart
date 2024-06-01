import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsServices{
  Future<List<dynamic>> latestNews()async{

    final response= await http.get(Uri.parse('https://newsdata.io/api/1/latest?apikey=pub_450885b7ec0f31ce85a586d4eba8b29b084d3'));
    if(response.statusCode==200){
     return json.decode(response.body.toString())['result'];
    }else{
      throw Exception('');
    }
  }
}