import 'dart:io';

import 'package:admin_aerosync/api.dart';
import 'package:admin_aerosync/sample.dart';
import 'package:admin_aerosync/styles.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: const Text('Add City',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Styles.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
                  String apiurl = 'api/v1/city';
                  Map data = {
                    "name": namecontroller.text,
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
                                                        const Sample()));
                                          },
                                          context: context,
                                          type: QuickAlertType.success);
                  }else {
                              QuickAlert.show(
                                  context: context, type: QuickAlertType.error);
                              print(const SocketException('ERRRRRRRRRR'));
                            }
                },
                child: const Text('Add City'))
          ],
        ),
      ),
    );
  }
}
