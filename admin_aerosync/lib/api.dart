import 'dart:convert';

import 'package:http/http.dart' as http;

// String mainUrl = "http://85.194.73.98/service/api/Request/NewRequest";
// String mainUrl = "http://85.194.73.98/service/";
String authUrl = "http://192.168.172.172:6001/";

String cityUrl = "http://192.168.172.172:8000/";
String bookUrl = "http://192.168.172.172:6003/";
usercheck(data, apiurl) async {
  final String urlapi = authUrl + apiurl;
  final url = Uri.parse(urlapi);
  final bodyjson = json.encode(data);
  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      },
      body: bodyjson);
  return response;
}

citycheck(data, apiurl) async {
  final String urlapi = cityUrl + apiurl;
  final url = Uri.parse(urlapi);
  final bodyjson = json.encode(data);
  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      },
      body: bodyjson);
  return response;
}
