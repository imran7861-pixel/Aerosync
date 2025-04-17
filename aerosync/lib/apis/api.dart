import 'dart:convert';
import 'dart:developer';
import 'package:aerosync/models/cities.dart';
import 'package:aerosync/models/hotelbycity.dart';

import 'package:aerosync/models/taxibycity.dart';
import 'package:aerosync/models/test.dart';
import 'package:http/http.dart' as http;

// String mainUrl = "http://85.194.73.98/service/api/Request/NewRequest";
// String mainUrl = "http://85.194.73.98/service/";
String authUrl = "http://192.168.1.6:6001/";

String cityUrl = "http://192.168.1.6:8000/";
String bookUrl = "http://192.168.1.6:6003/";
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

Future<List<Data>> citycheck(data, String cityapiurl) async {
  final String urlapi = cityUrl + cityapiurl;
  final url = Uri.parse(urlapi);
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
    },
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body)['data'];
    print(jsonResponse.toString());
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

Future taxicheck(data, String cityapiurl) async {
  final String urlapi = cityUrl + cityapiurl;
  final url = Uri.parse(urlapi);
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
    },
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((data) => TaxiData.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<FlightData>> flightcheck(data, String cityapiurl) async {
  final String urlapi = cityUrl + cityapiurl;
  final Uri url = Uri.parse(urlapi).replace(queryParameters: data);
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
    },
  );
  if (response.statusCode == 200) {
    final dynamic jsonResponse = json.decode(response.body)['data'];

    if (jsonResponse is List) {
      return jsonResponse.map((data) => FlightData.fromJson(data)).toList();
    } else if (jsonResponse is Map<String, dynamic>) {
      return [FlightData.fromJson(jsonResponse)];
    } else {
      throw Exception('Unexpected data format');
    }
  } else {
    throw Exception('Failed to load data');
  }
}


Future<List<HotelData>> hotelcheck(data, String cityapiurl) async {
  final String urlapi = cityUrl + cityapiurl;
  final url = Uri.parse(urlapi).replace(queryParameters: data);
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
    },
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body)['data'];
    print(jsonResponse.toString());
    return jsonResponse.map((data) => HotelData.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
bookingcheck(data, apiurl) async {
  final String urlapi = bookUrl + apiurl;
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