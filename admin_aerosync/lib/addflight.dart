import 'dart:io';

import 'package:admin_aerosync/api.dart';
import 'package:admin_aerosync/sample.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AddFlight extends StatefulWidget {
  const AddFlight({super.key});

  @override
  State<AddFlight> createState() => _AddFlightState();
}

class _AddFlightState extends State<AddFlight> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(labelText: 'City Name'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String apiurl = 'api/v1/flight';
                  Map data = {
                   "flightNumber": "3",
            "airplaneId": "5",
            "cityId": 4,
            "arrivalCityName": "Bidar",
            "departureCityName": "pune",
            "arrivalAirportName": "Bidar International Airport",
            "departureAirportName": "Pune International Airport",
            "arrivalTime": "2024-05-12T22:38:12.000Z",
            "departureTime": "2024-05-12T21:38:12.000Z",
            "price": "5000",
            "totalSeats": "250",
                  };
                  dynamic response = await citycheck(data, apiurl);
                  print(response.statusCode.toString());
                  if (response.statusCode == 201) {
                    dynamic data = response.body;

                    if (!mounted) return;
                    QuickAlert.show(
                                          onConfirmBtnTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Sample()));
                                          },
                                          context: context,
                                          type: QuickAlertType.success);
                  }else {
                              QuickAlert.show(
                                  context: context, type: QuickAlertType.error);
                              print(const SocketException('ERRRRRRRRRR'));
                            }
                },
                child: Text('Add City'))
          ],
        ),
      ),
    );
  }
}
