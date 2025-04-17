import 'dart:io';

import 'package:admin_aerosync/api.dart';
import 'package:admin_aerosync/sample.dart';
import 'package:admin_aerosync/styles.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AddHotel extends StatefulWidget {
  const AddHotel({super.key});

  @override
  State<AddHotel> createState() => _AddHotelState();
}

class _AddHotelState extends State<AddHotel> {
  TextEditingController cityidcontroller = TextEditingController();
  TextEditingController hotelidcontroller = TextEditingController();
  TextEditingController hotelnamecontroller = TextEditingController();
  TextEditingController actualpricecontroller = TextEditingController();
  TextEditingController discountpricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController flatcontroller = TextEditingController();
  TextEditingController bedscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Hotel',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Styles.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: cityidcontroller,
                decoration: const InputDecoration(labelText: 'City Id'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: hotelnamecontroller,
                decoration: const InputDecoration(labelText: 'Hotel Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: actualpricecontroller,
                decoration: const InputDecoration(labelText: 'Actual Price'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: discountpricecontroller,
                decoration: const InputDecoration(labelText: 'Discount Price'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: descriptioncontroller,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: locationcontroller,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: flatcontroller,
                decoration: const InputDecoration(labelText: 'Flat'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: bedscontroller,
                decoration: const InputDecoration(labelText: 'Beds'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String apiurl = 'api/v1/hotels';
                  Map data = {
                    "cityId": cityidcontroller.text,
                    "hotelName": hotelnamecontroller.text,
                    "actualPrice": actualpricecontroller.text,
                    "discountPrice": discountpricecontroller.text,
                    "description": descriptioncontroller.text,
                    "location": locationcontroller.text,
                    "flat": flatcontroller.text,
                    "beds": bedscontroller.text,
                  };
                  dynamic response = await citycheck(data, apiurl);
                  print(response.statusCode.toString());
                  if (response.statusCode == 201) {
                    dynamic data = response.body;

                    if (!mounted) return;
                    QuickAlert.show(
                        onConfirmBtnTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Sample()));
                        },
                        context: context,
                        type: QuickAlertType.success);
                  } else {
                    QuickAlert.show(
                        context: context, type: QuickAlertType.error);
                    print(const SocketException('ERRRRRRRRRR'));
                  }
                },
                child: Text('Add Hotel'))
          ],
        ),
      ),
    );
  }
}
